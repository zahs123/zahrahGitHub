
select distinct 

	 [Code] 
	,[Name]
	,[Year]
	,[People per Sq Km]
	,[Area per Sq Km]

into dbo.LSOA 
from dbo.cleanpopdata p 

alter table  dbo.LSOA add LSOAID int  Identity not null  Primary Key 

select * from dbo.LSOA

--drop table dbo.LSOA 