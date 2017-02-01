create view dbo.vw_crimescountperyearSUM as 
SELECT distinct  
      ct.[Crime Type]
	  ,SUM(
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

GROUP BY ct.[Crime type], CASE WHEN d.year IN ('2011','2012','2013','2014','2015') THEN '' END
	
select * from dbo.vw_crimescountperyearSUM 
