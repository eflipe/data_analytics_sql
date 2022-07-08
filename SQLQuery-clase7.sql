select nombre, apellido  FROM staff

select upper (concat(nombre, ', ' ,LEFT(apellido, 1), '.')) as nomapellconcat,  nombre, apellido, telefono  FROM staff

select right(camada,5) as camadaright from staff
select replace(camada,'camada', 'comision') as camadareplace from staff
select [fecha ingreso], month([fecha ingreso]) as MesNumero from staff  
select [fecha ingreso], datepart(month, [fecha ingreso]) as MesNumero, datename(month, [fecha ingreso]) as MesNombre from staff  

select tipo, count(asignaturasid) as cant_asig from asignaturas where area = ( select areaid from area where nombre='data') group by tipo
select nombre, documento, telefono, profesion, [fecha de nacimiento]
from estudiantes
where profesion in (
	select profesionesid
	from profesiones
	where profesiones like 'agro%'
) and year([fecha de nacimiento]) between 1970 and 2000

select upper(concat(nombre, '-', apellido)) as nombre_apellidos_unidos
from staff
where year([fecha ingreso]) = 2021