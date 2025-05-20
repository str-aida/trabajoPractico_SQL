CREATE TABLE documentos
(cod_documento INT PRIMARY KEY,
descripcion VARCHAR(40) NOT NULL);

CREATE TABLE empleados
(cod_empleado INT PRIMARY KEY,
apellido VARCHAR (40),
nombre VARCHAR(40),
fecha_nacimiento DATE ,
num_doc INT ,
cod_jefe INT,
cod_oficina INT ,
cod_documento INT);

ALTER TABLE empleados ADD FOREIGN KEY (cod_oficina) REFERENCES oficinas (cod_oficina);


CREATE TABLE oficinas
(cod_oficina INT PRIMARY KEY,
codigo_director INT,
descripcion VARCHAR(100));

ALTER TABLE oficinas ADD FOREIGN KEY (codigo_director) REFERENCES empleados (cod_jefe);


CREATE TABLE listas
(cod_lista INT PRIMARY KEY,
descripcion VARCHAR(100),
ganancia DOUBLE);


CREATE TABLE clientes
(cod_cliente INT PRIMARY KEY,
cod_lista INT NOT NULL,
razon_social VARCHAR(40),
FOREIGN KEY (cod_lista) REFERENCES listas (cod_lista));

CREATE TABLE fabricantes 
(cod_fabricante INT PRIMARY KEY,
razon_social VARCHAR(50));

CREATE TABLE precios
(cod_producto INT ,
cod_lista INT ,
precio DOUBLE NOT NULL,
PRIMARY KEY (cod_producto,cod_lista),
FOREIGN KEY (cod_lista) REFERENCES listas (cod_lista));

ALTER TABLE precios ADD FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto);

CREATE TABLE productos
(cod_producto INT PRIMARY KEY,
descripcion VARCHAR(100),
precio DOUBLE NOT NULL,
cantidad_stock INT ,
punto_reposicion INT,
cod_fabricante INT NOT NULL);

ALTER TABLE productos ADD FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante);


CREATE TABLE datos_contratos
(cod_empleado INT,
fecha_contrato DATE ,
cuota INT ,
ventas INT ,
PRIMARY KEY (cod_empleado,fecha_contrato),
FOREIGN KEY (cod_empleado) REFERENCES empleados (cod_empleado));

CREATE TABLE pedidos
(cod_pedido INT PRIMARY KEY,
fecha_pedido DATE NOT NULL,
cod_empleado INT NOT NULL,
cod_cliente INT NOT NULL,
FOREIGN KEY (cod_empleado) REFERENCES empleados (cod_empleado),
FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente));

CREATE TABLE detalle_pedido
(cod_pedido INT ,
numero_linea INT ,
cod_producto INT NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (cod_pedido,numero_linea),
FOREIGN KEY (cod_pedido) REFERENCES pedidos (cod_pedido),
FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto));




INSERT INTO documentos (cod_documento,descripcion) VALUES
(1,'dni'),
(2,'pass'),
(3,'pass'),
(4,'licencia de conducir'),
(5,'dni'),
(6,'carnet extranjero'),
(7,'licencia de conducir'),
(8,'dni'),
(9,'dni'),
(10,'pass'),
(11,'pass'),
(12,'licencia de conducir'),
(13,'dni'),
(14,'dni'),
(15,'licencia de conducir');

INSERT INTO  listas (cod_lista, descripcion, ganancia) values (1, 'Frozen Vegetarian Meals', 47351.58);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (2, 'Hair Care Tools', 37338.47);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (3, 'Camping Equipment', 36159.13);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (4, 'Tank Tops',31462.19);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (5, 'Cooking Appliances', 19485.27);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (6, 'Small Appliances', 10643.93);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (7, 'Frozen Meals', 49034);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (8, 'Frozen Vegetarian Meals', 4983);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (9, 'Boots', 31901.7);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (10, 'Nail Care', 3091.75);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (11, 'Phone Accessories', 29664);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (12, 'Portable Projectors', 19562);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (13, 'Accessories', 46614);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (14, 'Baking Ingredients', 0);
INSERT INTO listas (cod_lista, descripcion, ganancia) values (15, 'Kitchen Gadgets', 42626.46);


INSERT INTO clientes (cod_cliente,cod_lista,razon_social) VALUES
(1001, 1, 'Grimes and Walker'),
(1002, 2, 'Vandervort and Kessler'),
(1003, 3, 'McCullough-Crooks'),
(1004, 4, 'Ferry'),
(1005, 5, 'Lueilwitz and Mosciski'),
(1006, 6, 'Legros-Dickinson'),
(1007, 7, 'Windler and Quigley'),
(1008, 8, 'Hamill Group'),
(1009, 9, 'Shanahan and Sons'),
(1010, 10, 'Willms-Morar'),
(1011, 11, 'Orn Inc'),
(1012, 12, 'Fritsch'),
(1013, 13, 'Hammes and Wyman'),
(1014, 14, 'Nolan'),
(1015, 15, 'Welch and Klein');

