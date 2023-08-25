use tbank
go
/*
1.	List the transactions that have taken place in a given Branch during the  previous month
*/
select  ACID,CBAL,UBAL,datepart(mm,doo)
from [dbo].[AMASTER]
where datepart(mm,doo) =05


