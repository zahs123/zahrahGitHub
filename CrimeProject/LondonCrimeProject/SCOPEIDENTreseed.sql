use Adventureworks2012 
go 

create table jobs 
( 
jobid int identity(1,1), -- seed,increment
jobdescription varchar(max) null  
) 

insert jobs 
(jobdescription) 
values
('kubrick data engineer'),
('kubrick data analyst') ,
('kubrick sales person')  

select SCOPE_IDENTITY()  --grabbing most recently input idea 

delete jobs  -- delte all rows 

select * from jobs  -- will see all deleted 

insert jobs 
(jobdescription) 
values
('kubrick manager') 
dbcc checkident(jobs,reseed,1) 
