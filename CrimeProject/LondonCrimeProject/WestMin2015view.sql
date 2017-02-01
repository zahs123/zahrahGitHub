create view dbo.vw_londonwest2015ctype as 
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

where d1.[Year]= '2015' and [LSOA code (2011)]= 'E01033595' -- since most common code
GROUP BY    de.[LSOA code (2011)]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv], d1.[LSOA name],d1.[Year],d1.[Crime type] 

--order by COUNT(d1.[Crime ID])

select * from dbo.vw_londonwest2015ctype