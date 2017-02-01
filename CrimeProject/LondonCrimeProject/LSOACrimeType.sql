/****** Script for SelectTopNRows command from SSMS  ******/ 
create view dbo.vw_typescountperlocation as 
SELECT
	  ls.LSOAID
	  ,ls.Name
	  ,ct.[Crime type]
	  ,COUNT(c.[CrimeTypeID]) [Crime type ID count]

	  
  FROM [ldncrimedata].[dbo].[crimecentral] c
inner JOIN dbo.LSOA ls on ls.LSOAID = c.LSOAID 

--JOIN dbo.latslongs la ON la.latlongID = c.latlongID 
inner join dbo.Crimetype ct on ct.CrimeTypeID = c.CrimeTypeID
GROUP BY ls.LSOAID,ls.Name, ct.[Crime type]

order by ls.Name
select * from dbo.vw_typescountperlocation

 
drop view dbo.vw_typescountperlocation  