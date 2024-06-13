use exo5tp
--exo3 TP

select *
from EMP as emp 
	inner join PARTICIPER as pa on emp.Matr = pa.Matr
	--inner join PROJET as pr on pr.PCode = pa.PCode
select 
from EMP as em	
	inner join PARTICIPER as pa on em.Matr = pa.matr
	group by em.NomE having COUNT(pa.count)=select count(*) from PROJET
	
select avg(EMP.Salaire)
from EMP
group by EMP.Poste


select emp.NomE , dept.DeptNom , MAX(emp.Salaire)
from EMP as emp
	inner join DEPT as dept on emp.NumDept = dept.NumDept
	
select E.nomE , NumDept
from EMP as E
	where Salaire = (select MAX(Salaire)
					from EMP
					where NumDept = E.NumDept)

select E.NOME , NumDept
from EMP as E
where E.salaire = (select MAX(salaire)
					from EMP 
					group by NumDept
					having E.NumDept = NumDept)

select top 1 Poste
from EMP
group by EMP.Poste
having avg(Salaire) <= all(select avg(salaire) 
						  from EMP 
						  group by Poste)

select *
from emp
