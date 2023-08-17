/*
Supplier/retail case study  -Qstn -3
BY:Subhash 
Date Modified - 12-04-23

*/


--3.List the part id, name, price and difference between price and average price of all parts.
		select pid,name,price,price-(select avg(price) from PartMaster) as 'price difference -price vs avg price'
		from PartMaster
		order by 3 desc
		go