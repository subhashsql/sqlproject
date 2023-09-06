/*
 To get balance month wise year wise
 Query by- Subhash
 36-05-2023
*/
use tbank 
go
--------
select  sum(cbal) as 'Total Balance',year(doo) as'Year',month(doo) as 'Month',Datename(month,Doo)
from amaster
group by year(doo),month(doo),Datename(month,Doo)
go
---------
select datename(month,doo)
from amaster
go
