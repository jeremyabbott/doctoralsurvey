ALTER TABLE dbo.QuestionOptions ADD SpssCode INT NULL;

GO

DECLARE @hearingSurveyID INT, @deafSurveyID INT;

SELECT
	@deafSurveyID = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Strongly Agree' THEN 5
		WHEN o.Value = 'Agree' THEN 4
		WHEN o.Value = 'Agree Sometimes' THEN 3
		WHEN o.Value = 'Disagree' THEN 2
		WHEN o.Value = 'Strongly Disagree' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (	1, 2, 3, 4, 5, 6, 7, 8, 9,
					10, 23, 24, 25, 26, 27, 28,
					29, 30, 31, 32, 33, 34, 35,
					36, 64)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'A great deal' THEN 3
		WHEN o.Value = 'Somewhat' THEN 2
		WHEN o.Value = 'Not at all' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Excellent/Like a Native' THEN 5
		WHEN o.Value = 'Very Good' THEN 4
		WHEN o.Value = 'Pretty Good/Average' THEN 3
		WHEN o.Value = 'A Little' THEN 2
		WHEN o.Value = 'Not at all' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (37, 38, 39, 40, 41, 42,
					43, 44, 45, 46, 47, 48, 49,
					50, 51, 52, 53, 54, 55, 56,
					57, 58)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Very often' THEN 5
		WHEN o.Value = 'Fairly often' THEN 4
		WHEN o.Value = 'Sometimes' THEN 3
		WHEN o.Value = 'Occasionally' THEN 2
		WHEN o.Value = 'Rarely' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (59)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'A great deal' THEN 5
		WHEN o.Value = 'Quite a bit' THEN 4
		WHEN o.Value = 'A fair amount' THEN 3
		WHEN o.Value = 'A little' THEN 2
		WHEN o.Value = 'Not a bit' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (60)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Fully' THEN 5
		WHEN o.Value = 'Mostly' THEN 4
		WHEN o.Value = 'Moderately' THEN 3
		WHEN o.Value = 'A Little' THEN 2
		WHEN o.Value = 'Not at all' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (61)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Very High' THEN 5
		WHEN o.Value = 'High' THEN 4
		WHEN o.Value = 'Moderately' THEN 3
		WHEN o.Value = 'Small' THEN 2
		WHEN o.Value = 'None' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (62, 63)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Extremely effective' THEN 5
		WHEN o.Value = 'Better than average' THEN 4
		WHEN o.Value = 'Average' THEN 3
		WHEN o.Value = 'Worse than average' THEN 2
		WHEN o.Value = 'Extremely ineffective' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (65)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Employed' THEN 2
		WHEN o.Value = 'Unemployed' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (66)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'White' THEN 6
		WHEN o.Value = 'Black' THEN 5
		WHEN o.Value = 'Hispanic (nonwhite)' THEN 4
		WHEN o.Value = 'Asian' THEN 3
		WHEN o.Value = 'Pacific Islander' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (67)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 3
		WHEN o.Value = 'Hard of Hearing' THEN 2
		WHEN o.Value = 'Hearing' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (69)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'I was born deaf' THEN 6
		WHEN o.Value = 'Born hearing. Lost my hearing before age 5' THEN 5
		WHEN o.Value = 'Lost my hearing between age 6 and 10' THEN 4
		WHEN o.Value = 'Lost my hearing between age 11 and 20' THEN 3
		WHEN o.Value = 'Lost my hearing after age 21' THEN 2
		WHEN o.Value = 'I don’t know' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (70)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Male' THEN 3
		WHEN o.Value = 'Female' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (71)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Both of my parents are hearing' THEN 2
		WHEN o.Value = 'One or both of my parents are deaf' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (72)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Orally (speech and lip-reading, using what hearing I have)' THEN 4
		WHEN o.Value = 'Sign language and speech at the same time' THEN 3
		WHEN o.Value = 'American Sign Language' THEN 2
		WHEN o.Value = 'Sign English' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (73)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Yes' THEN 2
		WHEN o.Value = 'No' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (74)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 6
		WHEN o.Value = 'Hearing' THEN 5
		WHEN o.Value = 'Hard of Hearing' THEN 4
		WHEN o.Value = 'Both Hearing and Deaf' THEN 3
		WHEN o.Value = 'Both Hearing and Hard of hearing' THEN 2
		WHEN o.Value = 'Both Deaf and Hard of hearing' THEN 1
		WHEN o.Value = 'I do not have any siblings' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (75)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Single, never married' THEN 5
		WHEN o.Value = 'Married or domestic partnership' THEN 4
		WHEN o.Value = 'Widowed' THEN 3
		WHEN o.Value = 'Divorced' THEN 2
		WHEN o.Value = 'Separated' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (76)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 4
		WHEN o.Value = 'Hard of hearing' THEN 3	
		WHEN o.Value = 'Hearing' THEN 2
		WHEN o.Value = 'I am single' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (77)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'An oral school for the deaf' THEN 5
		WHEN o.Value = 'A signing school for the Deaf' THEN 4
		WHEN o.Value = 'A classroom for deaf children in a hearing school' THEN 3
		WHEN o.Value = 'Attended a hearing school with no deaf program.' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (78)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'No Schooling completed' THEN 11
		WHEN o.Value = 'Nursery school to 8th grade' THEN 10
		WHEN o.Value = 'Some high school, no diploma' THEN 9
		WHEN o.Value = 'High school graduate, diploma or the equivalent (for example: GED)' THEN 8
		WHEN o.Value = 'Some college credit, no degree' THEN 7
		WHEN o.Value = 'Trade/technical/vocational training' THEN 6
		WHEN o.Value = 'Associate degree' THEN 5
		WHEN o.Value = 'Bachelor’s degree' THEN 4
		WHEN o.Value = 'Master’s degree' THEN 3
		WHEN o.Value = 'Professional degree' THEN 2
		WHEN o.Value = 'Doctorate degree' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (79)
	AND q.SurveyId = @deafSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'I relied mostly upon the English sentences' THEN 3
		WHEN o.Value = 'I relied mostly upon the ASL Videos' THEN 2
		WHEN o.Value = 'I used both the English and ASL versions' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (80)
	AND q.SurveyId = @deafSurveyID;

