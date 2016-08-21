DECLARE @questionID INT,
		@stronglyAgreeId INT,
		@agreeId INT,
		@agreeSometimesId INT,
		@disagreeId INT,
		@stronglyDisagreeId INT,
		@surveyID INT;

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
WHERE Name = 'Deaf Follower'

INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I call myself Deaf.', 1);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 2
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I feel that I am part of the hearing world.', 2);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 3
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I call myself hard-of-hearing or hearing-impaired.', 3);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 4
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I am comfortable with deaf people.', 4);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 5
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Being involved in the hearing world (and with hearing people) is an important part of my life.', 5);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 6
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I feel that I am part of the deaf world.', 6);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 7
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I am comfortable with hearing people.', 7);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 8
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I often wish I could hear better or become hearing.', 8);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 9
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'My deaf identity is an important part of who I am.', 9);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 10
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Being involved in the deaf world (and with deaf people) is an important part of my life.', 10);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

DECLARE @aGreatDealID INT,
		@somewhatId INT,
		@notAtAllId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A great deal', 3);

SET @aGreatDealID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Somewhat', 2);

SET @somewhatId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Not at all', 0);

SET @notAtAllId = SCOPE_IDENTITY();

-- Question 11
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy going to deaf parties/gatherings?', 11);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 12
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy socializing with hearing people?', 12);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 13
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy attending hearing events/parties/gatherings?', 13);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 14
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy reading magazines/books written by deaf authors?', 14);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 15
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy going to theater events with hearing actresses/actors?', 15);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 16
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy participating in hearing political activities?', 16);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 17
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy watching ASL video-tapes by deaf story-tellers or deaf poets?', 17);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 18
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy attending professional workshops in the hearing world?', 18);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 19
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy going to theater events with deaf actresses/actors?', 19);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 20
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy participating in political activities that promote the rights of deaf people?', 20);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 21
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy participating in or attending hearing athletic competitions?', 21);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 22
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How much do you enjoy attending Deaf-related workshops/conferences (e.g., workshops on Deaf culture or linguistics in ASL)?', 22);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @somewhatId),
		(@questionID, @notAtAllId);

-- Question 23
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my education to be at a deaf school.', 23);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 24
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer it if my roommate was deaf.', 24);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 25
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my children to be hearing.', 25);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 26
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my work environment to be hearing.', 26);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 27
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer that my church/temple is mostly deaf.', 27);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 28
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my partner/spouse to be deaf.', 28);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 29
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer to attend a hearing school or mainstreamed program.', 29);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 30
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my roommate to be hearing.', 30);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 31
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my closest friends to be hearing.', 31);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 32
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my partner/spouse to be hearing.', 32);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 33
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my closest friends to be deaf.', 33);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 34
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer that my church/temple to be mostly hearing.', 34);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 35
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my children be deaf.', 35);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

-- Question 36
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I would prefer my work environment to be deaf.', 36);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyDisagreeId);

DECLARE @excellentLikeANativeId INT,
		@veryGoodId INT,
		@prettyGoodAverageId INT,
		@aLittleId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Excellent/Like a Native', 4);

SET @excellentLikeANativeId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very Good', 3);

SET @veryGoodId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Pretty Good/Average', 2);

SET @prettyGoodAverageId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A Little', 1);

SET @aLittleId = SCOPE_IDENTITY();

-- Question 37
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know important events in American/world history?', 37);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 38
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know names of national heroes (hearing)?', 38);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 39
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know names of popular hearing newspapers and magazines?', 39);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 40
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know names of famous hearing actors and actresses?', 40);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 41
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know names of famous hearing political leaders?', 41);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 42
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know traditions and customs of deaf schools?', 42);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 43
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know names of deaf heroes or well-known deaf people?', 43);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 44
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know important events in Deaf history?', 44);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 45
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know well-known political leaders in the Deaf community?', 45);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 46
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know organizations run by and for Deaf people?', 46);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);


