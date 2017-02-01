USE [Adventureworks2012]
GO

SELECT 
     *
  FROM [Production].[Product]
  
  dbcc opentran -- tells you if any transactions are left open  SPID IS 55 thereforew use exec below...
  exec sp_who 55 
  
  begin tran
  update Production.Product 
  set 
	ListPrice = 0 
	,StandardCost = StandardCost * 1.1  
	,Color = isnull(Color, 'NA') 
commit tran
--rollback tran  

--REMVOING DISCONTINUED DATE 
update p
set 
	p.DiscontinuedDate = GETDATE() 
from production.product p  

left join sales.SalesOrderDetail sd 
on p.ProductID=sd.ProductID 
where sd.salesorderid is null 

--CHALLENGE CHANGE ORICE OF POPULAR PRODUCTS ANY PRODUCT THAT HAS SOLD MORE THAN ORDER QTY>2 BY 20% 
--begin tran 
update p 
set p.listprice = p.listprice * 1.2 
from production.product p 
inner join sales.salesorderdetail sd 
on p.productID= sd.productID 
where sd.orderqty > 2 
--commit tran  


--CHANGES TO ABOVE 
update production.product 
set listprice = listprice * 1.2 
from production.product 
where productID in 
(
	select productid 
	from sales.SalesOrderDetail sd 
	where sd.orderqty > 2  
)
