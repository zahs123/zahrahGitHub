create view dbo.vw_londondepcount1 as 
SELECT distinct

        de.[LSOA code (2011)]
		,d1.[LSOA name]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv] 
	  ,COUNT(d1.[Crime ID]) [No. of Crimes] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[deprivationtable] de
inner JOIN dbo.LondonLSOA ll
ON ll.[Codes] = de.[LSOA code (2011)] 

join dbo.crimedatabase1 d1
on d1.[LSOA code]= ll.[Codes]


GROUP BY    de.[LSOA code (2011)]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv], d1.[LSOA name]

order by COUNT(d1.[Crime ID])

select * from dbo.vw_londondepcount1