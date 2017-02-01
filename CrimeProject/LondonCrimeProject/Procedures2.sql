--CHALLENGE 
--STORE PROCEDURE PERSON.ADDRESS 
use Adventureworks2012
alter proc person.usp_AddAddress 

@addressline1 nvarchar(60),
@addressline2 nvarchar(60),
@city nvarchar(50), 
@postalcode nvarchar(50), 
@stateprovince nvarchar(50)

 
as 
begin --first beign 

if @addressline1 is null 
begin 
	print 'Please supply a subcatname' 
	return 
end 

declare @stateprovinceID int 
	select @stateprovinceID = StateprovinceID --actually state column name here 
	from person.StateProvince
	where @stateprovince = Name  




begin try --try blocks and catch blocks 
insert into person.Address 
(StateprovinceID, Addressline1, Addressline2,City, PostalCode) --columns from person.address
values 
(@stateprovinceid ,@addressline1,@addressline2,@city,@postalcode) 
end try 
begin catch --error catcher  you need TRY BLOCK FOR ERROR AHNDLING 
	print 'enter valid address'
end catch 

end 