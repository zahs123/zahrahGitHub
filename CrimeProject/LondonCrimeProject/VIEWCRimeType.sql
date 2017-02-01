alter view dbo.vw_crimescountperyearSUM as 
with crimestype as -- create CTE 
(SELECT distinct  
      ct.[Crime Type]
	  ,SUM(CASE WHEN d.Year = '2011'  THEN 1 ELSE 0 END) [2011] 
	  ,SUM(CASE WHEN d.Year = '2012'  THEN 1 ELSE 0 END) [2012] 
	  ,SUM(CASE WHEN d.Year = '2013'  THEN 1 ELSE 0 END) [2013] 
	  ,SUM(CASE WHEN d.Year = '2014'  THEN 1 ELSE 0 END) [2014] 
	  ,SUM(CASE WHEN d.Year = '2015'  THEN 1 ELSE 0 END) [2015] 
	  --,COUNT(ct.[Crime Type]) [No. of Crimes] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[crimecentral] c


JOIN dbo.[Crimetype] ct
ON c.CrimeTypeID = ct.CrimeTypeID
JOIN dbo.Dates d 
on d.DateID= c.DateID

GROUP BY ct.[Crime type], CASE WHEN d.year IN ('2011','2012','2013','2014','2015') THEN '' END)

select case when [crime type] in ('Anti-social behaviour') then 'Anti-social behaviour'  
when [crime type] in ('Bicycle theft', 'Burglary', 'Other theft', 'Vehicle crime','shoplifting','Theft from the person') then 'Thefts '  
when [crime type] in ('Criminal damage and arson') then 'Criminal damage and arson' 
when [crime type] in ('Drugs') then 'Drugs' 
when [crime type] in ('Possession of weapons','Public disorder and weapons') then 'Public Disorder and Weapons' 
when [crime type] in ('Other crime','Public order') then 'Other crime' 
when [crime type] in ('Robbery') then 'Robbery' 
when [crime type] in ('Violence and sexual offences','Violent crime') then 'Sexual Offences and Violence'
end crimestypebucket,

[2011],
[2012],
[2013],
[2014],
[2015] 


 from crimestype   








 
