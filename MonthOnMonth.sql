/*
Comparing month on month total amount from rental
db used - sakila 
Query by - subhash
date 23-05-2023
*/
use sakila
go
-----------------------------
select sum(Amount),year(payment_date),datename(month,payment_date)
from [dbo].[payment]
group by year(payment_date),datename(month,payment_date)
order by 2,3 desc

----------------
--comparing total amount month on month for the current year -

select year(payment_date),datename(month,payment_date),sum(Amount),
		Lag(sum(Amount)) over(order by year(payment_date), datename(month,payment_date)) as f
from [dbo].[payment]
where year(payment_date) =2005
group by year(payment_date),datename(month,payment_date)
order by 2,3 desc

-------------------------------------------
