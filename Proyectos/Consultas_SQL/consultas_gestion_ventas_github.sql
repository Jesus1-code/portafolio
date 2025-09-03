-- CREAR LA BASE DE DATOS
DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

-- CREAR TABLA CLIENTE
CREATE TABLE cliente (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
categoria INT UNSIGNED
);

-- CREAR TABLA COMERCIAL
CREATE TABLE comercial (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
comision FLOAT
);

-- CREAR TABLA PEDIDO
CREATE TABLE pedido (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_comercial INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_comercial) REFeRENCES comercial(id)
);

-- INSERTAMOS LOS DATOS EN LA TABLA CLIENTE
INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

-- INSERTAMOS LOS DATOS EN LA TABLA COMERCIAL
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego', 'Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta', 'Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio', 'Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel', 'Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio', 'Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfreso', 'Ruiz', 'Flores', 0.05);

-- INSERTAMOS LOS DATOS EN LA TABLA PEDIDO
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);

-- REALIZAMOS CONSULTAS SOBRE UNA TABLA
-- 1.Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, 
-- mostrando en primer lugar los pedidos más recientes.

SELECT id, total, fecha, id_cliente, id_comercial   -- muestra todas las columnas de la tabla pedido
FROM pedido
ORDER BY fecha DESC;   -- ordena las fechas de manera descendente

-- Esta consulta muestra las actividades de ventas más reciente, generando un registro completo para analizar tendencias en el tiempo, 
-- también se puede observar que cliente y agente comercial están generando más ingresos en el último periodo.


-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT *   -- muestra todas las columnas de la tabla pedido
FROM pedido
ORDER BY total DESC   -- ordena el total de manera descendente
LIMIT 2;   -- restringe el número de filas a solo los dos pedidos de mayor valor

-- El resultado que se muestra es de las dos ventas con mayor impacto, se observa que cliente y agente comercial
-- estuvieron involucrados en una venta especial, o si se pudiera tratar de un dato incorrecto que se pueda revisar.


-- 3. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT *   -- muestra todas las columnas de la tabla pedido
FROM pedido
WHERE YEAR(fecha) = 2017 AND total > 500;   -- la cláusula WHERE filtra filas. YEAR() extrae el año de fecha. El operador AND es la segunda condición

-- La consulta muestra las transacciones significativas en el año 2017, segmentando la base de datos en pedidos más rentables durante el período seleccionado.


-- 4. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT nombre, apellido1, apellido2   -- muestra las columnas de interés
FROM comercial
WHERE comision BETWEEN 0.05 AND 0.11;   -- WHERE filta las filas, El operador BETWEEN permite marcar un rango de valores, el AND incluye el valor1 y valor2

-- Esto proporciona una lista de comerciales que tienen un rango de comisión, lo que puede ser útil para la evaluación de desempeño 
-- o si la empresa decide ofrecer bonificaciones adicionales.


-- 5. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT id, nombre, apellido1   -- selecciona las columnas de interés
FROM cliente
WHERE apellido2 IS NOT NULL   -- La cláusula WHERE filtra filas y el operador IS NOT NULL se usa para verificar si un valor no es nulo
ORDER BY apellido1, nombre;   -- Ordena la consulta primero por el apellido de manera alfabética ascendente por defecto, el orden secundario se aplica al nombre

-- La consulta muestra la calidad y que tan completo están los datos, Clientes con dos apellidos puede ser un grupo objetivo para campañas de marketing.
-- La ordenación alfabética es un estándar de buenas prácticas para la presentación de datos.


-- REALIZAMOS CONSULTAS MULTITABLA
-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2   -- DISTINCT asegura que aparezca solo un resultado por cliente
FROM cliente AS c   -- se le asigna un alias 'c' a la tabla cliente
JOIN pedido AS p ON c.id = p.id_cliente   -- JOIN combina filas de dos o más tablas, según la realción de columnas
ORDER BY c.apellido1, c.nombre;   -- ordena alfabéticamente por el primer apellido y luego por el nombre

-- Se muestra los clientes activos con al menos una transacción, es l base para campañas de marketing dirigidas a clientes que han comprado y permite validar las relaciones entre tablas.