SELECT @hearingSurveyID = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'HEARING';

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Yes' THEN 3
		WHEN o.Value = 'No' THEN 2
		WHEN o.Value = 'I don’t know' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (1, 2, 3)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Folk traditions' THEN 7
		WHEN o.Value = 'Language' THEN 6
		WHEN o.Value = 'Art and Literature' THEN 5
		WHEN o.Value = 'Music' THEN 4
		WHEN o.Value = 'History' THEN 3
		WHEN o.Value = 'social norms' THEN 2
		WHEN o.Value = 'Values and beliefs' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (4, 5)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Yes' THEN 2
		WHEN o.Value = 'No' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (6, 7, 8, 9, 19, 20)
	AND q.SurveyId = @hearingSurveyID;


UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Yes' THEN 3
		WHEN o.Value = 'No' THEN 2
		WHEN o.Value = 'I don’t know' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (10, 11, 12, 13, 14, 15, 17)
	AND q.SurveyId = @hearingSurveyID;


UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Writing back and forth' THEN 4
		WHEN o.Value = 'You speak and Deaf person lip-reads' THEN 3
		WHEN o.Value = 'Use of a Sign Language Interpreter' THEN 2
		WHEN o.Value = 'You sign yourself' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (16)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Very comfortable' THEN 5
		WHEN o.Value = 'Somewhat comfortable' THEN 4
		WHEN o.Value = 'Neutral' THEN 3
		WHEN o.Value = 'Somewhat uncomfortable' THEN 2
		WHEN o.Value = 'Very uncomfortable' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (18)
	AND q.SurveyId = @hearingSurveyID;


UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'I would definitely help that person' THEN 5
		WHEN o.Value = 'I would maybe help that person' THEN 4
		WHEN o.Value = 'I don’t know' THEN 3
		WHEN o.Value = 'I would maybe not help that person' THEN 2
		WHEN o.Value = 'I would definitely not help that person' THEN 1
