use Adventureworks2012 
go 

declare @me geography 
declare @kubrick geography 
set @me = geography::STGeomFromText('POINT(-1.141445 52.913183 )', 4326 )
set @kubrick = geography::STGeomFromText('POINT(-0.058648 51.508290 )', 4326 ) 

select @me.ToString()
select @kubrick.ToString() 

select @me 
union all 
select @kubrick 
--STDistance() returns the shortest LineString between two geography types. This is a close approximate to the geodesic distance.
--measuring distance  between them 
select @me.STDistance(@kubrick) /1000.  --divide by 1000 since given in m 


--ordering  by distancefrom yourself
select 

	city
	,addressline1 
	,postalcode 
	,@me.STDistance(SpatialLocation)/1000. DistanceinKm
	, case 
	   when @me.STDistance(SpatialLocation)/1000. between 0 and 1.999 then 'veryclose' 
	   when @me.STDistance(SpatialLocation)/1000. between 2 and 5.999 then 'quiteclose'
	   when @me.STDistance(SpatialLocation)/1000. between 6 and 10.999 then 'notclose'
	     when @me.STDistance(SpatialLocation)/1000. > 10 then 'faraway'
		 end as distance --aliAS DISTINCE

from Person.Address
order by  DistanceinKm asc
