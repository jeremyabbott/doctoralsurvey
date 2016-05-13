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

type Question = {
    Id: int
    Text: string
}

let getQuestions context surveyId =
    getQuestions context surveyId
    |> List.map (fun q -> { Id = q.Id; Text = q.Question})

let toJson o =
    let settings = JsonSerializerSettings(ContractResolver = CamelCasePropertyNamesContractResolver())
    JsonConvert.SerializeObject(o, settings)