create view dbo.vw_londonwest2011ctype as 
SELECT distinct

        de.[LSOA code (2011)]
		,d1.[LSOA name]
		,d1.[Year]
		,d1.[Crime type] 
	  ,COUNT(d1.[Crime ID]) [No. of Crimes] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[deprivationtable] de
inner JOIN dbo.LondonLSOA ll
ON ll.[Codes] = de.[LSOA code (2011)] 

join dbo.crimedatabase1 d1
on d1.[LSOA code]= ll.[Codes]
join dbo.Dates da 
on da.[Year]= d1.[Year] 

where d1.[Year]= '2011' and [LSOA code (2011)]= 'E01033595'
GROUP BY    de.[LSOA code (2011)]
	  , d1.[LSOA name],d1.[Year],d1.[Crime type] 

