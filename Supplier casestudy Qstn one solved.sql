/*
Supplier/retail case study
BY:Subhash 
Date Modified - 12-04-23

*/
--1.List the month-wise average supply of parts supplied for all parts. Provide the information only if the average is higher than 20.
use SUPPLIER
go
-------
		select  avg(QTYSUPPLIED) as 'avg qtnty supplied',datepart (mm,DATEOFSUPPLY) as 'month of supply',pid
		from SupplyDetails
		group by pid,datepart (mm,DATEOFSUPPLY)
		having avg(QTYSUPPLIED) > 20 
		order by 1 asc
		go