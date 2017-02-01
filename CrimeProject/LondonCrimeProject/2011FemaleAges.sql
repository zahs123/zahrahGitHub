USE [ldncrimedata]
GO

SELECT [Area Codes]
      ,[Name]
      ,replace([All Ages], ',' , '')  [All Ages] 
      ,[0-9]
      ,[10-19]
      ,[20-29]
      ,[30-39]
      ,[40-49]
      ,[50-59]
      ,[60-69]
      ,[70-79]
      ,[80-89]
      ,[90+] 
	into [dbo].[2011FemaleAgesTable ]
  FROM [dbo].[2011FemaleAges]
GO

delete from dbo.[2011FemaleAgesTable] where [Name] = '' 