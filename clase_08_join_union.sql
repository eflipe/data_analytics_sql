select * FROM  Asignaturas 

select * 
from Asignaturas a1 
	left join Area a2
	on a1.Area = a2.AreaID 

select a1.AsignaturaID, a1.Nombre Asignatura, a2.Nombre Area  
from Asignaturas a1 
	left join Area a2
	on a1.Area = a2.AreaID 
WHERE a2.Nombre like '%UX'

select a1.AsignaturaID, a1.Nombre Asignatura, a2.Nombre Area  
from Asignaturas a1 
	left join Area a2
	on a1.Area = a2.AreaID 
WHERE a2.Nombre = 'Data'

select a1.Tipo, COUNT(a1.AsignaturaID) as Cantidad  
from Asignaturas a1 
	left join Area a2
	on a1.Area = a2.AreaID 
WHERE a2.Nombre = 'Data'
GROUP by a1.Tipo 

select a2.Nombre , COUNT(a1.AsignaturaID) as Cantidad  
from Asignaturas a1 
	left join Area a2
	on a1.Area = a2.AreaID 
GROUP by a2.nombre

SELECT e.Encargado_ID, e.Nombre as Encargado, s.DocentesID, s.Nombre as Docente 
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 

SELECT e.Encargado_ID, e.Nombre as Encargado, s.DocentesID, s.Nombre as Docente 
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
where s.DocentesID is null

SELECT e.Encargado_ID, e.Nombre as Encargado, s.DocentesID, s.*
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
where s.DocentesID is null

SELECT e.Encargado_ID, e.Nombre as Encargado
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
where s.DocentesID is null

SELECT e.Encargado_ID, e.Nombre as Encargado, s.DocentesID, s.Nombre as Docente 
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
	left join Asignaturas a on s.Asignatura = a.AsignaturaID 
	left join Area ar on a.Area = ar.AreaID  

SELECT * 
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
	left join Asignaturas a on s.Asignatura = a.AsignaturaID 
	left join Area ar on a.Area = ar.AreaID  

SELECT ar.Nombre, e.Nombre  
from Encargado e 
	left join Staff s ON e.Encargado_ID = s.Encargado 
	left join Asignaturas a on s.Asignatura = a.AsignaturaID 
	left join Area ar on a.Area = ar.AreaID 

	
-- Union
SELECT Q1.Tipo, count(Q1.Documento) as Cantidad
FROM 
(select nombre, apellido, documento, 'Encargado' as Tipo
from Encargado
union
select nombre, apellido, documento, 'Staff' as Tipo
from Staff) as Q1
group by q1.tipo
 