-- 2. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT p.*, c.*   -- selecciona todas las columnas de la tabla pedido y comercial
FROM pedido AS p
JOIN comercial AS c	ON p.id_comercial = c.id   -- JOIN combina filas cuando el 'id_comercial' en la tabla pedido coincide con el 'id' en la tabla comercial
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- Se observa cuántos pedidos ha gestionado cada comercial, con esto permite analizar el desempeño de cada uno con el total de las ventas,
-- fecha de los pedidos y frecuencia de las transacciones. 


-- 3. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

SELECT cl.*, p.*, co.*   -- muestra todas las columnas de las tres tablas
FROM cliente AS cl   -- se le asigna un alias a la tabla base cliente como 'cl'
JOIN pedido AS p ON cl.id = p.id_cliente   -- se combina cada fila de la tabla cliente con filas de pedido, vinculado 'cl.id' y 'p.id_cliente'
JOIN comercial AS co ON p.id_comercial = co.id;   -- el resultado del primer JOIN se combina con este, con la condición 'p.id_comercial' igual a 'co.id'

-- Esta consulta permite un rastreo de transacciones desde quien compró hasta quién vendió, identificando una relación cliente-comercial y entender la dinámica de ventas.
-- También permite generar un análisis de valor del cliente por el total de cada pedido y lo largo de sus transacciones. De la misma manera se puede analizar el rendimiento
-- de los comerciantes por cliente y agrupandolos por el total de ventas generado o con que clientes ha logrado las mayores ventas.


-- 4. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

SELECT DISTINCT co.nombre, co.apellido1, co.apellido2   -- el DISTINCT permite mostrar solo una vez el nombre del comercial, así la cliente María haya realizado varias compras
FROM cliente AS cl   -- alias para la tabla cliente 'cl'
JOIN pedido AS p ON cl.id = p.id_cliente   -- combina filas de la tabal cliente con la tabla pedido  por el 'cl.id' y 'p.id_cliente'
JOIN comercial AS co ON p.id_comercial = co.id   -- lo que resulta del primer JOIN se combina con este mediante el 'p.id_comercial' y 'co.id'
WHERE cl.nombre = 'María' AND cl.apellido1 = 'Santana' AND cl.apellido2 = 'Moreno';   -- esta cláusula es el filtro principal donde el nombre y apellidos coincide con el cliente

-- Este tipo de consulta permite identificar que comercial esta interactuando con un cliente específico, crucial para la coordinación, seguimiento de que el cliente reciba un buen servicio.
-- De otra manera se podría observar si un cliente ha trabajado con comerciales diferente, dando una señal de que el cliente no es estable o que ha sido atendido por diferentes divisiones o equipos.


-- 5. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.

SELECT cl.nombre, cl.apellido1, cl.apellido2,   -- selecciona los datos del cliente y los datos del pedido
p.id AS id_pedido, p.total, p.fecha
FROM cliente AS cl
LEFT JOIN pedido AS p ON cl.id = p.id_cliente   -- LEFT JOIN asegura que todos los clientes de la tabla cliente sean incluidos 
ORDER BY cl.apellido1, cl.apellido2, cl.nombre;   -- ordena alfabéticamentepriorizando el apellido  luego el nombre

-- Los clientes que aparecen con valores NULL del pedido son aquellos que no han realizado una compra. Permite evaluar la tasa de conversión comparando el total de clientes
-- con los que han realizado al menos un pedido. 


-- 6. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

SELECT c.nombre, c.apellido1, c.apellido2
FROM comercial AS c
LEFT JOIN pedido AS p ON c.id = p.id_comercial   -- conserva las filas de la tabla comercial(izquierda) y las une con las filas que coinciden en la tabla pedido
WHERE p.id IS NULL;   -- cláusula clave cuando un comercial no tiene pedido asociados, por lo tanto IS NULL aisla a esos comerciales 

-- Muestra los comerciales que por alguna razón están inactivos, si llegase existir alto porcentaje de comerciales en esta lista, podría indicar un problema más grande en el proceso de venta.


-- 7. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. 
-- En en listado deberá diferenciar de algún modo los clientes y los comerciales.

SELECT 'cliente' AS tipo_entidad, c.nombre, c.apellido1, c.apellido2   -- se agrega una columna estática llamada 'tipo_entidad', para diferenciar
FROM cliente AS c
LEFT JOIN pedido AS p ON c.id = p.id_cliente   -- encontrar filas en la tabla izquierda(cliente o comercial) que no tiene correspondecia en la tabla derecha(pedido)
WHERE p.id IS NULL
UNION   -- operador combina los resultados de los dos SELECT
SELECT 'comercial' AS tipo_entidad, co.nombre, co.apellido1, co.apellido2   -- se agrega una columna estática llamada 'tipo_entidad', para diferenciar
FROM comercial AS co
LEFT JOIN pedido as p ON co.id = p.id_comercial
WHERE p.id IS NULL
ORDER BY apellido1, apellido2, nombre;   -- permite el orden de manera alfabética

