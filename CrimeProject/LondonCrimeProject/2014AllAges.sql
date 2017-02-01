USE [ldncrimedata]
GO

SELECT [Area Codes]
      ,[Name]
	,[All Ages]
       ,cast([0] as int )
      +cast([1] as int )
      +cast([2] as int )
      +cast([3] as int )
      +cast([4] as int )
      +cast([5] as int )
      +cast([6] as int )
      +cast([7] as int )
      +cast([8] as int )
      +cast([9] as int ) [0-9] 
     ,cast([10] as int )
      +cast([11] as int )
      +cast([12] as int )
      +cast([13] as int )
      +cast([14] as int )
      +cast([15] as int )
      +cast([16] as int )
      +cast([17] as int )
      +cast([18] as int )
      +cast([19] as int ) [10-19] 
      ,cast([20] as int )
      +cast([21] as int )
      +cast([22] as int )
      +cast([23] as int )
      +cast([24] as int )
      +cast([25] as int )
      +cast([26] as int )
      +cast([27] as int )
      +cast([28] as int )
      +cast([29] as int ) [20-29] 
     ,cast([30] as int )
      +cast([31] as int )
      +cast([32] as int )
      +cast([33] as int )
      +cast([34] as int )
      +cast([35] as int )
      +cast([36] as int )
      +cast([37] as int )
      +cast([38] as int )
      +cast([39] as int ) [30-39] 
     ,cast([40] as int )
      +cast([41] as int )
      +cast([42] as int )
      +cast([43] as int )
      +cast([44] as int )
      +cast([45] as int )
      +cast([46] as int )
      +cast([47] as int )
      +cast([48] as int )
      +cast([49] as int ) [40-49] 
     ,cast([50] as int )
      +cast([51] as int )
      +cast([52] as int )
      +cast([53] as int )
      +cast([54] as int )
      +cast([55] as int )
      +cast([56] as int )
      +cast([57] as int )
      +cast([58] as int )
      +cast([59] as int ) [50-59] 
      ,cast([60] as int )
      +cast([61] as int )
      +cast([62] as int )
      +cast([63] as int )
      +cast([64] as int )
      +cast([65] as int )
      +cast([66] as int )
      +cast([67] as int )
      +cast([68] as int )
      +cast([69] as int ) [60-69] 
      ,cast([70] as int )
      +cast([71] as int )
      +cast([72] as int )
      +cast([73] as int )
      +cast([74] as int )
      +cast([75] as int )
      +cast([76] as int )
      +cast([77] as int )
      +cast([78] as int )
      +cast([79] as int ) [70-79] 
      ,cast([80] as int )
      +cast([81] as int )
      +cast([82] as int )
      +cast([83] as int )
      +cast([84] as int )
      +cast([85] as int )
      +cast([86] as int )
      +cast([87] as int )
      +cast([88] as int )
      +cast([89] as int ) [80-89] 
      ,cast([90] as int) [90] 
	  into dbo.[2014AllAgesTable]
  FROM [dbo].[2014AllAges]
GO 

select * from dbo.[2014AllAgesTable]