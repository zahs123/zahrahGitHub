
 select distinct
	Latitude
	,Longitude
	into dbo.latslongs
 from dbo.crimedatabase1

 alter table dbo.latslongs add LatlongID int identity(60000000,1) not null primary key 

 select * from dbo.latslongs