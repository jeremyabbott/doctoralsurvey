--BEGIN TRAN;
--rollback tran
ALTER TABLE dbo.QuestionOptions ADD [Weight] INT NULL;

GO

UPDATE qo
SET qo.[Weight] = o.[Weight]
FROM dbo.QuestionOptions qo
JOIN dbo.Options o
	ON qo.OptionId = o.Id

DECLARE @singleOptionId INT,
		@manyOptionId INT,
		@questionID INT,
		@stronglyAgreeId INT,
		@agreeId INT,
		@agreeSometimesId INT,
		@disagreeId INT,
		@stronglyDisagreeId INT,
		@surveyID INT,
		@iDontKnowId INT,
		@yesId INT,
		@noId INT,
		@optionId INT;

SELECT @singleOptionId = qt.Id
FROM dbo.QuestionTypes qt
WHERE qt.Name = 'Multiple - Single';

SELECT @manyOptionId = qt.Id
FROM dbo.QuestionTypes qt
WHERE qt.Name = 'Multiple - Many';

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

SELECT @surveyID = Id
FROM dbo.Surveys
WHERE Name = 'Hearing Leader';

SELECT @yesId = Id
FROM dbo.Options WHERE Value = 'Yes';

SELECT @noId = Id
FROM dbo.Options WHERE Value = 'No';

SELECT @iDontKnowId = Id
FROM dbo.Options WHERE Value = 'I don’t know';

-- Question 1
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Do you consider yourself a member of Deaf culture?', 1);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 2
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Do you consider deaf people to be members of a separate, distinct culture?', 2);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 3
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you heard of the term "Deaf culture"?', 3);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 4
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @manyOptionId, 'From the following list, choose what do you consider to be necessary or important aspects of a distinct culture:', 4);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Folk traditions', 7);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 7);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Language', 6);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 6);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Art and literature', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 5);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Music', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 4);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('History', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 3);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Social norms', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Values and beliefs', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @optionId, 1);

-- Question 5
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @manyOptionId, 'From the following list, choose what items you believe deaf people share:', 5);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Folk traditions';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 7);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Language';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 6);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Art and literature';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 5);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Music';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 4);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'History';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Social norms';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Values and beliefs';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES	(@questionID, @optionId, 1);

-- Question 6
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you ever been through a training session, seminar, class, or something similar on Deaf culture or how to interact with a deaf person?', 6);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 7
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you ever read a pamphlet, book, website, or other publicly available information on Deaf culture or how to interact with a deaf person?', 7);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 8
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Are you fluent in American Sign Language or another national sign language?', 8);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 9
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you ever taken an American Sign Language course or seminar?', 9);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 10
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people have their own social rules of interaction (norms).', 10);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 11
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people have shared traditions.', 11);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 12
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people have their own distinct language.', 12);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 13
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people have common values.', 13);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 14
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Do you supervise someone that is Deaf or hard of hearing?', 14);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 15
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Do you ever communicate face to face with your Deaf or hard of hearing subordinate?', 15);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 16
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @singleOptionId, 'If yes, what mode of communication do you use most?', 16, 0);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Writing back and forth', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('You speak and Deaf person lip-reads', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Use of a sign language interpreter', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('You sign yourself', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 17
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @singleOptionId, 'Do you consider your communication successful?', 17, 0);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1),
		(@questionID, @iDontKnowId, 0);

-- Question 18
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number, [Required])
VALUES	(@surveyID, @singleOptionId, 'To what extent would you rate your level of comfort with the communication?', 18, 0);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very comfortable', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very comfortable', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Somewhat comfortable', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Neutral', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Somewhat uncomfortable', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very uncomfortable', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 19
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you ever witnessed a deaf or hard of hearing person being bullied/harassed/ ridiculed or the like?', 19);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 20
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Have you ever bullied/harassed/ridiculed a deaf or hard of hearing person yourself?', 20);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 21
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'If a deaf person approached you and was trying to ask you for help, would you do your best to understand and help them?', 21);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I would definitely help that person', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I would maybe help that person', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @iDontKnowId, 3);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I would maybe not help that person', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I would definitely not help that person', 1);

SET @optionId = SCOPE_IDENTITY();

