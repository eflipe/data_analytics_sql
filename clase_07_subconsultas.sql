SELECT * from Asignaturas a 
select * from Area a2 
--- quiero todas las asignaturas del area de data
select * from Asignaturas a3 
where area=5

select areaid from Area a 
where Nombre='Data'

--- hacemos una subconsulta para valores unicos
select * from Asignaturas 
where area=(select areaid from Area 
where Nombre='Data')

select areaid from Area where nombre like 'P%'

select * from Asignaturas a 
where area in (select areaid from Area where nombre like 'P%'
)
SELECT area, count(AsignaturaID) as Cantidad from Asignaturas
group by area

SELECT tipo, jornada, count(AsignaturaID) as Cantidad from Asignaturas
group by Tipo, jornada 
-- subconsulta para tabla
SELECT * FROM 
(select tipo, jornada, count(asignaturaid) as Cantidad from Asignaturas
group by tipo, jornada) as Q1

where Q1.jornada='Noche'
