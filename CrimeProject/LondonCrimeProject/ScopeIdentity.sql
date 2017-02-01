--create table friends 

--( 
--friendID int identity, 
--name varchar(40)
--)  

----create table for freinds phonenumbers 

--create table friendscontacts 
--(
--contact int identity, 
--friendID int, 
--phone varchar(20)   -- if you made it in integer it would reomove the 0 therefore make varchar or string  

--) 
--1 add the friend 
begin tran
insert into friends 
(name) --name will have values lorro 
values 
('Lorro') 
--capture the auto generate identity for the friendid  
declare @fid int --@fid is friend identity 
select @fid = scope_identity() -- grabs most recent recetnly added ID 
--insert into contact table the captured id and the phone number 
insert into friendscontacts 
(friendID, phone)
values 
(@fid, '0774700817774') 
commit tran 

select 
* from friends 

select * from friendscontacts 