-- Question 47
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you sign using ASL?', 47);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 48
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you understand other people signing in ASL?', 48);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 49
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'When you use ASL, how well do other deaf people understand you?', 49);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 50
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you finger-spell?', 50);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 51
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well can you read other people’s finger-spelling?', 51);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 52
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know current ASL slang or popular expressions in ASL?', 52);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 53
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you speak English using your voice?', 53);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 54
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'In general, how well do hearing people understand your speech?', 54);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 55
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you understand other people when they are speaking in English (i.e., how well do you lip-read?)?', 55);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 56
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you read English?', 56);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 57
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you write in English?', 57);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

-- Question 58
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well do you know English idioms or English expressions?', 58);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @excellentLikeANativeId),
		(@questionID, @veryGoodId),
		(@questionID, @prettyGoodAverageId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

DECLARE @veryOftenId INT,
		@fairlyOftenId INT,
		@sometimesId INT,
		@occasionallyId INT,
		@rarelyId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very often', 5);

SET @veryOftenId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Fairly often', 4);

SET @fairlyOftenId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Sometimes', 3);

SET @sometimesId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Occasionally', 2);

SET @occasionallyId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Rarely', 1);

SET @rarelyId = SCOPE_IDENTITY();

-- Question 59
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Do you know where you stand with your leader… and do you usually know how satisfied your leader is with what you do?', 59);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @veryOftenId),
		(@questionID, @fairlyOftenId),
		(@questionID, @sometimesId),
		(@questionID, @occasionallyId),
		(@questionID, @rarelyId);

DECLARE @quiteABitId INT,
		@aFairAmountId INT,		
		@notABitId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Quite a bit', 4);

SET @quiteABitId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A fair amount', 3);

SET @aFairAmountId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Not a bit', 0);

SET @notABitId = SCOPE_IDENTITY();

-- Question 60
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well does your leader understand your job problems and needs?', 60);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @aGreatDealID),
		(@questionID, @quiteABitId),
		(@questionID, @aFairAmountId),
		(@questionID, @aLittleId),
		(@questionID, @notABitId);

DECLARE @fullyId INT,
		@mostlyId INT,		
		@moderatelyId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Fully', 5);

SET @fullyId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Mostly', 4);

SET @mostlyId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Moderately', 3);

SET @moderatelyId = SCOPE_IDENTITY();

-- Question 61
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How well does your leader recognize your potential?', 61);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @fullyId),
		(@questionID, @mostlyId),
		(@questionID, @moderatelyId),
		(@questionID, @aLittleId),
		(@questionID, @notAtAllId);

DECLARE @veryHighId INT,
		@highId INT,		
		@smallId INT,
		@noneId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Very High', 5);

SET @veryHighId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('High', 4);

SET @highId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Small', 2);

SET @smallId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('None', 0);

SET @noneId = SCOPE_IDENTITY();


-- Question 62
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Regardless of how much formal authority your leader has built into his or her position, what are the chances that your leader would use his or her power to help you solve problems in your work?', 62);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @veryHighId),
		(@questionID, @highId),
		(@questionID, @moderatelyId),
		(@questionID, @smallId),
		(@questionID, @noneId);

-- Question 63
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Again, regardless of the amount of formal authority your leader has, what are the chances that he or she would “bail you out” at his or her expense?', 63);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @veryHighId),
		(@questionID, @highId),
		(@questionID, @moderatelyId),
		(@questionID, @smallId),
		(@questionID, @noneId);

-- Question 64
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I have enough confidence in my leader that I would defend and justify his or her decision if he or she were not present to do so.', 64);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @stronglyAgreeId),
		(@questionID, @agreeId),
		(@questionID, @agreeSometimesId),
		(@questionID, @disagreeId),
		(@questionID, @stronglyAgreeId);

DECLARE @extremelyEffectiveId INT,
		@betterThanAverageId INT,		
		@averageId INT,
		@worseThanAverageId INT,
		@extremelyIneffectiveId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Extremely effective', 5);

SET @extremelyEffectiveId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Better than average', 4);

SET @betterThanAverageId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Average', 3);

SET @averageId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Worse than average', 2);

SET @worseThanAverageId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Extremely ineffective', 0);

SET @extremelyIneffectiveId = SCOPE_IDENTITY();

-- Question 65
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How would you characterize your working relationship with your leader?', 65);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @extremelyEffectiveId),
		(@questionID, @betterThanAverageId),
		(@questionID, @averageId),
		(@questionID, @worseThanAverageId),
		(@questionID, @extremelyIneffectiveId);

DECLARE @employedId INT,
		@unemployedId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Employed', 1);

SET @employedId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Unemployed', 0);

SET @unemployedId = SCOPE_IDENTITY();

-- Question 66
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I am', 66);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @employedId),
		(@questionID, @unemployedId);

DECLARE @whiteId INT,
		@blackId INT,
		@hispanicId INT,
		@asianId INT,
		@pacificIslanderId INT,
		@otherId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('White', 6);

SET @whiteId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Black', 5);

SET @blackId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Hispanic (nonwhite)', 4);

SET @hispanicId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Asian', 3);

SET @asianId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Pacific Islander', 2);

SET @pacificIslanderId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Other', 1);

SET @otherId = SCOPE_IDENTITY();

-- Question 67
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I self-identify as...', 67);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @whiteId),
		(@questionID, @blackId),
		(@questionID, @hispanicId),
		(@questionID, @asianId),
		(@questionID, @pacificIslanderId),
		(@questionID, @otherId);

-- Question 68
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 1, 'My age is', 68);

