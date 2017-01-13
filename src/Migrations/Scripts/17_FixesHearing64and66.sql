DECLARE @surveyId INT,
		@questionID INT,
		@stronglyAgreeId INT,
		@agreeId INT,
		@agreeSometimesId INT,
		@disagreeId INT,
		@stronglyDisagreeId INT;

SELECT @stronglyAgreeId = id
FROM dbo.Options
WHERE [Value] = 'Strongly Agree';

SELECT @agreeId = id
FROM dbo.Options
WHERE [Value] = 'Agree';

SELECT @agreeSometimesId = id
FROM dbo.Options
WHERE [Value] = 'Agree Sometimes';

SELECT @disagreeId = id
FROM dbo.Options
WHERE [Value] = 'Disagree';

SELECT @stronglyDisagreeId = id
FROM dbo.Options
WHERE [Value] = 'Strongly Disagree';

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

SELECT @questionID = q.Id
FROM dbo.Questions q
WHERE q.SurveyId = @surveyId
	AND q.Number = 64;

DELETE qo
FROM dbo.QuestionOptions qo
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
	AND q.SurveyId = @surveyId
	AND q.Number = 64
JOIN dbo.Options o
	ON qo.OptionId = o.Id;

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

UPDATE dbo.Questions
SET Required = 0
WHERE Number = 66
	AND SurveyId = @surveyId;
