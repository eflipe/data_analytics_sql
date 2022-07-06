SELECT TOP(1) documento, nombre, Right(Camada, 5)Camada 
from Staff 
WHERE year([fecha ingreso])=2021 and month([fecha ingreso])=05
ORDER BY Camada DESC 
-- separar las queries: una devuelve el mayor y otra el menor
SELECT TOP(1) documento, nombre, Right(Camada, 5)Camada 
from Staff 
WHERE year([fecha ingreso])=2021 and month([fecha ingreso])=05
ORDER BY Camada ASC 

-- nueva resolucion
(
SELECT TOP(1) documento, nombre, Right(Camada, 5)Camada, 'MAYOR' as Orden 
from Staff 
where Right(Camada, 5) = (
	SELECT TOP(1) Right(Camada, 5)Camada 
	from Staff 
	WHERE year([fecha ingreso])=2021 and month([fecha ingreso])=05
	ORDER BY Camada DESC 
)
)
UNION
(
SELECT TOP(1) documento, nombre, Right(Camada, 5)Camada, 'MENOR' as Orden
from Staff 
where Right(Camada, 5) = (
	SELECT TOP(1) Right(Camada, 5)Camada 
	from Staff 
	WHERE year([fecha ingreso])=2021 and month([fecha ingreso])=05
	ORDER BY Camada ASC 
)
)

-- Punto 2
select [fecha ingreso], count(EstudiantesID) from Estudiantes
group by [fecha ingreso]

select year([fecha ingreso])Año,month([fecha ingreso])mes, day([fecha ingreso])Dia, count(estudiantesid)Total_Estudiantes
from Estudiantes
group by [fecha ingreso]
order by total_estudiantes
desc

-- Punto 3
select top 10
a.Encargado_ID,
a.Nombre,
COUNT(b.DocentesID)Cantidad_docentes
from Encargado a
left join staff b 
on a.Encargado_ID = b.Encargado 
WHERE tipo like '%Docentes%'
GROUP by a.Encargado_ID, a.nombre
order by COUNT(b.DocentesID)
desc

-- Punto 4
SELECT 
	FORMAT(a.[Fecha Ingreso], 'yyyyMM') as anio_mes,
	d.nombre,
	sum(c.costo)Costo_total,
	count(a.EstudiantesID)Cantidad_estudiantes
from Estudiantes a
inner join staff b
on a.Docente = b.DocentesID 
INNER join Asignaturas c 
on b.Asignatura = c.AsignaturaID 
inner join area d 
on c.Area = d.AreaID 
group BY 
a.[Fecha Ingreso],
d.nombre
ORDER by FORMAT(a.[Fecha Ingreso], 'yyyyMM') desc, count(a.EstudiantesID) desc

