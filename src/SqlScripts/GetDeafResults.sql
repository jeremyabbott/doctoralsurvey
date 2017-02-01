declare @questionTypeId int, @deafSurveyID INT;

SELECT @deafSurveyID = s.Id
FROM dbo.Surveys s
WHERE s.Name = 'DEAF';

select @questionTypeId = Id
from dbo.QuestionTypes qt
where qt.Name = 'Multiple - Many';

create table #ColumnNames(Number varchar(255), OrderBy int);
insert into #ColumnNames(number, OrderBy)
-- get distinct column names
select distinct
	case
		when q.QuestionTypeId = @questionTypeId then LTRIM(RTRIM(STR(q.number) + o.Value))
		else LTRIM(RTRIM(STR(q.Number)))
	end,
	q.Number
from dbo.Questions q
left join dbo.QuestionOptions qo
	ON qo.QuestionId = q.Id
left join dbo.Options o
	on qo.OptionId = o.Id
where q.SurveyId = @deafSurveyID
order by q.Number, 1;

create table #Results (Number varchar(225), Answer varchar(255), responseId int, SortField int);
insert into #results(number, answer, responseId, SortField)
select
	case
		when q.QuestionTypeId = @questionTypeId then LTRIM(RTRIM(STR(q.number) + o.Value))
		else LTRIM(RTRIM(STR(q.Number)))
	end,
	case
		when a.OptionId is null then a.Answer
		else LTRIM(RTRIM(STR(qo.SpssCode)))
	end,
	r.Id,
	q.Number
from dbo.Responses r
join dbo.Answers a
	on r.id = a.ResponseId
join dbo.Questions q
	on a.QuestionId = q.Id
left join dbo.Options o
	on a.OptionId = o.id
left join dbo.QuestionOptions qo
	on o.Id = qo.OptionId
	and q.Id = qo.QuestionId
where q.SurveyId = @deafSurveyID
order by Q.Number, o.Id

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT ',' + QUOTENAME(cn.Number) 
                    from #ColumnNames cn
                    order by cn.OrderBy
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = 'SELECT ResponseId,' + @cols + ' from 
             (
                select ResponseId, Number, Answer
                from #Results
            ) x
            pivot 
            (
                MAX(Answer)
                for Number in (' + @cols + ')
            ) p '

execute(@query);

drop table #ColumnNames
drop table #Results;
