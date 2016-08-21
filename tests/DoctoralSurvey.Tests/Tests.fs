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

//[<TestFixture>]
//type AnswerTests() =
//    [<Test>]
//    member this.SaveAnswer() =
//        let ctx = getContext()
//        let response = getResponseEntity ctx
//        response.SurveyId <- 1
//        let r = saveResponse ctx
//
//        let answer = getAnswerEntity ctx
//        answer.Answer <- "test"
//        answer.QuestionId <- 2        
////        answer.ResponseId <- response.Id
//        ctx.SubmitUpdates()