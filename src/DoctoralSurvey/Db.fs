module DoctoralSurvey.Db

open FSharp.Data.Sql

type Sql = SqlDataProvider<ConnectionStringName="dissertation", DatabaseVendor=Common.DatabaseProviderTypes.MSSQLSERVER>

type DbContext = Sql.dataContext
type Survey = DbContext.``dbo.SurveysEntity``
type Question = DbContext.``dbo.QuestionsEntity``

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