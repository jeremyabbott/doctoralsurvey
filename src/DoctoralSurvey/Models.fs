module DoctoralSurvey.Models

open System.Runtime.Serialization
open Newtonsoft.Json
open Newtonsoft.Json.Serialization
open DoctoralSurvey.Db

[<DataContract>]
type Foo =
  { 
  [<field: DataMember(Name = "foo")>]
  foo : string;
  }

[<DataContract>]
type Bar =
  { 
  [<field: DataMember(Name = "bar")>]
  bar : string;
  }

type QuestionOption = {
    Id: int
    Value: string
}

type Question = {
    Id: int
    Text: string
    Options: array<QuestionOption>
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
                    
                    { Id = q.Id; Text = q.Question; Options = options })

let toJson o =
    let settings = JsonSerializerSettings(ContractResolver = CamelCasePropertyNamesContractResolver())
    JsonConvert.SerializeObject(o, settings)