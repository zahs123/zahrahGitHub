USE [ldncrimedata]
 
drop table crimedatabase 
create table crimedatabase 

( 
	[Crime ID] varchar(200) 
	,[Month] varchar(200) 
	,[Year] varchar(200)
	,[Reported By] varchar(200) 
	,[Longitude] varchar(200) 
	,[Latitude] varchar(200)
	,[Location] varchar(200) 
	,[LSOA code] varchar(200) 
	,[LSOA name] varchar(200) 
	,[Crime type] varchar(200) 
	,[Last outcome category] varchar(200) 


) 
truncate table crimedatabase
insert into crimedatabase --newtablename
(    
	[Month]  
	,[Year]
	,[Reported By] 
	,[Longitude] 
	,[Latitude] 
	,[Location] 
	,[LSOA code] 
	,[LSOA name] 
	,[Crime type] 
	,[Last outcome category] 
	 )
 


SELECT 
       RIGHT(rtrim(ltrim([Month])),2)
      ,LEFT(rtrim(ltrim([Month])),4) 
      ,rtrim(ltrim([Reported by]))
      ,rtrim(ltrim([Longitude]))
      ,rtrim(ltrim([Latitude]))
	  ,substring(rtrim(ltrim([Location])),CHARINDEX('near',rtrim(ltrim([Location])),1)+5,len(rtrim(ltrim([Location])))) Location
      ,rtrim(ltrim([LSOA code]))
      ,rtrim(ltrim([LSOA name]))
      ,rtrim(ltrim([Crime type]))
      ,case rtrim(ltrim([Last outcome category])) when '' then 'No Further Investigation' 
	  else rtrim(ltrim([Last outcome category])) end as [Last outcome category]


  FROM [dbo].[crimedata]



  where len(latitude) <> 0 and len(longitude) <> 0  and len([LSOA code]) <> 0 
  and len([LSOA name]) not in ('','28','29','30','33','23','21','24','26','22','9')   

  alter table dbo.crimedatabase drop column [Crime ID] 
  alter table dbo.crimedatabase add [Crime ID] int Identity not null primary key 

  select * from crimedatabase 



SELECT [Month]
      ,[Year]
      ,[Reported By]
      ,[Longitude]
      ,[Latitude]
      ,[Location]
      ,[LSOA code]
      ,[LSOA name]
      ,[Crime type]
      ,[Last outcome category]
      ,[Crime ID]
	  ,[year]+' '+[LSOA code] [Yearcode]
	into dbo.crimedatabase1
  FROM [dbo].[crimedatabase]
GO

select * from dbo.crimedatabase1 

drop table  crimedatabase1 