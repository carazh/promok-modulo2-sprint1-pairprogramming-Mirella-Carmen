 CREATE SCHEMA `tienda_zapatillas`; --- Crear BBDD tienda de zapatillas
 USE `tienda_zapatillas`; --- Le indicamos que vamos a usar esta bbdd
 
 --- Aqui creamos la tabla para zapatillas
 CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
 );
 
 --- Aqui creamos la tabla clientes
 CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    cp VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente)
 );
 
 --- Aqui creamos la tabla empleados 
  CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleado)
 );
 
 --- Aqui creamos la tabla facturas (tiene relación con las otras tres tablas)
 
 CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT NOT NULL,
    num_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT fk_zapatillas 
		FOREIGN KEY(id_zapatilla)
        REFERENCES zapatillas(id_zapatilla),
	CONSTRAINT fk_clientes
		FOREIGN KEY(id_cliente)
        REFERENCES clientes(id_cliente),
	CONSTRAINT fk_empleados
		FOREIGN KEY(id_empleado)
        REFERENCES empleados(id_empleado)
	);
 
 
 
 
 
 
 
 
 
 
 
 
 