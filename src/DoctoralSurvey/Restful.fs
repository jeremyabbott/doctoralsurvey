﻿module DoctoralSurvey.Restful

open System.Text.RegularExpressions
open System.Net.Mail
open Newtonsoft.Json
open Newtonsoft.Json.Serialization
open Suave
open Suave.Operators
open Suave.Http
open Suave.Successful
open Suave.RequestErrors
open Suave.Filters
open DoctoralSurvey.Db
open DoctoralSurvey.Models
open DoctoralSurvey.LoggingUtilities


type RestResource<'a, 'b> = {
  //GetAll : unit -> 'a seq
  Create : 'a -> ApiResult<'b>
}

// 'a -> WebPart
let JSON (v: ApiResult<'a>) =
    let jsonSerializerSettings = new JsonSerializerSettings()
    jsonSerializerSettings.ContractResolver <- new CamelCasePropertyNamesContractResolver()

    JsonConvert.SerializeObject(v, jsonSerializerSettings)
    |> match v.Status with
       | Success -> OK
       | FailedValidation(_) -> BAD_REQUEST     
    >=> Writers.setMimeType "application/json; charset=utf-8"

let fromJson<'a> json =
    JsonConvert.DeserializeObject(json, typeof<'a>) :?> 'a

let getResourceFromReq<'a> (req : HttpRequest) =
    let getString rawForm =
        System.Text.Encoding.UTF8.GetString(rawForm)
    let rawString = req.rawForm |> getString
    log "suave" rawString
    rawString |> fromJson<'a>

let rest (resourceName : string) (resource : RestResource<'a, 'b>) =
    let resourcePath = "/" + resourceName
    path resourcePath >=> choose [
        POST >=> request (getResourceFromReq >> resource.Create >> JSON)
        ]

let mapApiResult status model =
    {
        Status = status
        Entity = model
    }

let saveAnswer responseId (ctx : DbContext) (answer : Models.AnswerRendition) =
    let domain = getAnswerEntity ctx
    
    domain.ResponseId <- responseId

    match answer.Answer with
    | null | "" -> domain.OptionId <- answer.OptionId
    | _ -> domain.Answer <- answer.Answer

    domain.QuestionId <- answer.QuestionId
    ctx.SubmitUpdates()
    domain

let mapAnswer (a : Db.Answer) : Models.AnswerRendition =
    {
        Id = a.Id
        Answer = a.Answer
        OptionId = a.OptionId
        QuestionId = a.QuestionId
    }

let answerResult status (answer: Models.AnswerRendition) : ApiResult<Models.AnswerResult> =
    {
        Status = status
        Entity = 
            {
                Id = answer.Id
                Answer = answer.Answer
                QuestionId = answer.QuestionId
                OptionId = answer.OptionId
            }
    }

let validateEmail email =
    try
        MailAddress(email) |> ignore
        true
    with
        | :? System.FormatException as ex -> false

let isNumeric input =
    Regex.IsMatch(input, @"^[0-9]+$")

let validateAnswer (answer: Models.AnswerRendition) (questions : Models.Question list) : ApiResult<AnswerResult> =
    
    let question = questions |> List.find(fun (q: Models.Question) -> q.Id = answer.QuestionId)
    match answer with
    | {QuestionId = 0} ->
        answerResult (ApiStatus.FailedValidation [|"QuestionId is missing"|]) answer
    | {OptionId = 0; Answer = null} ->
        answerResult (ApiStatus.FailedValidation [|"OptionId or Answer is missing"|]) answer
    | {OptionId = 0; Answer = ""} ->
        answerResult (ApiStatus.FailedValidation [|"OptionId or Answer is missing"|]) answer
    | a when a.OptionId > 0 && not (System.String.IsNullOrEmpty(a.Answer)) ->
        answerResult (ApiStatus.FailedValidation [|"Option and free text answer provided."|]) answer
    | a when question.TypeId = 4 && not (isNumeric a.Answer) ->
        answerResult (ApiStatus.FailedValidation [|"Answer must be a number."|]) answer
    | a when question.TypeId = 5 && not (validateEmail a.Answer) ->
        answerResult (ApiStatus.FailedValidation [|"Answer must be a valid email format."|]) answer
    | _ -> answerResult ApiStatus.Success answer

let validateResponse (response : Models.ResponseRendition) =

    let questions = getQuestions (getContext()) response.SurveyId
    let answers =
        response.Answers
        |> Array.map (fun a -> validateAnswer a questions)

    let valid =
        answers
        |> Array.fold (fun acc a ->
                            let v = match a.Status with
                                    | ApiStatus.Success -> true
                                    | _ -> false
                            v && acc) true
    let status =
        match valid with
        | true -> ApiStatus.Success
        | false -> ApiStatus.FailedValidation [|"Invalid Answers. Please see Answers collection for details"|]
    {
        Status = status
        Entity =
        {
            ResponseResult.Id = response.Id
            Identifier = response.Identifier
            SurveyId = response.SurveyId
            Answers = answers
        }
    }

let saveResponse (response : Models.ResponseRendition) =
    log "suave" "saveResponse"
    log "suave" (JsonConvert.SerializeObject(response))
    let validatedResponse = validateResponse response
    match validatedResponse.Status with
    | FailedValidation(_) -> validatedResponse
    | Success ->
        let ctx = getContext()
        let domain = getResponseForSurvey ctx response.SurveyId
        let savedResponse = Db.saveResponse ctx domain
        let saveAnswerForResponse = saveAnswer savedResponse.Id

        let answers = 
            response.Answers
            |> Array.toSeq
            |> Seq.map (fun a -> saveAnswerForResponse ctx a)
            |> Seq.map mapAnswer
            |> Seq.toArray

        log "suave" "savedResponse"
        log "suave" (JsonConvert.SerializeObject(savedResponse))
        let savedResult = sprintf "savedAnswers %s" <| (JsonConvert.SerializeObject(answers))
        log "suave" savedResult

        validatedResponse

let responseWebPart = rest "response" {
  Create = saveResponse
}

let questionsWebPart =
    let questions surveyId = getQuestions (getContext()) surveyId |> Models.toJson
    pathScan "/questions/%d" (fun surveyId -> OK (questions surveyId))
        >=> Writers.setMimeType "application/json; charset=utf-8"

let getSurveys =
    warbler (fun _ -> 
        let ctx = getContext()
        let mapSurvey (surveyEntity : Db.Survey) =
            {
                Id = surveyEntity.Id
                Name = surveyEntity.Name
                ConsentLetter = surveyEntity.ConsentLetter
                ConsentVideoUrl = surveyEntity.ConsentVideoUrl
                CoverLetter = surveyEntity.CoverLetter
                CoverLetterVideoUrl = surveyEntity.CoverLetterVideoUrl
            }
        
        GET >=> path "/surveys" >=>
            (getSurveys ctx
            |> List.map mapSurvey
            |> mapApiResult ApiStatus.Success
            |> JSON)
    )