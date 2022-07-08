select * from asignaturas
select * from area
select *

select asig.nombre as Asignaturas, ar.nombre as area
from asignaturas as asig
	left join area as ar ON asig.area=ar.areaid 
where ar.nombre='Data'

select asig.tipo, count(asig.asignaturasid) as Cant
from asignaturas as asig
	left join area as ar ON asig.area=ar.areaid 
where ar.nombre='Data'
group by asig.tipo

select t2.Jornada, 
	count(t1.DocentesID) as cant_docentes,  
	sum(t2.costo) as suma_total
from staff as t1
	inner join asignaturas as t2
	on t1.asignatura = t2.asignaturasid
where t2.Nombre='Desarrollo web'
group by t2.Jornada

select t1.Encargado_ID, t1.Nombre, t1.Apellido,
		count(t2.DocentesID) as count_docentes
from Encargado as t1
left join staff as t2 on t1.Encargado_ID = t2.Encargado
group by t1.Encargado_ID, t1.Nombre, t1.Apellido
having count(t2.docentesid) = 0
