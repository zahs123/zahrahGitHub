--DATES 


select distinct 

	c.[Year] 
	,c.[Month]  

into dbo.Dates 
from dbo.crimedatabase1 c 
group by c.[Year], c.[Month] 


select * from dbo.Dates 
alter table  dbo.Dates add DateID int  Identity  not null  Primary Key 

drop table dbo.Dates 

