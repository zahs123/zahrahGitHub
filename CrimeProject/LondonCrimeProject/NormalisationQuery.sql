use [ldncrimedata] 

go 


  SELECT
       c.[Crime ID]
       ,c.[Year]
      ,c.[Month]
      ,c.[Yearcode]
      ,c.[Reported By]
      ,c.[Longitude]
      ,c.[Latitude]
      ,p.[Area per Sq Km]
      ,p.[People per Sq Km]
      ,c.[Location]
      ,c.[LSOA code]
      ,c.[LSOA name]
      ,c.[Crime type]
      ,c.[Last outcome category]
 
      
FROM [dbo].[crimedatabase1] c
  join [dbo].[cleanpopdata] p
on c.Yearcode = p.Yearcode