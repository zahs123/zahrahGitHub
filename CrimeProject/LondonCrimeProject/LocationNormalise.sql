--LOCATION NORMALISATION 
use ldncrimedata

select distinct 

	 c.[Location] 


into dbo.Location 
from dbo.crimedatabase1 c

 
alter table  dbo.Location add LocationID int  Identity Primary Key 

select * from dbo.Location 

drop table  dbo.location 