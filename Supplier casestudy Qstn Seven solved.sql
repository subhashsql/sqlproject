/*
Supplier/retail case study  -Qstn -7
BY:Subhash 
Date Modified - 13-04-23

*/
--7.List name and Price category for all parts. Price category has to be displayed as “Cheap” if price is less than 100, “Medium” if the price is greater than or equal to 100 and less than 500, and “Costly” if the price is greater than or equal to 500.
			
			select name,price,
				case  when price< 100 then 'cheap'
				when price between 100 and 500 then 'medium'
				else 'high'
				end as pricecatageory
			from PartMaster 
			order by PRICE
