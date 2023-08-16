/* 13.	List the supplier name, part name and supplied quantity for all 
	supplies made between 1st and 15th of June 2020.
	Supplier casestudy  qstn no -13
	solved by :subhash
*/
use supplier1
go

select top 3 *
from supplier_Master
go
select  *
from SupplyDetails
go
select *
from PartMaster
go

----------
select  *
from SupplyDetails
where datepart(mm,DATEOFSUPPLY) =06
-----
select  *
from SupplyDetails
where DATEOFSUPPLY between  datepart(mm,DATEOFSUPPLY) = 06 and datepart(mm,DATEOFSUPPLY) = 07
------------
select  *
from SupplyDetails
where datepart(mm,DATEOFSUPPLY)  in (06,08)