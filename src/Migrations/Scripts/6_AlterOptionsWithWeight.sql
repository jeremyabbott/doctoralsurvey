ALTER TABLE dbo.Options ADD [Weight] INT NULL;

GO

UPDATE Options
SET [Weight] = 5
WHERE Value = 'Strongly Agree';

UPDATE Options
SET [Weight] = 4
WHERE Value = 'Agree';

UPDATE Options
SET [Weight] = 3
WHERE Value = 'Agree Sometimes';

UPDATE Options
SET [Weight] = 2
WHERE Value = 'Disagree';

UPDATE Options
SET [Weight] = 1
WHERE Value = 'Strongly Disagree';