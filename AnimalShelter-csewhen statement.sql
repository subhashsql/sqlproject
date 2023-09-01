use Animal_Shelter
go
select top 4 *
from [dbo].[Adoptions]
go
select top 4 *
from [dbo].[Animals]
go
select *
from [dbo].[Persons]
go
select top 4 *
from [dbo].[Staff]
go
select top 4 *
from [dbo].[Staff_Roles]
go
select top 4 *
from [dbo].[Staff_Assignments]
go
select top 4 *
from[dbo].[Vaccinations]
select top 4 *
from[Reference].[Colors]
select top 4 *
from[Reference].[Species]
go
-----------------------
select  *,datediff(yy,Hire_Date,getdate()) as years_in_service,
	case when datediff(yy,Hire_Date,getdate()) >=7 then 'Senior'  
	 when datediff(yy,Hire_Date,getdate()) >=5 then 'Junior' else 'Newbee' end as'seniority'
from [dbo].[Staff]
order by 2 asc
go
-----------------------------
select Role,asgn.Email,Hire_Date,
		case when datediff(yy,Hire_Date,getdate()) >=7 then 'Senior'  
		 when datediff(yy,Hire_Date,getdate()) >=5 then 'Junior' else 'Newbee' end as'seniority'
from [dbo].[Staff] st join [dbo].[Staff_Assignments] asgn
		on st.Email= asgn.Email
order by 3 asc
go
------------------------------------
select top 4 *
from [dbo].[Animals]
go
select Name,Species, datename(dw,Birth_Date) as 'dayBorn',
	case when datename(dw,Birth_Date) in ('saturday','sunday') then 'weekend'
		else 'weekday' end as 'dayname'
from [dbo].[Animals]
go
----------
select Name,Species, datename(dw,Birth_Date) as 'dayBorn'
	from [dbo].[Animals]
where datename(dw,Birth_date) in ('saturday','sunday')
go















