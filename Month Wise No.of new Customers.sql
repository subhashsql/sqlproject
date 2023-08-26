/*
 query to get Month wise No.of New customers
 Query By - Subhash
 Date-22-05-2023


*/
use tbank
go

select top 3  * 
from [dbo].[AMASTER]
go
------------------
select datename(mm,mindate) as 'month Name',count(*) as cnt
from ( select acid,min(Doo) as mindate
		from [dbo].[AMASTER]
		group by ACID
		) as k
	group by  datename(mm,mindate)
	order by 2 asc
	go

-----------------
