/*
Query to find customerid who have done more than one transcation with in last 7 day
by- subhash
date-20-05-2023
*/

use northwind
go

select top 5 *
from [dbo].[Orders]
go

select distinct h.CustomerID
from [dbo].[Orders] h join [dbo].[Orders] b on
		h.CustomerID = b.CustomerID
	where h.OrderID <>  b.OrderID
	and h.orderdate <=b.orderdate
	and datediff (day,h.orderdate,b.orderdate) <8