INSERT INTO fabricantes (cod_fabricante, razon_social) values (1, 'TearLab Corporation');
INSERT INTO fabricantes (cod_fabricante, razon_social) values (2, 'Ares Capital Corporation');
INSERT INTO fabricantes (cod_fabricante, razon_social) values (3, 'VCA Inc. ');
INSERT INTO fabricantes (cod_fabricante, razon_social) values (4, 'Invacare Corporation');
INSERT INTO fabricantes (cod_fabricante, razon_social) values (5, 'Kingtone Wirelessinfo Solution Holding Ltd');
INSERT INTO fabricantes (cod_fabricante, razon_social) values (6, 'Navistar International Corporation');



INSERT INTO pedidos (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (1, '2019-09-12', 1, 1001);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (2, '2025-02-15', 2, 1002);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (3,'2020-12-04', 3, 1003);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (4, '2022-07-11', 4, 1004);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (5, '2022-04-06', 5, 1005);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (6, '2020-08-22', 6, 1006);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (7, '2024-05-08', 7, 1007);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (8, '2020-03-31', 8, 1008);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (9, '2019-08-11', 9, 1009);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (10, '2022-04-21', 10, 1010);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (11, '2024-12-14', 11, 1001);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (12, '2021-10-15', 12, 1010);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (13, '2023-01-06', 1, 1013);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (14, '2024-09-23', 1, 1014);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (15, '2023-01-14', 1, 1015);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (16, '2019-12-01', 12, 1002);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (17, '2023-12-29', 12, 1002);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (18,'2023-03-07', 11, 1001);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (19, '2023-06-01', 12, 1009);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (20, '2020-11-18', 2, 1009);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (21, '2021-04-07', 2, 1003);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (23,' 2019-08-29', 3, 1008);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (24, '2023-08-02', 4, 1007);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (25,'2019-09-07', 5, 1009);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (26, '2021-11-14', 6, 1005);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (27, '2019-11-01', 2, 1010);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (28, '2022-04-15', 2, 1001);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (29, '2024-06-23', 2, 1012);
INSERT INTO pedidos  (cod_pedido, fecha_pedido, cod_empleado, cod_cliente) values (30, '2022-04-22', 3, 1001);


INSERT INTO productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (1, 'Gigabox', 9.99, 19, 10, 1);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (2, 'Cogibox', 54.99, 22, 5, 2);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (3, 'Camido', 2.99, 2, 3, 3);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (4, 'Yodoo', 44.99, 20, 4, 4);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (5, 'Oyonder', 2.49, 50, 5, 5);
INSERT INTO productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (6, 'Flipopia', 24.99, 60, 6, 5);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (7, 'Ooba', 24.99, 7, 9, 5);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (8, 'Einti', 3.29, 8, 80, 4);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (9, 'Livefish', 3.49, 22, 9, 4);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (10, 'Yakidoo', 9.99, 18, 10, 1);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (11, 'Avaveo', 14.99, 29, 10, 1);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (12, 'Twitternation', 39.99, 48, 12, 1);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (13, 'Topiczoom', 5.49, 13, 50, 2);
INSERT INTO productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (14, 'Cogibox', 32.99, 14, 70, 2);
INSERT INTO productos  (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante) values (15, 'Yodel', 3.99, 15, 150, 2);



INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) values (1, 101, 1, 100);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (2,102,2,10);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (3,103,3,40);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (4,104,4,10);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (5,105,5,60);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (6,106,6,10);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (7,107,7,200);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (8,108,8,100);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (9,109,9,80);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (10,110,10,70);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (11,111,11,100);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (12,112,12,120);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (13,113,13,160);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (14,114,14,10);
INSERT INTO detalle_pedido (cod_pedido, numero_linea, cod_producto, cantidad) VALUES (15,115,15,10);



-- trabajo practico, consultas simples:

/* 1) Obtener una lista con los nombres de las distintas oficinas de la
empresa: */


SELECT distinct descripcion nombreOficinas
FROM oficinas 


/* 2) Obtener una lista de todos los productos indicando descripción
del producto, su precio de costo y su precio de costo IVA
incluído (tomar el IVA como 21%). */

SELECT descripcion listaProductos,precio precioCosto, precio+(precio*0.21) precioIva
FROM productos

/* 3) Obtener una lista indicando para cada empleado apellido, 
nombre, fecha de cumpleaños y edad. */

SELECT apellido,nombre,fecha_nacimiento fechaCumpleaños, YEAR(CURDATE())-YEAR(fecha_nacimiento) edad
FROM empleados

/* 4) Listar todos los empleados que tiene un jefe asignado. */

SELECT *
FROM empleados
WHERE cod_jefe IS NOT NULL 

/* 5) Listar los empleados de nombre “María” ordenado por apellido. */

