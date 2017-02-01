alter   proc dbo.usp_AddCustomer -- in alter proc here ensure when queried you supply both 
@customername nvarchar(50), 
@cid int output -- if output would not be expected 

as 
begin
	insert into dbo.customer
	(name)
	values
	(@customername )


select @cid = SCOPE_IDENTITY() --assign cid scope identity 
end  

--declare @who int 
--exec dbo.usp_AddCustomer 'Billy bob', @who output 
--select @who 

--exec dbo.usp_AddCustomerContact @who, 'bill@gmail.com' 
go
----------------2 CREATE USPADDCUSTOMERCONTACT 
create proc dbo.usp_AddCustomerContact 
@customername nvarchar(50),
@email varchar(255),
@phone varchar(50)
as 

begin 
insert into dbo.CustomerContact 
(customerID, email, phone) 
select
	 c.customerID
	,@email 
	,@phone
from dbo.customer c
where c.name = @customername
end 
go 


----------------3 CREATE USPADDACCOUNT
create proc dbo.usp_AddAccount
@customername nvarchar(50),
@accountnumber nvarchar(100),
@sortcode varchar(50),
@AccountType varchar(50)
as 

begin 
insert into dbo.account
(customerID, accountnumber, sortcode, accounttype)
select
	 c.customerid 
	,@accountnumber 
	,@sortcode
	,@AccountType


from dbo.customer c
where c.name =  @customername  --not needed
end 
go 

-- CREATE USP-ADDBALANCE 

create proc dbo.usp_AddBalance 
@accountnumber nvarchar(50),
@sortcode nvarchar(100),
@balancedate varchar(50),
@balance varchar(50)
as 

begin 
insert into dbo.accountbalance
(accountID, balancedate, balance)
select
	 a.accountID
	,@balancedate
	,@balance --balance on current account, in credit, with 500 overdraft
from dbo.account a

	 where a.accountnumber = @accountnumber
	 and a.sortcode = @sortcode

end 
go 