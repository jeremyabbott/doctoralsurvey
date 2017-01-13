ALTER TABLE dbo.Responses ADD DateSubmitted DATETIME NULL DEFAULT(GETDATE());

GO;

DECLARE @surveyId INT,
		@questionId INT,
		@numberQuestionTypeId INT,
		@emailQuestionTypeId INT,
		@textQuestionTypeId INT;

INSERT INTO dbo.QuestionTypes(Name) VALUES ('Number');

SET @numberQuestionTypeId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionTypes(Name) VALUES ('Email');

SET @emailQuestionTypeId = SCOPE_IDENTITY();

UPDATE dbo.Questions
SET QuestionTypeId = @numberQuestionTypeId
WHERE Question = 'My age is';

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'HEARING';

SELECT @textQuestionTypeId = qt.Id
FROM dbo.QuestionTypes qt
WHERE qt.Name = 'Text';

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @textQuestionTypeId, 'OPTIONAL: What is your name?', 81, 0);

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @emailQuestionTypeId, 'OPTIONAL: What is your email address?', 82, 0);

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @textQuestionTypeId, 'OPTIONAL: What is your name?', 81, 0);

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @emailQuestionTypeId, 'OPTIONAL: What is your email address?', 82, 0);