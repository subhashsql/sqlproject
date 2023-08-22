/*
Supplier/retail case study  -Qstn -9
BY:Subhash 
Date Modified - 14-04-23

*/
----9.List the names of the parts supplied by more than one supplier.

		select name as 'name of product that have more than one supplier'
		from PartMaster  p join
						(   select pid
							from SupplyDetails
							group by pid
							having count (sid) >= 2   ) k
				  on p.pid = k.pid
