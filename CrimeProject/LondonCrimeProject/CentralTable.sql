select
	c.[Crime ID]
	,p.[PoliceID]
	,d.DateID
	,lt.LatlongID
	,ls.[LSOAID]
	,ct.[CrimeTypeID]
	,o.[OutcomeID]
	
into dbo.crimecentral
from dbo.crimedatabase1 c
join dbo.Dates d on c.Year=d.year and d.month=c.month
join dbo.Crimetype ct on c.[Crime type]=ct.[Crime type]
join dbo.Outcome o on c.[Last outcome category]=o.[Last outcome category]
join dbo.Police p on c.[Reported By]=p.[Reported by]
join dbo.latslongs lt on c.Latitude=lt.Latitude and c.Longitude=lt.Longitude
join dbo.LSOA ls on c.Year=ls.[Year] and c.[LSOA code]=ls.[Code]

select * from dbo.crimecentral 

order by [Crime ID] 