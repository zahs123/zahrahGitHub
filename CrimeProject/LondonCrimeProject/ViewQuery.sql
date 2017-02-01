/****** Script for SelectTopNRows command from SSMS  ******/ 
create view dbo.vw_crimescountpermonth as 
SELECT d.[Month]
	  ,d.[Year],
	  COUNT(c.[Crime ID]) [No. of Crimes] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[crimecentral] c
JOIN dbo.dates d
ON d.DateID = c.DateID
GROUP BY d.[Month]
	  ,d.[Year] 
order by COUNT(c.[Crime ID])
select * from dbo.vw_crimescountpermonth 