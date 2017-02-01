--create table dbo.DimLocation 

--( 
--locationID int identity 
-- ,locationName varchar(30), 
--county varchar(30)

--) 
set identity_insert DimLocation on 
insert DimLocation 
(locationID,locationName, county) 
values 
(1, 'tobacco dock', 'london'),
(2, 'cryodon', 'london'),
(3, 'clapham', 'london')
set identity_insert DimLocation off 

select * from DimLocation   

insert into crime123
(crimetype,location, crimedate) 
values 
('theft', 'tobacco dock', '2016-10-04'),
('murder', 'tobacco dock', '2016-10-04'),
('back stabbing', null, '2016-10-04')


create table crime123 
(
crimeid varchar(20),
crimetype varchar (50),
location varchar(30), 
crimedate date 
 )

 select 

	 c.* 
	 ,l.locationID 
	from crime123 c 
	inner join DimLocation l 
	on isnull(c.location, 'unknown') = l.locationName  --if null replace with unknown 

	drop table crime123