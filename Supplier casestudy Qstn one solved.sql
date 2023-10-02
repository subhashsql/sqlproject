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
---2.List the names of the Suppliers who do not supply part with PID ‘1’.

select distinct m.name,m.city
from SUPPLIERMASTER m
		join SUPPLYDETAILS d	
		on m.sid=d.sid
		where d.pid not in (
						select pid					
						from SUPPLYDETAILS   --first get name of supplier who supplied parts pid=1
						where  pid =1)
		go

--3.List the part id, name, price and difference between price and average price of all parts.
		select pid,name,price,price-(select avg(price) from PartMaster) as 'price difference -price vs avg price'
		from PartMaster
		order by 3 desc
		go
/*4.	List the names of the suppliers who have supplied at
least one part where the quantity supplied is lower than 10.

*/
use [supplier1]
go

select*
from [dbo].[PartMaster]
go
select * 
from [dbo].[supplier_Master]
go
----------------
select name,city,QTYSUPPLIED,m.pid
from supplier_Master s
		join(
		select distinct sid,pid,QTYSUPPLIED
		from [dbo].[SupplyDetails]
		where QTYSUPPLIED >=10 ) m
		on s.sid=m.sid
		order by 3 asc
		go
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
--7.List name and Price category for all parts. Price category has to be displayed as “Cheap” if price is less than 100, “Medium” if the price is greater than or equal to 100 and less than 500, and “Costly” if the price is greater than or equal to 500.
			
			select name,price,
				case  when price< 100 then 'cheap'
				when price between 100 and 500 then 'medium'
				else 'high'
				end as pricecatageory
			from PartMaster 
			order by PRICE
---8.List the names of the suppliers who have supplied exactly 10 units of part P1.
	select name as 'suppliers who have supplied 10 units of  pid 1'
	from supplierMaster m  join 
				(select pid,sid
				from SupplyDetails  -------	preferred querry
				where pid=1 and QTYSUPPLIED =10
				) s
				on  
				s.sid= m.sid
----9.List the names of the parts supplied by more than one supplier.

		select name as 'name of product that have more than one supplier'
		from PartMaster  p join
						(   select pid
							from SupplyDetails
							group by pid
							having count (sid) >= 2   ) k
				  on p.pid = k.pid
---10.List the names of the parts whose price is less than the average price of parts.
				
				select name 
				from partmaster
				where price <= (select avg(price)
									from PartMaster)
						go
/*  11.	List the names of the parts whose price is less than the average price of parts
Supplier casestudy  qstn no -11
solved by :subhash
*/
use supplier1
go

select top 3 *
from supplier_Master

select top 3 *
from SupplyDetails

select top 3 *
from PartMaster
--------------
select name 
from partmaster
where price <= (select avg(price)
					from PartMaster)
/*      12.	List the category-wise number of parts; exclude those where the sum is > 100 and less than 500.
		List in the descending order of sum. (since we dont actually have those exact qty we r using 50 and 600
		Supplier casestudy  qstn no -12

*/
use supplier1
go

select top 3 *
from supplier_Master

select  *
from SupplyDetails
select *
from PartMaster

select  pid as product ,QTYSUPPLIED
from SupplyDetails
where qtysupplied between 50 and 600
order by 2 asc
---------------------------
select name,CATEGORY, QTYONHAND as 'no.of products'
from PartMaster
where QTYONHAND between 100 and 500
order by 2 asc
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

