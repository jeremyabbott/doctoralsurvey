DECLARE @surveyId INT;

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

UPDATE dbo.Questions
SET Required = 1
WHERE Number = 66
	AND SurveyId = @surveyId;
