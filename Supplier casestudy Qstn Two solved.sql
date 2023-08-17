/*
Supplier/retail case study  -Qstn -2
BY:Subhash 
Date Modified - 12-04-23

*/

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