-- Question 22
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I have to intervene between hearing subordinates and Deaf subordinates in matters of communication.', 22);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 23
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I advocate for the communication needs of my Deaf subordinate (ex. providing an interpreter for staff meetings).', 23);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 24
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'The only difference between Deaf people and hearing people is their inability to hear.', 24);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 25
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are as happy as hearing people.', 25);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 26
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people feel that they are not as good as other people.', 26);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 27
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people are more self-conscious than other people.', 27);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 28
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf workers cannot be as successful as other workers.', 28);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 29
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most hearing people would not want to marry anyone who is deaf.', 29);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 30
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Severely deaf people are usually untidy.', 30);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 31
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are usually sociable.', 31);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 32
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people are not dissatisfied with themselves.', 32);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 33
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are just as self-confident as other people.', 33);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 34
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most people feel uncomfortable when they associate with deaf people.', 34);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 35
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are often less aggressive than hearing people.', 35);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 36
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people have different personalities than hearing people.', 36);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 37
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Very few deaf people are ashamed of their hearing loss.', 37);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 38
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people resent hearing people.', 38);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 39
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are more emotional than other people.', 39);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 40
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people should not expect to lead normal lives.', 40);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 41
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are just as healthy as hearing people.', 41);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 42
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are just as attractive as hearing people.', 42);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 43
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people tend to have family problems.', 43);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 44
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'One of the worst things that could happen to a person would be for him or her to become deaf.', 44);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 45
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deafness is a disease or sickness.', 45);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 46
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deafness is a debilitating condition.', 46);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 47
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people can function in society just as successfully as hearing people.', 47);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 48
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'The only communication mode the Deaf community utilizes is Sign Language.', 48);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 49
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Most deaf people choose not to do anything to fix their problem.', 49);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 50
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are not able to be completely successful in today’s society.', 50);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 51
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people are influenced by how hearing people perceive them.', 51);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 52
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'There is not enough publicly available information on Deaf culture and/or Deaf people.', 52);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 53
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'If I don''t know sign language, the best way to communicate with someone who is deaf is by mouthing the words.', 53);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 54
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Hearing people adequately understand Deaf culture.', 54);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 55
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Hearing people adequately understand how to communicate with a Deaf person.', 55);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 56
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'The words signer and interpreter mean the same thing, and can be used interchangeably.', 56);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 57
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'All deaf people can read lips, and as long as I speak distinctly and look at them, they will always understand every word I have to say.', 57);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 58
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deafness is genetic.  All people who are Deaf will pass Deafness on to their children.', 58);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

-- Question 59
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Deaf people don’t want to be deaf, they are hoping for some miracle cure that will make them hear.', 59);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

DECLARE @veryOftenId INT,
		@fairlyOftenId INT,
		@sometimesId INT,
		@occasionallyId INT,
		@rarelyId INT;

SELECT @veryOftenId = o.Id FROM dbo.Options o WHERE o.Value = 'Very often';
SELECT @fairlyOftenId = o.Id FROM dbo.Options o WHERE o.Value = 'Fairly often';
SELECT @sometimesId = o.Id FROM dbo.Options o WHERE o.Value = 'Sometimes';
SELECT @occasionallyId = o.Id FROM dbo.Options o WHERE o.Value = 'Occasionally';
SELECT @rarelyId = o.Id FROM dbo.Options o WHERE o.Value = 'Rarely';

-- Question 60
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Do you know where you stand with your follower… and do you usually know how satisfied your follower is with what you do?', 60);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @veryOftenId, 5),
		(@questionID, @fairlyOftenId, 4),
		(@questionID, @sometimesId, 3),
		(@questionID, @occasionallyId, 2),
		(@questionID, @rarelyId, 1);

DECLARE @aGreatDealID INT,
		@quiteABitId INT,
		@aFairAmountId INT,
		@aLittleId INT,
		@notABit INT;

SELECT @aGreatDealID = o.Id FROM dbo.Options o WHERE o.Value = 'A great deal';
SELECT @quiteABitId = o.Id FROM dbo.Options o WHERE o.Value = 'Quite a bit';
SELECT @aFairAmountId = o.Id FROM dbo.Options o WHERE o.Value = 'A fair amount';
SELECT @aLittleId = o.Id FROM dbo.Options o WHERE o.Value = 'A little';
SELECT @notABit = o.Id FROM dbo.Options o WHERE o.Value = 'Not a bit';

