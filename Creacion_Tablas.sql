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
 
 --- EJERCICIO DIA2 ---
 --- En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.
 --- marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
 ALTER TABLE zapatillas ADD COLUMN  marca VARCHAR(45) NOT NULL ;
 --- talla: es un entero, no nulo.
 ALTER TABLE zapatillas ADD COLUMN talla INT NOT NULL;
 
/* Tabla Empleados
salario: es un entero, no nulo. 
Pero puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.*/
ALTER TABLE empleados MODIFY COLUMN salario FLOAT NOT NULL;

/*ELIMINAR LA COLUMNA PAIS DE LA TABLA CLIENTES*/
ALTER TABLE clientes DROP COLUMN pais;

/* CREAR LA COLUMNA TOTAL EN LA TABLA FACTURAS */
ALTER TABLE facturas ADD COLUMN total FLOAT;

/* INSERTAR DATOS EN NUESTRA BBDD.*/
/*ZAPATILLAS*/
INSERT INTO zapatillas (id_zapatilla,modelo,color,marca,talla)
VALUES (1,'XQYUN','Negro','Nike',42),(2,'UOPMN','Rosas','Nike',39),(3,'OPNYT','Verdes','Adidas',35);

INSERT INTO empleados (id_empleado,nombre,tienda,salario,fecha_incorporacion)
VALUES (1,'Laura','Alcobendas',25987,'2010/09/03'),(2,'Maria','Sevilla',0,'2001/04/04'),(3,'Ester','Oviedo',30165.98,'2000/11/29');

INSERT INTO clientes (id_cliente,nombre,numero_telefono,email,direccion,ciudad,c)
VALUES (1,'Laura','Alcobendas',25987,'2010/09/03'),(2,'Maria','Sevilla',0,'2001/04/04'),(3,'Ester','Oviedo',30165.98,'2000/11/29');



 

 
 
 
 
 
 
 
 
 
 
 