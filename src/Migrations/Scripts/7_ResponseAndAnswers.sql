ALTER TABLE Options ALTER COLUMN [Weight] INT NOT NULL;

GO

CREATE TABLE Responses (Id INT PRIMARY KEY IDENTITY(1,1), Identifier UNIQUEIDENTIFIER, SurveyId INT,
	CONSTRAINT FK_Responses_Surveys_SurveyId FOREIGN KEY (SurveyId)
	REFERENCES dbo.Surveys (Id));
GO

CREATE TABLE Answers (Id INT PRIMARY KEY IDENTITY(1,1), ResponseId INT, QuestionId INT, Answer NVARCHAR(255) NULL, OptionId INT NULL,
	CONSTRAINT FK_Answers_Responses_ResponseId FOREIGN KEY (ResponseId)
	REFERENCES dbo.Responses (Id),
	CONSTRAINT FK_Answers_Questions_QuestionId FOREIGN KEY (QuestionId)
	REFERENCES dbo.Questions (Id),
	CONSTRAINT FK_Answers_Options_OptionId FOREIGN KEY (OptionId)
	REFERENCES dbo.Options (Id));