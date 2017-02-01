select distinct 
	l.LSOAID
	,l.Code
	,l.[Area per Sq Km]
	,l.Name 
	,l.[People per Sq Km]
	,l.Year
into dbo.LSOAscrubbed  --INTO MUST GO BEFORE THE FROM 
from dbo.crimecentral c


inner join dbo.LSOA l on c.LSOAID = l.LSOAID
--into dbo.LSOAscrubbed 
--order by name 

where 1=1
and  l.Name not like '%Manchester%'  
and  l.Name not like  '%Leeds%'
and  l.Name not like '%Lancaster%' 
