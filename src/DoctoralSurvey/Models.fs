module DoctoralSurvey.Models

open System
open Newtonsoft.Json
open Newtonsoft.Json.Serialization
open DoctoralSurvey.Db

type ApiStatus =
| Success
| FailedValidation of array<string>

type ApiResult<'a> = {
    Status : ApiStatus
    Entity : 'a
}

type QuestionOption = {
    Id: int
    Value: string
}

type Question = {
    Id: int
    Number: int
    Options: array<QuestionOption>
    Required: bool
    Text: string
    TypeId: int
}

type AnswerRendition = {
    Id: int
    Answer: string
    OptionId: int
    QuestionId: int
}

type ResponseRendition = {
    Id: int
    Identifier: Guid
    SurveyId: int
    Answers: AnswerRendition []
}

type AnswerResult = {
    Id: int
    Answer: string
    OptionId: int
    QuestionId: int
}

type ResponseResult = {
    Id: int
    Identifier: Guid
    SurveyId: int
    Answers: array<ApiResult<AnswerResult>>
}

type Survey = {
    Id: int
    Name: string
}

let getQuestions context surveyId =
    getQuestions context surveyId
    |> List.map (fun q ->
                    let options = 
                        match q.QuestionTypeId with
                        | 2 | 3 ->
                            getOptionsForQuestion context q.Id
                            |> List.map (fun o -> { Id = o.Id; Value = o.Value })
                            |> List.toArray
                            
                        | _ -> null
                    
                    { Id = q.Id; Text = q.Question; Options = options; Number = q.Number; TypeId = q.QuestionTypeId; Required = q.Required })

let toJson o =
    let settings = JsonSerializerSettings(ContractResolver = CamelCasePropertyNamesContractResolver())
    JsonConvert.SerializeObject(o, settings)