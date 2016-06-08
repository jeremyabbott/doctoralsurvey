module DoctoralSurvey.Restful

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
    req.rawForm |> getString |> fromJson<'a>

let rest (resourceName : string) (resource : RestResource<'a, 'b>) =
    let resourcePath = "/" + resourceName
    path resourcePath >=> choose [
        POST >=> request (getResourceFromReq >> resource.Create >> JSON)
        ]

let saveAnswer responseId (ctx : DbContext) (answer : Models.AnswerRendition) =
    let domain = getAnswerEntity ctx
    domain.Answer <- answer.Answer
    domain.ResponseId <- responseId
    domain.OptionId <- answer.OptionId
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

let validateAnswer (answer: Models.AnswerRendition) : ApiResult<AnswerResult> =
    match answer with
    | {QuestionId = 0} ->
        answerResult (ApiStatus.FailedValidation [|"QuestionId is missing"|]) answer
    | {OptionId = 0; Answer = null} ->
        answerResult (ApiStatus.FailedValidation [|"OptionId or Answer is missing"|]) answer
    | _ -> answerResult ApiStatus.Success answer

let validateResponse (response : Models.ResponseRendition) =
    let answers =
        response.Answers
        |> Array.map (fun a -> validateAnswer a)

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
            Id = response.Id
            Identifier = response.Identifier
            SurveyId = response.SurveyId
            Answers = answers
        }
    }

let saveResponse (response : Models.ResponseRendition) =
    let validatedResponse = validateResponse response
    match validatedResponse.Status with
    | FailedValidation(_) -> validatedResponse
    | Success ->
        let ctx = getContext()
        let domain = getResponseForSurvey ctx response.SurveyId
        let savedResponse = Db.saveResponse ctx domain
        let saveAnswerForResponse = saveAnswer domain.Id

        let answers = 
            response.Answers
            |> Array.toSeq
            |> Seq.map (fun a -> saveAnswerForResponse ctx a)
            |> Seq.map mapAnswer
            |> Seq.toArray

        validateResponse { response with Answers = answers }        

let responseWebPart = rest "response" {
  Create = saveResponse
}