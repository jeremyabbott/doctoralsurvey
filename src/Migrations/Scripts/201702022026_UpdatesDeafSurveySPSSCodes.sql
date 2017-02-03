DECLARE @deafSurveyID INT;

SELECT
	@deafSurveyID = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'A great deal' THEN 5
		WHEN o.Value = 'Somewhat' THEN 3
		WHEN o.Value = 'Not at all' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
	AND q.SurveyId = @deafSurveyID;

