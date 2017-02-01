/****** Script for SelectTopNRows command from SSMS  ******/ 
create view dbo.vw_crimesperhead2014 as 
SELECT 
	  l.[Codes]
	  ,a.[Name]
	  ,a.[All Ages]
	 ,cast((COUNT(c.[Crime ID])) as float) / a.[All Ages] [Crimes Per Head] 
	  
FROM dbo.crimedatabase1 c1
inner JOIN dbo.crimecentral c
ON c1.[Crime ID] = c.[Crime ID] 
inner join dbo.[2014AllAgesTable] a
on a.[Area Codes] = c1.[LSOA code]  
inner join dbo.LondonLSOA l
on l.[Codes] = c1.[LSOA code]

 
GROUP BY l.Codes, a.[All Ages],a.[Name]
select * from dbo.vw_crimesperhead2014