/*  11.	List the names of the parts whose price is less than the average price of parts
Supplier casestudy  qstn no -11
solved by :subhash
*/
use supplier1
go

select top 3 *
from supplier_Master

select top 3 *
from SupplyDetails

select top 3 *
from PartMaster
--------------
select name 
from partmaster
where price <= (select avg(price)
					from PartMaster)