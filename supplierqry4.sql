/*4.	List the names of the suppliers who have supplied at
least one part where the quantity supplied is lower than 10.

Supplier case study
query solved by :subhash

*/
use [supplier1]
go

select*
from [dbo].[PartMaster]
go
select * 
from [dbo].[supplier_Master]
go
----------------
select name,city,QTYSUPPLIED,m.pid
from supplier_Master s
		join(
		select distinct sid,pid,QTYSUPPLIED
		from [dbo].[SupplyDetails]
		where QTYSUPPLIED >=10 ) m
		on s.sid=m.sid
		order by 3 asc
		go