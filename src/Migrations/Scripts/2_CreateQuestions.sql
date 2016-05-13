insert into Surveys (Name)
values ('Dissertation');

create table QuestionTypes(Id int identity(1,1) primary key not null, Name varchar(255) not null);

insert into QuestionTypes(name)
values	('Text'),
        ('Multiple - Single'),
        ('Multiple - Many');

create table Questions(Id int identity(1,1) primary key not null, Question varchar(500) not null, SurveyId int not null, QuestionTypeId int not null,
    CONSTRAINT FK_Questions_QuestionTypes_QuestionTypeId FOREIGN KEY (QuestionTypeId) 
    REFERENCES dbo.QuestionTypes (Id),
    CONSTRAINT FK_Questions_Surveys_SurveyId FOREIGN KEY (SurveyId) 
    REFERENCES dbo.Surveys (Id));

insert into Questions(Question, SurveyId, QuestionTypeId)
values ('What''s your name?', 1, 1);
