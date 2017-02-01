 
SELECT 
	  l.[Codes]
	  ,a.[Name]
	  ,a.[All Ages]
	 ,cast((COUNT(c.[Crime ID])) as float) / a.[All Ages] [Crimes Per Head] 
into dbo.crimesperhead2014t   
FROM dbo.crimedatabase1 c1
inner JOIN dbo.crimecentral c
ON c1.[Crime ID] = c.[Crime ID] 
inner join dbo.[2014AllAgesTable] a
on a.[Area Codes] = c1.[LSOA code]  
inner join dbo.LondonLSOA l
on l.[Codes] = c1.[LSOA code]

 
GROUP BY l.Codes, a.[All Ages],a.[Name]