-- Se genera una lista de las personas que no están generando actividad de ventas. Permite identificar clientes quee no han realizado una compra.
-- Se logra identificar ineficiencias y así tomar decisiones basadas en información.


-- REALIZAMOS CONSULTAS RESUMEN

-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

SELECT ROUND(SUM(total), 2) AS total_pedidos   -- la función SUM suma todos los valores del total, ROUND redondea el número de decimales, en este caso 2
FROM pedido;

-- Se observa los ingreso brutos generados por los pedidos. Se puede usar esta consulta para comparar las ventas en diferentes periodos.
-- Es un dato esencial para informes financieros y presentaciones.


-- 2. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

SELECT ciudad, MAX(categoria) AS max_categoria   -- la función MAX encuentra el valor más alto en la columna categoría
FROM cliente
GROUP BY ciudad;   -- agrupa las filas que tienen el mismo valor en la columna 'ciudad'

-- Muestra la distribución de clientes de alta categoría, con esta información se pueden enfocar estrategias para invertir más en campañas a esos mercados.


-- 3. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
-- Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.fecha, 
MAX(p.total) AS max_pedido_diario   -- la función MAX encuentra el valor más alto en la columna total
FROM cliente AS c
JOIN pedido AS p ON c.id = p.id_cliente   -- esta cláusula une la tabla cliente con la tabla pedido
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2, p.fecha;   -- se crea un grupo único para cada cliente en cada día que realizó un pedido

-- Identifica el pedido de mayor valor en un día determinado, útil para campañas de marketing de transacciones recientes.
-- Se podría detectar patrones de compra múltiples en un solo día, lo que puede ser un comportasmiento interesante.


-- 4. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. 
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. 
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

SELECT c.id, c.nombre, c.apellido1, c.apellido2,
COUNT(p.id) AS numero_total_pedidos   -- la función COUNT cuenta el número de valores no nulos en una columna
FROM cliente AS c
LEFT JOIN pedido AS p ON c.id = p.id_cliente   -- asegura que cada cliente este en el resultado incluso sino tiene coincidencia en la tabla pedido
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2   -- se agrupa el resultado por los datos cliente y la función COUNT calcule el total de pedidos
ORDER BY c.apellido1, c.apellido2, c.nombre;   -- ordena el listado de manera alfabética

-- Se logra identificar los clientes más activos, esencial para programas de fidelización o campañas para recompensar a los mejores clientes.
-- Igualmente se observa los clientes que no han realizado compras, se puede enfocar en campañas de correo electrónico y lograr convertirlos a clientes activos.


-- 5. Devuelve cuál ha sido el pedido de máximo valor y el número total de pedidos que se ha realizado cada año.

SELECT YEAR(fecha) AS anio,   -- extrae el año de la columna fecha
MAX(total) AS max_valor_pedido,   -- encuentra el valor más alto del pedido
COUNT(id) AS numero_total_pedidos   -- cuenta el número de pedidos
FROM pedido
GROUP BY anio   -- agrupa las filas de pedidos que corresponde al mismo año
ORDER BY anio;   -- ordena el resultado de manera cronológica

-- Se observa en los resultados la dinámica de ventas año a año, al igual que permite evaluar si la empresa está creciendo en términos de volumen de pedidos
-- o valor de las transacciones, ejemplo, en el año 2015 tuvo poco pedidos, pero uno de ellos fue la ventas más grande registrada.


-- REALIZAMOS SUBCONSULTAS
-- CON OPERADORES BÁSICOS DE COMPARACIÓN

-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

SELECT *   -- consulta principal que toma el resultado de la subcomnsulta y lo usa en la clausula WHERE
FROM pedido
WHERE id_cliente =(
	SELECT id   -- subconsulta que se ejecuta primero y devuelve el 'id' del cliente
    FROM cliente
    WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz'
);

-- Se muestra todos los pedidos realizados por la cliente con el 'id_cliente = 2'. Con operadores básicos se encadenan lógicas de filtrado de manera secuencial,
-- donde el resultado de una consulta se convierte en el filtro de otra. 


