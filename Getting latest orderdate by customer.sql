/*
Find latest order by customer
query - Subahash
Date- 23-05-2023

*/
use school
go
--- create a new table 
create table Orders
(
Cid int,
Order_date date,
Orderid int
)
go
insert into Orders (Cid,Order_date,Orderid)
Values
(11,'2023/07/13',109),
(12,'2023/02/24',102),
(13,'2023/05/11',103),
(13,'2023/04/09',104),
(11,'2023/05/15',105),
(13,'2023/06/29',106),
(12,'2023/07/24',107)


select *
from Orders
go
------------

select Max(Order_date),cid
			from Orders 
			group by cid
			


---drop table Orders

---------------------

