/*
Supplier/retail case study  -Qstn -14
BY:Subhash 
Date Modified - 14-04-23

*/

--14.For the part with the minimum price, List the latest supply details (Supplier Name, Part id, Date of supply, Quantity Supplied).


				select dateofsupply as 'date of supply',qtysupplied as 'total supplied',m.name as 'supplier name',k.PID as 'product id',minimum_price
				from supplier_Master m
				join SupplyDetails s
				on s.sid =m.SID join (select top 2 min(price) as minimum_price,pid
										from PartMaster
										group by pid
										order by 1 asc
										)
										k
										on k.pid=s.pid
										go
