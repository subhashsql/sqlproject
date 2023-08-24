/*3.	List the name of the advanced course where the enrollment by foreign students is the highest.	*/


select origin,e.cid,count(*)as 'no.of students',c.name
from 
ENROLL_MASTER e join  StudentMaster s  on
 e.sid=s.sid join CourseMaster c on
 e.cid = c.cid
 where origin ='f'
 group by e.cid,origin,c.name
 having  max (
				select max(sid) as students,cid
						 from ENROLL_MASTER
						 group by cid
						 order by students desc
						 go
				 )

 ---max of count
 select cid,count(*)


 select *,row_number() over(partition by sid order by cid) as rno
 from ENROLL_MASTER
  order by rno desc
 group by cid


 select max(sid) as students,cid
 from ENROLL_MASTER
 group by cid
 order by students desc
 go