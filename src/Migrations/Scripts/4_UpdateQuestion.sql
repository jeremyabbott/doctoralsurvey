UPDATE	dbo.Questions
SET		Question = 'Pick a letter.',
		QuestionTypeId = 2
WHERE	Question = 'What''s your name?'
			AND SurveyId = 1;