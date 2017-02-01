/****** Script for SelectTopNRows command from SSMS  ******/ 
create view dbo.vw_crimesperhead2011IMD as 
SELECT 
	  l.[Codes]
	  ,a.[Name]
	  ,a.[All Ages]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv]
	 ,cast((COUNT(c.[Crime ID])) as float) / a.[All Ages] [Crimes Per Head] 
	  
FROM dbo.crimedatabase1 c1
inner JOIN dbo.crimecentral c
ON c1.[Crime ID] = c.[Crime ID] 
inner join dbo.[2011AllAgesTable ] a
on a.[Area Codes] = c1.[LSOA code]  
inner join dbo.LondonLSOA l
on l.[Codes] = c1.[LSOA code] 
join dbo.deprivationtable de
on de.[LSOA code (2011)] = l.[Codes] 


 
GROUP BY l.Codes, a.[All Ages],a.[Name],de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv]
select * from dbo.vw_crimesperhead2011IMD