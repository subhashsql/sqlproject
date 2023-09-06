/*
Supplier/retail case study  -Qstn -8
BY:Subhash 
Date Modified - 13-04-23
*/
---8.List the names of the suppliers who have supplied exactly 10 units of part P1.
	select name as 'suppliers who have supplied 10 pid 1'
	from supplierMaster m  join 
				(select pid,sid
				from SupplyDetails  -------	preferred querry
				where pid=1 and QTYSUPPLIED =10
				) s
				on  
				s.sid= m.sid
