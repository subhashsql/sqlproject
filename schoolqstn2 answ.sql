/* 2.List the names of the Students who have not enrolled for Java course.*/

-----------students enrolled in java course
select distinct sid,cid, count(*) as 'no.of courses'
from [dbo].[ENROLL_MASTER]
where cid != 105
group by cid,sid 
order by sid


--getting distince sid,name form enrollmaster and studentmaster
select distinct em.sid as 'student id',name 
from  [dbo].[ENROLL_MASTER]as em join [dbo].[StudentMaster] as sm
on em.sid = sm.sid
order by name asc
go

------ now remove the emrolled from the rest 
select distinct em.sid as 'student id',name,count (*) as 'no.of.courses' 
from  [dbo].[ENROLL_MASTER]as em join [dbo].[StudentMaster] as sm
on em.sid = sm.sid
where em.sid not in
			(select em.sid
		from [dbo].[ENROLL_MASTER]
		where cid = 105)
group by em.sid,name
go


-----------
select distinct em.sid as 'student id',name,count (*) as 'no.of.courses' 
from  [dbo].[ENROLL_MASTER]as em join [dbo].[StudentMaster] as sm
on em.sid = sm.sid
where em.cid  in
			(select em.sid
		from [dbo].[ENROLL_MASTER]
		where cid = 105)
group by em.sid,name
go



