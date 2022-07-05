SELECT * from Staff

select nombre, apellido, Telefono from Staff s 

select CONCAT(apellido, '-',nombre) as NomApelli from Staff s

select concat(apellido, ', ', LEFT(Nombre,1), '.') as NA, Telefono  from Staff
select RIGHT (Camada,5) as NuevaCamada from Staff s 
select replace(Camada, 'camada ', '') as CamadaModificada from staff
select [Fecha Ingreso],  MONTH ([fecha ingreso]) as Mes from staff
select [Fecha Ingreso],  DATENAME(MONTH, [fecha ingreso]) as Mes from staff
select [fecha ingreso], format([fecha ingreso], 'yyyy-MMMM', 'es-ar') as formateo from staff
select [fecha ingreso], DATEADD(day,8,[fecha ingreso]) as OchoDiasDespues from staff
select [fecha ingreso], DATEDIFF(day, [fecha ingreso], getdate()) as DiasAHoy from staff
select [fecha ingreso], CONVERT(varchar(40), [fecha ingreso], 106) as convertido from staff









