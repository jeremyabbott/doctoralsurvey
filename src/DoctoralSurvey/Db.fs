module DoctoralSurvey.Db

open FSharp.Data.Sql

type Sql = SqlDataProvider<ConnectionStringName="dissertation", DatabaseVendor=Common.DatabaseProviderTypes.MSSQLSERVER>

type DbContext = Sql.dataContext
type Survey = DbContext.``dbo.SurveysEntity``
type Question = DbContext.``dbo.QuestionsEntity``
type QuestionType = DbContext.``dbo.QuestionTypesEntity``
type QuestionOption = DbContext.``dbo.OptionsEntity``
type QuestionOptionMap = DbContext.``dbo.QuestionOptionsEntity``

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
