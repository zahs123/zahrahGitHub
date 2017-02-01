
select distinct 

	 [Reported By]

into dbo.Police
from dbo.crimedatabase1 

group by  [Reported by]

alter table dbo.Police add PoliceID  tinyint  Identity not null Primary Key 

select * from dbo.Police