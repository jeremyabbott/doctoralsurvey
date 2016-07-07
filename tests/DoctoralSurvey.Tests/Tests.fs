module DoctoralSurvey.Tests

open NUnit.Framework
open DoctoralSurvey.Db

[<TestFixture>]
type ExampleTests() =
    [<Test>]
    member this.When2IsAddedTo2Expect4() = 
        Assert.AreEqual(4, 2+2)

//[<TestFixture>]
//type ResponseTests() =
//    [<Test>]
//    member this.CreateResponseReturnsId() =
//        let ctx = getContext()
//        let s = 
//            query {
//                for survey in ctx.Dbo.Surveys do
//                select survey.Id
//            } |> Seq.toArray
//        let responseEntity = getResponseForSurvey ctx s.[0]
//        let r = saveResponse ctx responseEntity
//        Assert.True(r.Id > 1)