DECLARE	@deafId INT,
		@hardOfHearingId INT,
		@hearingId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Deaf', 3);

SET @deafId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Hard of Hearing', 2);

SET @hardOfHearingId = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Hearing', 1);

SET @hearingId = SCOPE_IDENTITY();

-- Question 69
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I self-identify as...', 69);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId)
VALUES	(@questionID, @deafId),
		(@questionID, @hardOfHearingId),
		(@questionID, @hearingId);

-- Question 70
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'At what age did you become deaf?', 70);

SET @questionID = SCOPE_IDENTITY();

DECLARE @optionId INT;

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I was born deaf', 6);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Born hearing. Lost my hearing before age 5', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Lost my hearing between age 6 and 10', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Lost my hearing between age 11 and 20', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Lost my hearing after age 21', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I don’t know', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 71
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'I self-identify as...', 71);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Male', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Female', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Other', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 72
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Which best describes your parents...', 72);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Both of my parents are hearing', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('One or both of my parents are deaf', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 73
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'How do you prefer to communicate?', 73);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Orally (speech and lip-reading, using what hearing I have)', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Sign language and speech at the same time', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('American Sign Language', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Sign English', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 74
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'Can your mother or father sign?', 74);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Yes', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('No', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 75
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'My siblings self-identify as...', 75);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @deafId);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @hearingId);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @hardOfHearingId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Both Hearing and Deaf', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Both Hearing and Hard of hearing', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Both Deaf and Hard of hearing', 0);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 76
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'My marital status is...', 76);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Single, never married', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Married or domestic partnership', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Widowed', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Divorced', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Separated', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 77
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'My spouse or partner self-identifies as', 77);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) 
VALUES	(@questionID, @deafId),
		(@questionID, @hardOfHearingId),
		(@questionID, @hearingId);

-- Question 78
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'What kind of school program did you attend most of the time through high school?', 78);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('An oral school for the deaf', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A signing school for the deaf', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('A classroom for deaf children in a hearing school', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Attended a hearing school with no deaf program.', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);
INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @otherId);

-- Question 79
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'My highest level or degree of education completed', 79);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('No schooling completed', 11);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Nursery school to 8th grade', 10);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Some high school, no diploma', 9);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('High school graduate, diploma or the equivalent (for example: GED)', 8);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Some college credit, no degree', 7);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Trade/technical/vocational training', 6);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Associate degree', 5);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Bachelor’s degree', 4);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Master’s degree', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Professional degree', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('Doctorate degree', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

-- Question 80
INSERT INTO dbo.Questions(SurveyId, QuestionTypeId, Question, Number)
VALUES	(@surveyID, 2, 'When you answered these questions, which was true?', 80);

SET @questionID = SCOPE_IDENTITY();

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I relied mostly upon the English sentences', 3);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I relied mostly upon the ASL videos', 2);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);

INSERT INTO dbo.Options(Value, [Weight]) VALUES ('I used both the English and ASL versions', 1);

SET @optionId = SCOPE_IDENTITY();

INSERT INTO dbo.QuestionOptions(QuestionId, OptionId) VALUES (@questionID, @optionId);