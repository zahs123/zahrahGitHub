create view [dbo].[LSOA_with_Deprivation1] as
select 

l.[Code]
,l.[Name]
,d.[Index of Multiple Deprivation (IMD) Decile (where 1 is most depr]
,d.[Index of Multiple Deprivation (IMD) Rank (where 1 is most depriv]
from [dbo].[LSOA] l

inner join [dbo].[deprivationtable] d
on l.[Code]=d.[LSOA code (2011)]
GO

select * from [dbo].[LSOA_with_Deprivation1]