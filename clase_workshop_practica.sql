SELECT top 1 s.Documento, s.Nombre, replace(s.Camada, 'camada', '')  
from Staff s
order by replace(s.Camada, 'camada', '') desc
SELECT top 1 s.Documento, s.Nombre, replace(s.Camada, 'camada', '')  
from Staff s
order by replace(s.Camada, 'camada', '') asc

SELECT s.Documento, s.Nombre, s.[Fecha Ingreso], replace(s.Camada, 'camada', '')  
from Staff s
WHERE s.[Fecha Ingreso] between '2021-05-01' and '2021-05-31'

-- otro ejemplo
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayor' as tipo 
FROM Staff s 
where Camada = (select max(camada) as maximo from Staff)
union 
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Menor' as tipo 
FROM Staff s 
where Camada = (select min(camada) as maximo from Staff)
union
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayo 2021' as tipo 
FROM Staff s 
where s.[Fecha Ingreso] between '2021-05-01' and '2021-05-31'

-- otro
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayor' as tipo 
FROM Staff s 
where Camada = (select max(camada) as maximo from Staff)
union 
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Menor' as tipo 
FROM Staff s 
where Camada = (select min(camada) as minimo from Staff) 
union
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayo 2021' as tipo 
FROM Staff s 
where s.[Fecha Ingreso] like '2021-05-%'

-- otro inconcluso
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayor' as tipo 
FROM Staff s 
where Camada = (select max(camada) as maximo from Staff WHERE YEAR([Fecha Ingreso])=2021)
union 
SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Menor' as tipo 
FROM Staff s 
where Camada = (select min(camada) as minimo from Staff WHERE YEAR([Fecha Ingreso])=2021) 
union

SELECT s.[Fecha Ingreso], s.Documento, s.Nombre, s.Camada, 'Mayor' as tipo 
FROM Staff s 
where Camada  = (
	SELECT max(camada)
	FROM Staff
	where year([fecha ingreso])=2021 and month([fecha ingreso])=05
	)
	
-- punto 2
SELECT year(e.[Fecha Ingreso])Anio, MONTH (e.[Fecha Ingreso])Mes, day(e.[Fecha Ingreso])Dia,COUNT(e.EstudiantesID)Cantidad_Estudiantes  
from Estudiantes e
group by e.[Fecha Ingreso] 
ORDER by Cantidad_Estudiantes desc

-- 2da parte punto 1
SELECT ar.Nombre, format(e.[Fecha Ingreso], 'yyyy-MM') as AnioMes, count(e.EstudiantesID)CantidadEstudiantes, sum(a.Costo)SumatoriaCosto  
FROM Estudiantes e 
	left join Staff s 
	on e.Docente = s.DocentesID 
	left join Asignaturas a 
	on s.Asignatura = a.AsignaturaID 
	left join Area ar 
	on a.Area = ar.AreaID 
group by ar.Nombre, format(e.[Fecha Ingreso], 'yyyy-MM')  

-- 4) Analisis de profesiones con mas estudiantes
SELECT p.Profesiones, COUNT(e.EstudiantesID)Cantidad_Estudiantes  
FROM Estudiantes e 
	left join Profesiones p 
	on e.Profesion = p.ProfesionesID 
group by p.Profesiones
having COUNT(e.EstudiantesID) > 5
order by cantidad_estudiantes desc

-- 5) analisis de estudiantes por area de educacion
SELECT ar.Nombre, a.tipo, a.jornada, COUNT(e.EstudiantesID)CantidadEstudiantes, sum(a.Costo)CostoTotal  
from Estudiantes e 
	left join Staff s 
	on e.Docente = s.DocentesID 
	LEFT join Asignaturas a 
	on s.Asignatura = a.AsignaturaID 
	LEFT join area ar 
	on a.Area = ar.AreaID 
GROUP by ar.Nombre, a.tipo, a.jornada
order by CostoTotal desc
-- me calcula mal el costo

-- nivel tactico 2)
SELECT e.Nombre, e.Documento , replace(s.Camada, 'camada', '')Camada, s.[Fecha Ingreso]  
from Encargado e
	left join Staff s 
	on e.Encargado_ID = s.DocentesID 
order by camada desc
-- en el excel no esta ordenado

-- nivel tactico 3)
SELECT a.tipo, a.jornada, ar.Nombre , count(ar.AreaID)CantidadAreasUnicas
from Staff s 
	left join Asignaturas a 
	on s.Asignatura = a.AsignaturaID
	where s.Asignatura is null
	left join Area ar 
	on a.Area = ar.AreaID 
GROUP by a.tipo, a.jornada, ar.Nombre

SELECT *
from Staff s 
	left join Asignaturas a 
	on s.Asignatura = a.AsignaturaID
	where s.Asignatura = 0
	







