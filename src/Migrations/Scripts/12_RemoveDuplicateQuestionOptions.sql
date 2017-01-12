DECLARE @questionOptionId INT;

SELECT @questionOptionId = qo.Id
FROM dbo.Questions q
JOIN dbo.Surveys s
	ON q.SurveyId = q.SurveyId
	AND s.Name = 'Hearing Leader'
JOIN dbo.QuestionOptions qo
	ON q.Id = qo.QuestionId
	AND q.Number = 18
JOIN dbo.Options o
	ON qo.OptionId = o.Id
	AND o.Value = 'Very comfortable';

DELETE FROM QuestionOptions WHERE Id = @questionOptionId

SELECT @questionOptionId = qo.Id
FROM dbo.Questions q
JOIN dbo.Surveys s
	ON q.SurveyId = q.SurveyId
	AND s.Name = 'Hearing Leader'
JOIN dbo.QuestionOptions qo
	ON q.Id = qo.QuestionId
	AND q.Number = 78
JOIN dbo.Options o
	ON qo.OptionId = o.Id
	AND o.Value = 'A classroom for deaf children in a hearing school';

DELETE FROM QuestionOptions WHERE Id = @questionOptionId