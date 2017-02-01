use ldncrimedata

--SELECT ltrim(rtrim([Code])) [Code]
--      ,ltrim(rtrim([Name])) [Name]
--      ,ltrim(rtrim([Area Sq Km])) [Area per Sq Km]
--      ,ltrim(rtrim([People per Sq Km])) [People per Sq Km]
--      ,ltrim(rtrim([Year])) [Year]
--	  ,ltrim(rtrim([Year]+' '+[Code])) Yearcode
--	  into dbo.cleanpopdata
--  FROM dbo.popdata
  

select * from dbo.cleanpopdata 

--drop table dbo.cleanpopdata 
