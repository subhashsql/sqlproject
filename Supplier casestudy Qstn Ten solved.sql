/*
Supplier/retail case study  -Qstn -10
BY:Subhash 
Date Modified - 14-04-23

*/
---10.List the names of the parts whose price is less than the average price of parts.
				
				select name 
				from partmaster
				where price <= (select avg(price)
									from PartMaster)
						go