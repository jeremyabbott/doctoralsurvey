ALTER TABLE dbo.Questions ADD VideoUrl VARCHAR(255) NULL;

GO

DECLARE @surveyId INT;

SELECT @surveyId = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'Deaf Follower';

UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoMwumddMxOxk' WHERE Number = 1 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGob9GQ5fa7yC8' WHERE Number = 2 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGorceIG2RG8CQ' WHERE Number = 3 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoombE0ssVTw8' WHERE Number = 4 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo9vKfnni8DG8' WHERE Number = 5 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoAV4OaISkLmE' WHERE Number = 6 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo-wZITWkK6fM' WHERE Number = 7 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoBtNnsswOhLI' WHERE Number = 8 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoDz_5N6uq5eU' WHERE Number = 9 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoYQC-A1QOGtU' WHERE Number = 10 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoxs6GwSz65gA' WHERE Number = 11 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGomagHaK47SCk' WHERE Number = 12 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoouYuMdxdCno' WHERE Number = 13 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoLO321iltHQY' WHERE Number = 14 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoykrKNnuugfU' WHERE Number = 15 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGobu01OM-jS6o' WHERE Number = 16 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGovJqxqC15rUY' WHERE Number = 17 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoDhZzBsyXcFo' WHERE Number = 18 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo6raiKyb-9LU' WHERE Number = 19 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoz3iBpFSuC0Q' WHERE Number = 20 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGohiZRytaxBMY' WHERE Number = 21 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoIW-Dlq5o5jA' WHERE Number = 22 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGouBzJ7Uvp6M4' WHERE Number = 23 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoqu2dLnALpIg' WHERE Number = 24 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoMJJeFY1qSBU' WHERE Number = 25 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoHcHX_kwa3o4' WHERE Number = 26 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo8c1pRPCY1-8' WHERE Number = 27 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo1vjxNBWIOQQ' WHERE Number = 28 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoWKASIkmJrTI' WHERE Number = 29 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGodh2htVnMcmw' WHERE Number = 30 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoGFnMm0it-Bc' WHERE Number = 31 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoRtx3hlZOv-w' WHERE Number = 32 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGooL4bCqINdkI' WHERE Number = 33 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoVvIHeqF3x10' WHERE Number = 34 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo0HdzscbTg1Q' WHERE Number = 35 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo6Eex4taBUXQ' WHERE Number = 36 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGor01j7ewHmJc' WHERE Number = 37 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo3fbG4KikcR8' WHERE Number = 38 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoHcCXTetcDl4' WHERE Number = 39 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo2QHi9X1hVuA' WHERE Number = 40 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo-dAznBvX7o4' WHERE Number = 41 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo5jLWebyZozw' WHERE Number = 42 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoJf4Pnhn2yPA' WHERE Number = 43 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGosAt-hfLjaR0' WHERE Number = 44 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo5O8IDqLDDU0' WHERE Number = 45 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo6d87bDkDUZI' WHERE Number = 46 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoxL5gzkLybaU' WHERE Number = 47 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo0YiB4rZR-Tw' WHERE Number = 48 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoPwVidt0zv2E' WHERE Number = 49 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo2jRVeex1koM' WHERE Number = 50 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo0qZB40bLSGw' WHERE Number = 51 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo-_j-7FL47ck' WHERE Number = 52 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo00KK74eWLhU' WHERE Number = 53 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoqhYdF704SdU' WHERE Number = 54 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGovuuJ_aal78s' WHERE Number = 55 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoMknM0Ix6plY' WHERE Number = 56 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo14pG5txkZuM' WHERE Number = 57 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGohHwkxpJm1i0' WHERE Number = 58 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo7maI2HhF1AM' WHERE Number = 59 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoo0Wzr6V7jg8' WHERE Number = 60 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGovbuQRJNSvBw' WHERE Number = 61 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoZZ_HMRIgIpQ' WHERE Number = 62 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoUBVEdPbaduU' WHERE Number = 63 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo_sepkrciw-o' WHERE Number = 64 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoxpH2UGLqoHU' WHERE Number = 65 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoIgEjsi5YnSc' WHERE Number = 66 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGon2cGn-4Kc44' WHERE Number = 67 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo1aNe-CV7jEk' WHERE Number = 68 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoHqXpsHPWS9Q' WHERE Number = 69 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGogEKWnF-K-sg' WHERE Number = 70 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo2-vPFrrYvEs' WHERE Number = 71 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoe45pX4SIG18' WHERE Number = 72 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGofME2J6acVt4' WHERE Number = 73 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGonn1zMp4OoHU' WHERE Number = 74 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGo8ncfWl4Tkrc' WHERE Number = 75 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoA6CBeRc5o9o' WHERE Number = 76 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoGdUflTSkduo' WHERE Number = 77 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoTpSX0R4Wf0U' WHERE Number = 78 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoEuCSLKlSM2M' WHERE Number = 79 AND SurveyId = @surveyId
UPDATE dbo.Questions SET VideoUrl = 'https://www.youtube.com/embed/eXNcfIzuWGoWYxClxY7hhc' WHERE Number = 80 AND SurveyId = @surveyId