DECLARE @surveyId INT = 2;

UPDATE q
SET q.question = replace(q.Question, 'follower', 'deaf employee')
FROM dbo.Questions q
WHERE SurveyId = @surveyId
	AND Number >= 60 AND Number <= 66;