-- Question 61
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'How well does your follower understand your job problems and needs?', 61);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @aGreatDealID, 5),
		(@questionID, @quiteABitId, 4),
		(@questionID, @aFairAmountId, 3),
		(@questionID, @aLittleId, 2),
		(@questionID, @notABit, 1);

DECLARE @fullyId INT,
		@mostlyId INT,
		@moderatelyId INT,
		@notAtAllId INT;

SELECT @fullyId = o.Id FROM dbo.Options o WHERE o.Value = 'Fully';
SELECT @mostlyId = o.Id FROM dbo.Options o WHERE o.Value = 'Mostly';
SELECT @moderatelyId = o.Id FROM dbo.Options o WHERE o.Value = 'Moderately';
SELECT @notAtAllId = o.Id FROM dbo.Options o WHERE o.Value = 'Not at all';

-- Question 62
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'How well does your follower recognize your potential?', 62);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @fullyId, 5),
		(@questionID, @mostlyId, 4),
		(@questionID, @moderatelyId, 3),
		(@questionID, @aLittleId, 2),
		(@questionID, @notAtAllId, 1);

DECLARE @veryHighId INT,
		@highId INT,
		@smallId INT,
		@noneId INT;

SELECT @veryHighId = o.Id FROM dbo.Options o WHERE o.Value = 'Very high';
SELECT @highId = o.Id FROM dbo.Options o WHERE o.Value = 'High';
SELECT @smallId = o.Id FROM dbo.Options o WHERE o.Value = 'Small';
SELECT @noneId = o.Id FROM dbo.Options o WHERE o.Value = 'None';

-- Question 63
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Regardless of how much formal authority your follower has built into his or her position, what are the chances that your follower would use his or her power to help you solve problems in your work?', 63);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @veryHighId, 5),
		(@questionID, @highId, 4),
		(@questionID, @moderatelyId, 3),
		(@questionID, @smallId, 2),
		(@questionID, @noneId, 1);

-- Question 64
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Again, regardless of the amount of formal authority your follower has, what are the chances that he or she would “bail you out” at his or her expense?', 64);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @veryHighId, 5),
		(@questionID, @highId, 4),
		(@questionID, @moderatelyId, 3),
		(@questionID, @smallId, 2),
		(@questionID, @noneId, 1);

-- Question 65
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I have enough confidence in my follower that I would defend and justify his or her decision if he or she were not present to do so.', 65);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @stronglyAgreeId, 5),
		(@questionID, @agreeId, 4),
		(@questionID, @agreeSometimesId, 3),
		(@questionID, @disagreeId, 2),
		(@questionID, @stronglyDisagreeId, 1);

DECLARE @extremelyEffectiveId INT,
		@betterThanAverageId INT,		
		@averageId INT,
		@worseThanAverageId INT,
		@extremelyIneffectiveId INT;

SELECT @extremelyEffectiveId = o.Id FROM dbo.Options o WHERE o.Value = 'Extremely effective';
SELECT @betterThanAverageId = o.Id FROM dbo.Options o WHERE o.Value = 'Better than average';
SELECT @averageId = o.Id FROM dbo.Options o WHERE o.Value = 'Average';
SELECT @worseThanAverageId = o.Id FROM dbo.Options o WHERE o.Value = 'Worse than average';
SELECT @extremelyIneffectiveId = o.Id FROM dbo.Options o WHERE o.Value = 'Extremely ineffective';

-- Question 66
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'How would you characterize your working relationship with your follower?', 66);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @extremelyEffectiveId, 5),
		(@questionID, @betterThanAverageId, 4),
		(@questionID, @averageId, 3),
		(@questionID, @worseThanAverageId, 2),
		(@questionID, @extremelyIneffectiveId, 1);

-- Question 67
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I supervise at least one Deaf or hard of hearing person.', 67);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options VALUES ('True', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.Options VALUES ('False', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

DECLARE @whiteId INT,
		@blackId INT,
		@hispanicId INT,
		@asianId INT,
		@pacificIslanderId INT,
		@otherId INT;

