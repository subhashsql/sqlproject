/*      12.	List the category-wise number of parts; exclude those where the sum is > 100 and less than 500.
		List in the descending order of sum. (since we dont actually have those exact qty we r using 50 and 600
		Supplier casestudy  qstn no -12
solved by :subhash
*/
use supplier1
go

select top 3 *
from supplier_Master

select  *
from SupplyDetails
select *
from PartMaster

select  pid as product ,QTYSUPPLIED
from SupplyDetails
where qtysupplied between 50 and 600
order by 2 asc
---------------------------
select name,CATEGORY, QTYONHAND as 'no.of products'
from PartMaster
where QTYONHAND between 100 and 500
order by 2 asc