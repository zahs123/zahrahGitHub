select
crimestypebucket,
SUM([2011]) as [ 2011],
SUM([2012]) as [2012],  
SUM([2013]) as [2013], 
SUM([2014]) as [2014], 
SUM([2015]) as [2015]
into dbo.crimestypebuckets 
from dbo.vw_crimescountperyearSUM 
 
GROUP BY crimestypebucket