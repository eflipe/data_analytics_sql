select * from asignaturas
select distinct Nombre from asignaturas
select distinct Nombre AS Asignatura from asignaturas
select distinct Nombre,Costo from asignaturas where costo>=9.5
select * from asignaturas where costo>7 AND costo<8 
select * from asignaturas where jornada='manana' or jornada='tarde'
select * from asignaturas where nombre like 'Py%'
select * from asignaturas where jornada in ('manana', 'tarde')
select * from asignaturas where not jornada in ('manana', 'tarde')
select nombre, jornada, costo, costo*1.2 as costo_nuevo from asignaturas
select nombre, jornada, costo, costo*1.2 as costo_nuevo from asignaturas where costo*1.2 > 11
select nombre, jornada, costo from asignaturas where costo*1.2 > 11
select * from asignaturas
select top 5 * from asignaturas
where nombre like '_a%'
order by costo desc