END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (21)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Strongly Agree' THEN 5
		WHEN o.Value = 'Agree' THEN 4
		WHEN o.Value = 'Agree Sometimes' THEN 3
		WHEN o.Value = 'Disagree' THEN 2
		WHEN o.Value = 'Strongly Disagree' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (22, 23, 24, 25, 26, 27, 28,
					29, 30, 31, 32, 33, 34,
					35, 36, 37, 38, 39, 40,
					41, 42, 43, 44, 45, 46,
					47, 48, 49, 50, 51, 52,
					53, 54, 55, 56, 57, 58, 59, 65)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Very often' THEN 5
		WHEN o.Value = 'Fairly often' THEN 4
		WHEN o.Value = 'Sometimes' THEN 3
		WHEN o.Value = 'Occasionally' THEN 2
		WHEN o.Value = 'Rarely' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (60)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'A great deal' THEN 5
		WHEN o.Value = 'Quite a bit' THEN 4
		WHEN o.Value = 'A fair amount' THEN 3
		WHEN o.Value = 'A Little' THEN 2
		WHEN o.Value = 'Not a bit' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (61)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Fully' THEN 5
		WHEN o.Value = 'Mostly' THEN 4
		WHEN o.Value = 'Moderately' THEN 3
		WHEN o.Value = 'A little' THEN 2
		WHEN o.Value = 'Not at all' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (62)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Very High' THEN 5
		WHEN o.Value = 'High' THEN 4
		WHEN o.Value = 'Moderately' THEN 3
		WHEN o.Value = 'Small' THEN 2
		WHEN o.Value = 'None' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (63, 64)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Extremely effective' THEN 5
		WHEN o.Value = 'Better than average' THEN 4
		WHEN o.Value = 'Average' THEN 3
		WHEN o.Value = 'Worse than average' THEN 2
		WHEN o.Value = 'Extremely ineffective' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (66)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'TRUE' THEN 2
		WHEN o.Value = 'FALSE' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (67)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'White' THEN 6
		WHEN o.Value = 'Black' THEN 5
		WHEN o.Value = 'Hispanic (nonwhite)' THEN 4
		WHEN o.Value = 'Asian' THEN 3
		WHEN o.Value = 'Pacific Islander' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (68)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 3
		WHEN o.Value = 'Hard of hearing' THEN 2
		WHEN o.Value = 'Hearing' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (70)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Male' THEN 3
		WHEN o.Value = 'Female' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (71)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Both of my parents are hearing' THEN 2
		WHEN o.Value = 'One or both of my parents are deaf' THEN 1
		WHEN o.Value = 'No Answer' THEN 0
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (72)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Orally (speech and lip-reading, using what hearing I have)' THEN 4
		WHEN o.Value = 'Sign language and speech at the same time' THEN 3
		WHEN o.Value = 'American Sign Language' THEN 2
		WHEN o.Value = 'Sign English' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (73)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Yes' THEN 2	
		WHEN o.Value = 'No' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (74)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 7
		WHEN o.Value = 'Hearing' THEN 6
		WHEN o.Value = 'Hard of Hearing' THEN 5
		WHEN o.Value = 'Both Hearing and Deaf' THEN 4
		WHEN o.Value = 'Both Hearing and Hard of hearing' THEN 3
		WHEN o.Value = 'Both Deaf and Hard of hearing' THEN 2
		WHEN o.Value = 'I do not have any siblings' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (75)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Single, never married' THEN 5
		WHEN o.Value = 'Married or domestic partnership' THEN 4
		WHEN o.Value = 'Widowed' THEN 3
		WHEN o.Value = 'Divorced' THEN 2
		WHEN o.Value = 'Separated' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (76)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'Deaf' THEN 4
		WHEN o.Value = 'Hard of hearing' THEN 3
		WHEN o.Value = 'Hearing' THEN 2
		WHEN o.Value = 'I am single' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (77)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'A hearing school' THEN 6
		WHEN o.Value = 'An oral school for the deaf' THEN 5
		WHEN o.Value = 'A signing school for the deaf' THEN 4
		WHEN o.Value = 'A classroom for deaf children in a hearing school' THEN 3
		WHEN o.Value = 'Attended a hearing school with no deaf program.' THEN 2
		WHEN o.Value = 'Other' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (78)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'No Schooling completed' THEN 11
		WHEN o.Value = 'Nursery school to 8th grade' THEN 10
		WHEN o.Value = 'Some high school, no diploma' THEN 9
		WHEN o.Value = 'High school graduate, diploma or the equivalent (for example: GED)' THEN 8
		WHEN o.Value = 'Some college credit, no degree' THEN 7
		WHEN o.Value = 'Trade/technical/vocational training' THEN 6
		WHEN o.Value = 'Associate degree' THEN 5
		WHEN o.Value = 'Bachelor’s degree' THEN 4
		WHEN o.Value = 'Master’s degree' THEN 3
		WHEN o.Value = 'Professional degree' THEN 2
		WHEN o.Value = 'Doctorate degree' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (79)
	AND q.SurveyId = @hearingSurveyID;

UPDATE qo
SET qo.SpssCode =
	CASE
		WHEN o.Value = 'I relied mostly upon the English sentences' THEN 2
		WHEN o.Value = 'I relied mostly upon the assistance of someone else' THEN 1
	END
FROM dbo.Options o
JOIN dbo.QuestionOptions qo
	ON o.Id = qo.OptionId
JOIN dbo.Questions q
	ON qo.QuestionId = q.Id
WHERE q.Number IN (80)
	AND q.SurveyId = @hearingSurveyID;