create view dbo.vw_ldn2014cphtimd as 
SELECT distinct

        ph.[Codes]
		,ph.[Name]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv] 
	  ,ph.[Crimes Per Head] [Crimes per head] --CRIME ID is the person commiting the crime therefore count crimes committed/ month and year 

	  
  FROM [ldncrimedata].[dbo].[deprivationtable] de
inner JOIN dbo.LondonLSOA ll
ON ll.[Codes] = de.[LSOA code (2011)] 

join dbo.crimesperhead2014t ph 
on ph.[Codes] = ll.[Codes] 



GROUP BY    ph.[Codes]
	  ,de.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv], ph.[Name],ph.[Crimes Per Head]

select * from dbo.vw_ldn2014cphtimd