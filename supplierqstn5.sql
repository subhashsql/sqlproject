/*5.	List the names of the suppliers who live in a city where no supply has been made.

supplier case study qstn 5
solved by : subhash
*/
use [supplier1]
go

select*
from [dbo].[PartMaster]
go
select * 
from [dbo].[supplier_Master]
go
select * 
from [dbo].[SupplyDetails]
go
select *
from supplier_Master m left join
	  SupplyDetails n on
	  m.city=n.CITY