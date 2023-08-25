/*
4.	List the names of the account holders with corresponding branch names, 
in respect of the maximum and minimum Cleared balance */
select name,brid,CBAL
from AMASTER
where CBAL=(select max(cbal) from AMASTER) 
		or cbal= (select min(cbal) from AMASTER)
