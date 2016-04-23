module Models

open System.Runtime.Serialization
open Newtonsoft.Json
open Newtonsoft.Json.Serialization
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

let getQuestions () =
    [|1..10|]
    |> Array.map (fun i -> { Id = i; Text = "What's your name?"})

let toJson o =
    let settings = JsonSerializerSettings(ContractResolver = CamelCasePropertyNamesContractResolver())
    JsonConvert.SerializeObject(o, settings)