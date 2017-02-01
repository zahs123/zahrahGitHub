USE banking
GO

--BANKING QUERY CHALLENGE 18/11/16 
--CREATE TABLES
/*
create table dbo.DimCustomer 
( 
 Name varchar(50) 
,AccountFirstOpened varchar(50) 
 ,CustomerID int identity --autogeneratued 
) 
GO
create table dbo.CustomerContact 
( 
Email varchar(100) 
,phone varchar(50)
,CustomerID int 
,friendID int identity 
) 
GO
create table dbo.AccountDetails
( 
AccountNo varchar(100) 
,sortcode varchar(50)
,TypeID int
,AccountID int identity 
,CustomerID int 
) 
GO
create table dbo.Balance
( 
dateID date  
,Balance money
,CreditLimit varchar(30) 
,AccountID int 
) 
GO
--set identity_insert DimCustomer off 

create table dbo.banking 
(
accountID int 
,Balance money 
,DateID date 
 )
 GO
 */

 --INSERT VALUES
 insert DimCustomer 
(Name, AccountFirstOpened) 
values 
('jess',11-12-15 )

DECLARE @cid int
SELECT @cid = SCOPE_IDENTITY() 


insert CustomerContact
(Email, Phone, CustomerID) 
values 
('FRED@JAMES.CO.UK',11-12-15,@cid )


insert AccountDetails
(AccountNo, sortcode, TypeID, CustomerID) 
values 
('gh6535423','547601',1,@cid )

DECLARE @aid int
SELECT @aid = SCOPE_IDENTITY() 

insert dbo.Balance
(DateID, Balance, CreditLimit, AccountID) 
values 
(SYSDATETIME(),45600,'1000',@aid )

INSERT dbo.banking
 (accountID, Balance, DateID)
 SELECT
	ad.accountid,
	bb.balance,
	bb.dateid
	from dbo.DimCustomer dc
	join dbo.AccountDetails ad on ad.CustomerID = dc.CustomerID 
	join dbo.Balance bb on bb.AccountID=  ad.AccountID  
	join dbo.CustomerContact cc on cc.CustomerID= dc.CustomerID


SELECT * 	from dbo.DimCustomer dc
	join dbo.AccountDetails ad on ad.CustomerID = dc.CustomerID 
	join dbo.Balance bb on bb.AccountID=  ad.AccountID  
	join dbo.CustomerContact cc on cc.CustomerID= dc.CustomerID
