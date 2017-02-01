/****** Script for SelectTopNRows command from SSMS  ******/ 
create view dbo.vw_deprivationcrime as 
SELECT de.[LSOA code (2011)]
	  ,de.[IMD Rank]
	  COUNT(ct.[Crime ID]) [No. of Crimes] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[crimecentral] ct
JOIN dbo.crimedatabase1 cd
ON cd.[Crime ID] = ct.[Crime ID] 

inner join dbo.deprivationtable de 
on de.[LSOA code(2011)] = cd.[LSOA code] 




GROUP BY d.[Month]
	  ,d.[Year] 
order by COUNT(ct.[Crime ID])
select * from dbo.vw_crimescountpermonth 