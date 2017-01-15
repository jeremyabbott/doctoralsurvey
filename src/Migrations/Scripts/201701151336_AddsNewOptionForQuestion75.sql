DECLARE @optionId INT,
		@surveyId INT,
		@questionId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I do not have any siblings', -1);

SET @optionId = SCOPE_IDENTITY();

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'HEARING';

SELECT @questionId = q.Id
FROM dbo.Questions q
WHERE q.SurveyId = @surveyId
	AND q.Number = 75;

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionId, @optionId, -1);

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

SELECT @questionId = q.Id
FROM dbo.Questions q
WHERE q.SurveyId = @surveyId
	AND q.Number = 75;

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionId, @optionId, -1);