SELECT *
FROM empleados
WHERE nombre = "maria"

/* 6) Listar los clientes cuya razón social comience con “L” ordenado 
por código de cliente. */

SELECT cod_cliente
FROM clientes
WHERE razon_social LIKE "l%"

/* 7) Listar toda la información de los pedidos de Marzo ordenado 
por fecha de pedido. */

SELECT *
FROM pedidos
WHERE MONTH(fecha_pedido)=3
ORDER BY fecha_pedido

/* 8) Listar las oficinas que no tienen asignado director. */

SELECT *
FROM oficinas
WHERE codigo_director IS NULL 

/* 9) Listar los 4 productos de menor precio de costo. */

SELECT *
FROM productos 
ORDER BY precio ASC
LIMIT 4

/* 10) Listar los códigos de empleados de los tres que tengan la 
mayor cuota. */

SELECT cod_empleado
FROM datos_contratos 
ORDER BY cuota DESC
LIMIT 3

--  Consultas multitablas

/* 1) De cada producto listar descripción, razón social del fabricante 
y stock ordenado por razón social y descripción */

SELECT p.descripcion,p.cantidad_stock,f.razon_social
FROM productos p,fabricantes f
WHERE p.cod_fabricante=f.cod_fabricante
ORDER BY p.descripcion,f.razon_social

/*2) De cada pedido listar código de pedido, fecha de pedido, 
apellido del empleado y razón social del cliente.*/

SELECT pd.cod_pedido,pd.fecha_pedido,e.apellido,c.razon_social
FROM pedidos pd,empleados e,clientes c
WHERE pd.cod_empleado=e.cod_empleado
AND pd.cod_cliente=c.cod_cliente

/* 3) Listar por cada empleado apellido, cuota asignada, oficina a la 
que pertenece ordenado en forma descendente por cuota.*/

SELECT e.apellido,dc.cuota,o.descripcion
FROM empleados e,datos_contratos dc,oficinas o
WHERE e.cod_oficina=o.cod_oficina
AND e.cod_empleado=dc.cod_empleado

/*4) Listar sin repetir la razón social de todos aquellos clientes que 
hicieron pedidos en Abril.*/

SELECT DISTINCT c.razon_social
FROM clientes c,pedidos pd
WHERE c.cod_cliente=pd.cod_cliente
AND month(pd.fecha_pedido)=04 

/*  5) Listar sin repetir los productos que fueron pedidos en Marzo. */

SELECT DISTINCT p.descripcion
FROM productos p, pedidos pd,detalle_pedido dp
WHERE p.cod_producto=dp.cod_producto
AND dp.cod_pedido=pd.cod_pedido
AND month(pd.fecha_pedido)=03

/* 6) Listar aquellos empleados que están contratados por más de 10 
años ordenado por cantidad de años en forma descendente. */
/* en mi caso todos los empleados fueron contratados desde 2019 entoces no tengo
 a nadie que haya pasado mas de 10 años */
 
SELECT e.*
FROM empleados e, datos_contratos dc
WHERE e.cod_empleado=dc.cod_empleado
AND (YEAR(CURDATE())-year(dc.fecha_contrato)) >10
ORDER BY (YEAR(CURDATE())-year(dc.fecha_contrato)) DESC

/* 7) Obtener una lista de los clientes mayoristas ordenada por razón 
social. */

SELECT c.*
FROM clientes c, detalle_pedido dp,pedidos pd
WHERE pd.cod_pedido=dp.cod_pedido
AND c.cod_cliente=pd.cod_cliente
AND dp.cantidad > 100
ORDER BY c.razon_social

/*  8) Obtener una lista sin repetir que indique qué productos compró 
cada cliente, ordenada por razón social y descripción. */

SELECT DISTINCT c.razon_social, p.descripcion
FROM clientes c, detalle_pedido dp, productos p,pedidos pd
WHERE dp.cod_producto=p.cod_producto
AND c.cod_cliente=pd.cod_cliente
ORDER BY c.razon_social,p.descripcion

/* 9) Obtener una lista con la descripción de aquellos productos cuyo 
stock está por debajo del punto de reposición  indicando 
cantidad a comprar y razón social del fabricante ordenada por 
razón social y descripción.*/

SELECT p.descripcion,(p.punto_reposicion - p.cantidad_stock) as acomprar,f.razon_social
FROM productos p,fabricantes f
WHERE p.cod_fabricante=f.cod_fabricante
AND p.cantidad_stock < p.punto_reposicion
ORDER BY f.razon_social, p.descripcion

/* 10) Listar aquellos empleados cuya cuota es menor a 50000 o 
mayor a 100000. */

SELECT e.apellido,e.nombre
FROM empleados e, datos_contratos dc
WHERE dc.cod_empleado=e.cod_empleado
AND (dc.cuota<50000 OR  dc.cuota>100000)

