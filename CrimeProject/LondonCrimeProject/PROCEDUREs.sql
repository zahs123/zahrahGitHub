USE [Adventureworks2012]
GO

SELECT *
  FROM [Production].[ProductSubCategory]

  select 
  * 
  from [production].[ProductCategory]  

alter proc Production.usp_AddSubcategory -- in alter proc here ensure when queried you supply both 
@parentcat nvarchar(50)= null,
@newsubcatname nvarchar(50) = null 
as 
begin 

if @newsubcatname is null 
begin 
	print 'Please supply a subcatname' 
	return 
end 

declare @parentcatid int 
begin try 
	select @parentcatid = productcategoryID 
	from production.ProductCategory 
	where Name = @parentcat 
end try 
begin catch 
	print 'This is not a valid category' 
	return 
end catch 

begin try 
insert into production.ProductSubcategory 
([ProductCategoryID], [Name]) 
values 
(@parentcatid,@newsubcatname) 
end try 
begin catch 
	print 'This is not a valid category'
end catch 

end 

--WHAT DOES BELOW DO? 
--below execute 
exec production.usp_Addsubcategory 'scooter', 'Unicycle' 