SELECT @whiteId = o.Id FROM dbo.Options o WHERE o.Value = 'White';
SELECT @blackId = o.Id FROM dbo.Options o WHERE o.Value = 'Black';
SELECT @hispanicId = o.Id FROM dbo.Options o WHERE o.Value = 'Hispanic (nonwhite)';
SELECT @asianId = o.Id FROM dbo.Options o WHERE o.Value = 'Asian';
SELECT @pacificIslanderId = o.Id FROM dbo.Options o WHERE o.Value = 'Pacific Islander';
SELECT @otherId = o.Id FROM dbo.Options o WHERE o.Value = 'Other';

-- Question 68
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I self-identify as...', 68);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @whiteId, 6),
		(@questionID, @blackId, 5),
		(@questionID, @hispanicId, 4),
		(@questionID, @asianId, 3),
		(@questionID, @pacificIslanderId, 2),
		(@questionID, @otherId, 1);

-- Question 69
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 1, 'My age is', 69);

DECLARE	@deafId INT,
		@hardOfHearingId INT,
		@hearingId INT;

SELECT @deafId = o.Id FROM dbo.Options o WHERE o.Value = 'Deaf';
SELECT @hardOfHearingId = o.Id FROM dbo.Options o WHERE o.Value = 'Hard of Hearing';
SELECT @hearingId = o.Id FROM dbo.Options o WHERE o.Value = 'Hearing';

-- Question 70
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I self-identify as...', 70);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @deafId, 3),
		(@questionID, @hardOfHearingId, 2),
		(@questionID, @hearingId, 1);

DECLARE	@maleId INT,
		@femaleId INT;

SELECT @maleId = o.Id FROM dbo.Options o WHERE o.Value = 'Male';
SELECT @femaleId = o.Id FROM dbo.Options o WHERE o.Value = 'Female';

-- Question 71
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'I self-identify as...', 71);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @maleId, 3),
		(@questionID, @femaleId, 2),
		(@questionID, @otherId, 1);

-- Question 72
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Which best describes your parents...', 72);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Both of my parents are hearing';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'One or both of my parents are deaf';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 73
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'How do you prefer to communicate?', 73);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Orally (speech and lip-reading, using what hearing I have)';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Sign language and speech at the same time';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'American Sign Language';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Sign English';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 74
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'Can your mother or father sign?', 74);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight])
VALUES	(@questionID, @yesId, 2),
		(@questionID, @noId, 1);

-- Question 75
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'My siblings self-identify as...', 75);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @deafId, 5);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @hearingId, 4);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @hardOfHearingId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Both Hearing and Deaf';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Both Hearing and Hard of hearing';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 76
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'My marital status is...', 76);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Single, never married';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Married or domestic partnership';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Widowed';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Divorced';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Separated';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 77
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'My spouse or partner self-identifies as', 77);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @deafId, 4);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @hardOfHearingId, 3);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @hearingId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I am single', 1);
SET @optionId = SCOPE_IDENTITY();
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 78
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'What kind of school program did you attend most of the time through high school?', 78);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A hearing school', 6);
SET @optionId = SCOPE_IDENTITY();
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 6);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'An oral school for the deaf';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'A signing school for the deaf';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'A classroom for deaf children in a hearing school';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Attended a hearing school with no deaf program';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @otherId, 1);

-- Question 79
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, @singleOptionId, 'My highest level or degree of education completed', 79);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'No schooling completed';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 11);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Nursery school to 8th grade';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 10);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Some high school, no diploma';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 9);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'High school graduate, diploma or the equivalent (for example: GED)';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 8);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Some college credit, no degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 7);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Trade/technical/vocational training';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 6);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Associate degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 5);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Bachelor’s degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 4);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Master’s degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 3);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Professional degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'Doctorate degree';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);

-- Question 80
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'When you answered these questions, which was true?', 80);

SET @questionID = SCOPE_IDENTITY();

SELECT @optionId = o.Id FROM dbo.Options o WHERE o.Value = 'I relied mostly upon the English sentences';
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 2);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I relied mostly upon the assistance of someone else', 1);
SET @optionId = SCOPE_IDENTITY();
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId, [Weight]) VALUES (@questionID, @optionId, 1);
