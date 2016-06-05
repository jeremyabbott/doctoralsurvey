--select *
--from dbo.QuestionTypes

ALTER TABLE dbo.Questions ADD Number INT NOT NULL DEFAULT (0);

GO

DECLARE @questionID INT,
		@stronglyAgreeId INT,
		@agreeId INT,
		@agreeSometimesId INT,
		@disagreeId INT,
		@stronglyDisagreeId INT;

DELETE FROM QuestionOptions;
DELETE FROM Options;
DELETE FROM Questions;

INSERT INTO dbo.Options(Value) VALUES ('Strongly Agree');

SET @stronglyAgreeId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value) VALUES ('Agree');

SET @agreeId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value) VALUES ('Agree Sometimes');

SET @agreeSometimesId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value) VALUES ('Disagree');

SET @disagreeId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value) VALUES ('Strongly Disagree');

SET @stronglyDisagreeId = SCOPE_IDENTITY();

-- Question 1
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I call myself Deaf.', 1);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 2
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I feel that I am part of the hearing world.', 2);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 3
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I call myself hard-of- hearing or hearing-impaired.', 3);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 4
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I am comfortable with deaf people.', 4);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 5
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'Being involved in the hearing world (and with hearing people) is an important part of my life.', 5);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 6
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I feel that I am part of the deaf world.', 6);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 7
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I am comfortable with hearing people.', 7);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 8
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'I often wish I could hear better or become hearing.', 8);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 9
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'My deaf identity is an important part of who I am.', 9);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 10
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(1, 2, 'Being involved in the deaf world (and with deaf people) is an important part of my life.', 10);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);