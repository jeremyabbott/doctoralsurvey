module DoctoralSurvey.Db

open System
open FSharp.Data.Sql

type Sql = SqlDataProvider<ConnectionStringName="dissertation", DatabaseVendor=Common.DatabaseProviderTypes.MSSQLSERVER>

type DbContext = Sql.dataContext
type Survey = DbContext.``dbo.SurveysEntity``
type Question = DbContext.``dbo.QuestionsEntity``
type QuestionType = DbContext.``dbo.QuestionTypesEntity``
type QuestionOption = DbContext.``dbo.OptionsEntity``
type QuestionOptionMap = DbContext.``dbo.QuestionOptionsEntity``
type Response = DbContext.``dbo.ResponsesEntity``
type Answer = DbContext.``dbo.AnswersEntity``

let getContext () = Sql.GetDataContext()

let firstOrNone s = s |> Seq.tryFind (fun _ -> true)

let getSurvey (ctx : DbContext) id : Survey option = 
    query {
        for survey in ctx.Dbo.Surveys do
        where (survey.Id = id)
        select survey
    } |> firstOrNone

let getQuestions (ctx : DbContext) surveyId : Question list =
    query {
        for question in ctx.Dbo.Questions do
        where (question.SurveyId = surveyId)
        select question
    } |> Seq.toList

let getOptionsForQuestion (ctx : DbContext) questionId : QuestionOption list =
    query {
        for questionOptions in ctx.Dbo.QuestionOptions do
            join options in ctx.Dbo.Options on (questionOptions.OptionId = options.Id)
            where (questionOptions.QuestionId = questionId)
            select options
    } |> Seq.toList

let getAnswerEntity (ctx : DbContext) : Answer =
    ctx.Dbo.Answers.Create()

let getResponseEntity (ctx : DbContext) : Response =
    ctx.Dbo.Responses.Create()

let setResponseSurveyId (r : Response) surveyID =
    r.SurveyId <- surveyID
    r

let getResponseForSurvey (ctx : DbContext) = getResponseEntity ctx |> setResponseSurveyId

let saveResponse (ctx : DbContext) (responseEntity: Response) : Response =
    responseEntity.Identifier <- Guid.NewGuid()
    ctx.SubmitUpdates()
    responseEntity

let getSurveys (ctx : DbContext) : Survey list =
    query {
        for survey in ctx.Dbo.Surveys do
        where (survey.Active)
        select survey
    } |> Seq.toList