-- 2. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

SELECT fecha, total   -- toma el resultado de la subconsulta y filtra en la tabla pedido
FROM pedido
WHERE id_cliente = (
	SELECT id   -- consulta interna busca en la tabla cliente el id del cliente
    FROM cliente
    WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana'
    )
ORDER BY total ASC LIMIT 1;   -- ordena los pedidos de mayor a menor y restringe el resultado a una sola fila, que es el de menor valor

-- Con esta consulta se puede entender el comportamiento de gasto de un cliente, identificando no solo sus compras grandes, sino también las más pequeñas.
-- Por el historial de pedidos de bajo valor podría ser candidato para campañas que incentiven compras de mayor valor.


-- 3. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor 
-- mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.id AS id_pedido, p.total, p.fecha
FROM cliente AS cl
JOIN pedido AS p ON cl.id = p.id_cliente   -- une las tablas cliente y pedido para que acceda a los datos de ambas
WHERE YEAR(p.fecha) = 2017 AND p.total >= (   -- filtra los pedidos del 2017 y que tienen un valor total mayor o igual que devuelve la subconsulta
	SELECT AVG(TOTAL)   -- se calcula primero el valor promedio (AVG) de los pedido realizados en 2017
    FROM pedido
    WHERE YEAR(fecha) = 2017
);

-- El resultado muestra los clientes que han realizado transacciones por encima de la media del año 2017. Si muchos de los pedidos son de un solo cliente
-- puede indicar dependencia peligros, lo ideal es que esten distribuidos entre varios clientes. Igalmente con esta consulta se podría analizar que productos o servicios se
-- están vendiendo en los pedidosde alto valor, dirigiendo campañas de marketing a promover esos productos o ajustar estrategia de precios.


-- SUBCONSULTAS CON ALL Y ANY

-- 4. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

SELECT *
FROM pedido
WHERE total >= ALL (   -- WHERE compara cada total de la tabla pedido con los valores que devuelve la subconsulta. El operador ALL se evalua como TRUE para los valores mayores que los valores generados por la subconsulta
	SELECT total   -- subconsulta devuelve una lista de los valores de la columna total en la tabla pedido
    FROM pedido
    );
    
-- El resultado de esta consulta muestra una alternativa en el uso de ALL, sin el uso de MAX, ORDER BY más LIMIT, 
-- dando como resultado la fila del pedido con el valor más alto (5760).

-- SUBCONSULTAS CON IN Y NOT IN

-- 5. Devuelveun listado de los clientes que no han realizado ningún pedido.

SELECT *
FROM cliente
WHERE id NOT IN (   -- consulta principal, usa el operador NOT IN para filtrar la tabla cliente devuelta por la subconsulta
	SELECT DISTINCT id_cliente   -- subconsulta que genera una lista de identificadores, DISTINCT asegura que aparezca una sola vez
    FROM pedido
    );
    
-- El resultado muestra un listado de los clientes que no han realizado ninguna compra. Permite la segmentar a los clientes para campañas de marketing
-- dirigidas a incentivarlos a realizar una compra. Un alto número de cliente sin pedidos indicaría un problema en el proceso de incorporación de 
-- nuevos clientes o en la efectividad de las estrategias de adquisición. Al igual que sirve  para limpiar la base de datos de clientes inactivos.

-- SUBCONSULTAS CON EXISTS Y NOT EXISTS

-- 6. Devuelve un listado de los comerciales que no han realizado ningún pedido.

SELECT *
FROM comercial AS c   -- selecciona todos los datos de la tabla comercial
WHERE NOT EXISTS (   -- el operadorNOT EXISTS es un probador de existencia, si la subconsulta no devuelve ninguna fila, NOT EXISTS es verdadero
	SELECT id
    FROM pedido AS p
    WHERE p.id_comercial = c.id   -- esta subconsulta busca un pedido que tenga el mismo 'id_comercial', si el comercial no tiene pedidos este se incluirá en el resultado final
    );
    
-- Este resultado enseña un listado de los comerciales inactivos, información crucial para la gestión del rendimiento de ventas.
-- El operador EXISTS y NOT EXISTS solo necesita encontrar una sola fila que cumpla la condición, no necesita procesar todas las filas
-- de la subconsulta ni traer todos los datos. Es una sintaxis más clara para la idea de encontrar filas que no tienen correspondencia.