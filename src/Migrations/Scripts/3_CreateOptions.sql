create table Options (Id int identity(1,1) primary key not null, Value varchar(255) not null);

create table QuestionOptions (Id int identity(1,1) primary key not null, QuestionId int not null, OptionId int not null,
	CONSTRAINT FK_QuestionOptions_Question_QuestionId FOREIGN KEY (QuestionId)
	REFERENCES dbo.Questions (Id),
	CONSTRAINT FK_QuestionOptions_Options_OptionId FOREIGN KEY (OptionId)
	REFERENCES dbo.Options (Id))

insert into Options (Value)
values ('A'),
	   ('B'),
	   ('C'),
	   ('D');

declare @questionId int;

select	@questionId = q.id
from	Questions q
where	q.Question = 'What''s your name?';

insert into QuestionOptions(OptionId, QuestionId)
select	o.Id,
		@questionId
from	Options o;