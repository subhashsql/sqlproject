/*
Pivotting columns
query - Subahash
Date- 23-05-2023
*/
use school
go
--- create a new table 
create table Pivotsales1
(
Pid int,
Month_name varchar(20),
qtysold int
)
go
insert into Pivotsales1 (Pid,Month_name,qtysold)
Values
(2,'June',12)
(2,'January',10),
(1,'January',12),
(2,'February',12),
(1,'February',12),
(2,'March',20),
(1,'March',14),
(1,'April',32),
(2,'April',22),
(1,'May',11),
(2,'May',20),
(1,'June',14),
(1,'June',12),
(2,'July',12),
(1,'July',12),
(2,'August',20),
(1,'August',14)
go
----------------- checking the data insereted in the table
select pid,sum(qtysold) as total_qty,Month_name
from Pivotsales1 
group by pid,Month_name
order by Month_name desc
go

-----------
select Pid,January,February,March,April,May,June,July,August
from Pivotsales1 
pivot (sum(qtysold) for 
		Month_name in ( January,February,March,April,May,June,July,August)) as k
				
go
--------------
-------------- pivoting using case when statement
select  pid,
	 max (case 
		when Month_name ='January' then qtysold  end )as Jan,
	max (case 
		when Month_name ='February' then qtysold  end )as  Feb,
	max (case 
		when Month_name ='March' then qtysold  end )as  mar,
	max (case 
		when Month_name ='April' then qtysold  end )as  Apr,
	max (case 
		when Month_name ='May' then qtysold  end )as  mai,
	max (case 
		when Month_name ='June' then qtysold  end )as  jun,
	max (case 
		when Month_name ='July' then qtysold  end )as juli,
	max (case 
		when Month_name ='August' then qtysold  end )as Aug
		from Pivotsales1 
		group by pid

