
select distinct 

	 [Last outcome category]

into dbo.Outcome
from dbo.crimedatabase1 

group by  [Last outcome category]

alter table dbo.Outcome  add OutcomeID int  Identity not null Primary Key 

select * from dbo.Outcome