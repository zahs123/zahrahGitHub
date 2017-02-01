--bcp 

--select * from production.product  

--COMMON TABLE EXPRESSION IN  MEMORY ONLY SO CAN'T PUT INDEXES IN IT  
create proc dbo.uspBuildDateDim
as 
begin 
if object_id('dbo.dimdate') is not null 
begin 
	drop table dbo.dimdate 
end 
;with dt 
as
(
SELECT

	cast('2011-01-01' as date) datavalue 
	,datename(yyyy, cast('2011-01-01' as date)) dtyear
	,datename(qq, cast('2011-01-01' as date)) dtquarter 
	,datename(mm, cast('2011-01-01' as date)) dtmonth 
	,datename(dy, cast('2011-01-01' as date)) dtdayofyear 
	,datename(dw, cast('2011-01-01' as date)) dtweekday  
	,datename(wk, cast('2011-01-01' as date)) dtweek
union all 
select 
	  dateadd(dd,1,dt.datavalue)  
	,datename(yyyy, dateadd(dd,1,dt.datavalue)) dtyear
	,datename(qq, dateadd(dd,1,dt.datavalue)) dtquarter 
	,datename(mm, dateadd(dd,1,dt.datavalue)) dtmonth 
	,datename(dy, dateadd(dd,1,dt.datavalue)) dtdayofyear 
	,datename(dw, dateadd(dd,1,dt.datavalue)) dtweekday  
	,datename(wk, dateadd(dd,1,dt.datavalue)) dtweek 
from dt 
where dateadd(dd,1,dt.datavalue) < getdate() 
) 
select * 
into dbo.Dimdate
from dt 
option(maxrecursion 0)  
end 
