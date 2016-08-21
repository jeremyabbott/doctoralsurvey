ALTER TABLE dbo.Surveys ADD Active BIT NOT NULL DEFAULT 0;

GO

INSERT INTO dbo.Surveys(Name, Active)
VALUES	('Hearing Leader', 1),
		('Deaf Follower', 1);