CREATE DATABASE base_test_1;

CREATE TABLE clientes(
	id_cliente int not null,
	nombre varchar(100) not null,
	telefono int,
	direccion varchar(200),
	id_localidad int 
)
CREATE TABLE localidades (
	id_localidad int not null,
	localidad varchar(100) not null
)
ALTER TABLE clientes 
ADD apellido varchar(100) not null
ALTER TABLE clientes 
ALTER COLUMN nombre varchar(600) not null

ALTER TABLE clientes
ADD CONSTRAINT PK_clientes PRIMARY KEY (id_cliente)

ALTER TABLE localidades
ADD CONSTRAINT PK_localidades PRIMARY KEY (id_localidad)

ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_localidades FOREIGN KEY (id_localidad)
REFERENCES localidades (id_localidad) 