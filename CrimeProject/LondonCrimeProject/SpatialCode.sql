 alter table dbo.locationdata add SpacialCoordinate geography
 
 update ldncrimedata.dbo.locationdata
 set SpacialCoordinate = geography::STGeomFromText('POINT(' +longitude +' '+ latitude +')',4326)