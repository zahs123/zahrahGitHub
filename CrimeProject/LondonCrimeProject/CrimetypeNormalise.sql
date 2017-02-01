
select distinct 

	 [Crime type]

into dbo.Crimetype 
from dbo.crimedatabase1 c 

group by  [Crime type] 

alter table  dbo.Crimetype add CrimeTypeID int  Identity not null Primary Key 

select * from dbo.Crimetype