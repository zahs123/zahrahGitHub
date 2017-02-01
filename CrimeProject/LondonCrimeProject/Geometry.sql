--GEOGRAPHY LONG N LATS 

declare @shape1 geometry 
declare @shape2 geometry 
declare @line1 geometry 
/* 
LINESTRING 
POINT 
POLYGON 
*/ 


select @shape1 = geometry::STGeomFromText('POLYGON((0 0, 5 0, 10 4, 0 0))',0)
select @shape2 = geometry::STGeomFromText('POLYGON((-1 3, 4 6, 8 3, 0 0, -1 3))',0)
select @line1 = geometry::STGeomFromText('LINESTRING (3 -2, 4 4, 1 4, 17 6,3 -2)',0)
select @shape1 
union all 
select @shape2 
union all 
select @line1 