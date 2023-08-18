/*
Supplier/retail case study  -Qstn -6
BY:Subhash 
Date Modified - 13-04-23

*/
--6.List the names of the parts which have not been supplied in the month of May 2020.

select name,DATEOFSUPPLY
from [dbo].[PartMaster] p
join  [dbo].[SupplyDetails] d
		on p.pid= d.pid 
		where p.pid not in 
						(
						select pid
						from  [dbo].[SupplyDetails]
						where datepart(mm,dateofsupply) =05
						)

Variation 2:
			select name,datename(mm,DATEOFSUPPLY) as 'Supplied in the month of'
			from [dbo].[PartMaster] p
			join  [dbo].[SupplyDetails] d
					on p.pid= d.pid 
					where p.pid not in 
						(
						select pid
						from  [dbo].[SupplyDetails]
						where datepart(mm,dateofsupply) =05
						)