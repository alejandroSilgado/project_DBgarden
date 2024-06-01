USE GARDEN;

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT o.codigo_oficina, c.nombre AS ciudad
FROM oficina AS o
INNER JOIN ciudad AS c ON o.ciudad = c.codigo_ciudad;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de mexico.

SELECT
c.nombre AS ciudad,
    t.telefono_fijo AS telefono_oficina
FROM
oficina AS o
INNER JOIN
ciudad c ON o.ciudad = c.codigo_ciudad
INNER JOIN
pais p ON o.pais = p.codigo_pais
INNER JOIN
telefono t ON o.telefono = t.codigo_telefono
WHERE
p.nombre = 'Mexico';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
-- jefe tiene un código de jefe igual a 7.

SELECT
e.nombre as nombre_empleado,
    e.apellido1 as primer_apellido,
    e.apellido2 as segundo_apellido,
    e.email
FROM
empleado e
WHERE
e.codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
-- empresa.
SELECT
e.puesto as cargo,
e.nombre as nombre_empleado,
    e.apellido1 as primer_apellido,
    e.apellido2 as segundo_apellido,
    e.email
FROM
empleado e
WHERE
e.codigo_jefe IS NULL;
   
-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
-- empresa.
SELECT
e.puesto as cargo,
e.nombre as nombre_empleado,
    e.apellido1 as primer_apellido,
    e.apellido2 as segundo_apellido,
    e.email
FROM
empleado e
WHERE
e.codigo_jefe IS NULL;
   
-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
-- empleados que no sean Vendedor.
SELECT
e.nombre as nombre_empleado,
    e.apellido1 as primer_apellido,
    e.apellido2 as segundo_apellido,
    e.puesto as cargo
FROM
empleado e
WHERE
e.puesto != "Vendedor";

-- 6. Devuelve un listado con el nombre de los todos los clientes Canadá
SELECT
c.nombre_contacto as nombre_cliente,
    c.apellido_contacto as apellido_cliente
FROM
cliente c
WHERE
c.pais = "3";
   
-- 7. Devuelve un listado con los distintos estados por los que puede pasar un
-- pedido.

SELECT
e.estado_producto as estados_pedidos
FROM
estado AS e;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que
-- realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
-- aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

-- Utilizando la función YEAR de MySQL.
SELECT DISTINCT
p.codigo_cliente, p.fecha_pago
FROM
pago AS p
WHERE
YEAR(p.fecha_pago) = 2008 ;
SELECT * FROM pago;
-- Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT
p.codigo_cliente, p.fecha_pago
FROM
pago AS p
WHERE
    DATE_FORMAT(p.fecha_pago, '%Y') = '2008';
   
-- Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT
p.codigo_cliente, p.fecha_pago
FROM
pago AS p
WHERE
    p.fecha_pago BETWEEN '2008-01.01' AND '2008-12.31';

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos que no han sido entregados a
-- tiempo.
SELECT
p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM
pedido AS p
WHERE
    datediff(p.fecha_esperada, p.fecha_entrega) < 0 ;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
-- menos dos días antes de la fecha esperada.
-- • Utilizando la función ADDDATE de MySQL.
-- Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
-- menos dos días antes de la fecha esperada.

-- • Utilizando la función ADDDATE de MySQL.
SELECT
    p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM
    pedido AS p
WHERE
    p.fecha_entrega <= ADDDATE(p.fecha_esperada, INTERVAL -2 DAY);

-- • Utilizando la función DATEDIFF de MySQL.

SELECT
p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM
pedido AS p
WHERE
    datediff(p.fecha_esperada, p.fecha_entrega) >= 2 ;

-- • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

SELECT
    p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM
    pedido AS p
WHERE
    p.fecha_entrega <= p.fecha_esperada - INTERVAL 2 DAY;

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

SELECT
*
FROM
pedido p
WHERE
YEAR(p.fecha_pedido) = 2009
    AND p.estado = 4
;

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el
-- mes de enero de cualquier año.

SELECT
*
FROM
pedido p
WHERE
month(p.fecha_entrega) = 01;
   
-- 13. Devuelve un listado con todos los pagos que se realizaron en el
-- año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT
p.fecha_pago, p.forma_pago, p.total
FROM
pago p
WHERE
YEAR(p.fecha_pago) = 2008
    AND p.forma_pago = 2 -- Paypal
ORDER BY
total DESC;
     

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la
-- tabla pago. Tenga en cuenta que no deben aparecer formas de pago
-- repetidas.

SELECT DISTINCT
*
FROM
forma_pago fp;

-- 15. Devuelve un listado con todos los productos que pertenecen a la
-- gama Ornamentales y que tienen más de 100 unidades en stock. El listado
-- deberá estar ordenado por su precio de venta, mostrando en primer lugar
-- los de mayor precio.

SELECT
*
FROM
producto p
WHERE
p.cantidad_en_stock > 100
    AND gama = "Ornamentales"
ORDER BY
precio_venta DESC;
   
-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
-- cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT
*
FROM
cliente c
WHERE
c.ciudad = 11
    AND (c.codigo_empleado_rep_ventas = 11 OR c.codigo_empleado_rep_ventas = 30);

--------------------------------------------------
--- Consultas multitabla (Composición interna) ---
--------------------------------------------------

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
-- representante de ventas.

SELECT
c.nombre_contacto as nombre_cliente,
    e.nombre as nombre_rep_ventas,
e.apellido1 as apellido_rep_ventas
FROM
cliente AS c
JOIN empleado as e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
-- nombre de sus representantes de ventas.
SELECT DISTINCT
c.codigo_cliente,
c.nombre_contacto as nombre_cliente,
    e.nombre as nombre_rep_ventas,
e.apellido1 as apellido_rep_ventas
FROM
cliente AS c
JOIN
empleado AS e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN
pago AS p on c.codigo_cliente = p.codigo_cliente;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
-- el nombre de sus representantes de ventas.

SELECT
    c.codigo_cliente,
    c.nombre_contacto AS nombre_cliente,
    e.nombre AS nombre_rep_ventas,
    e.apellido1 AS apellido_rep_ventas
FROM
    cliente AS c
JOIN
    empleado AS e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN
    pago AS p ON c.codigo_cliente = p.codigo_cliente
WHERE
    p.codigo_cliente IS NULL;
   
-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

SELECT DISTINCT
    c.nombre_contacto AS nombre_cliente,
    e.nombre AS nombre_rep_ventas,
    e.apellido1 AS apellido_rep_ventas,
    ci.nombre
FROM
    cliente AS c
JOIN
    empleado AS e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN
    oficina AS o ON e.codigo_oficina = o.codigo_oficina
JOIN
ciudad as ci ON ci.codigo_ciudad = o.ciudad
JOIN
    pago AS p ON c.codigo_cliente = p.codigo_cliente
WHERE
    p.codigo_cliente IS NOT NULL;

-- 5. Devuelve un listado que muestre solamente los empleados que no tienen un
-- cliente asociado.

SELECT
    e.codigo_empleado,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_empleado
FROM
    empleado AS e
LEFT JOIN
    cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.codigo_empleado_rep_ventas IS NULL OR c.codigo_empleado_rep_ventas = 0;
   
-- 6. Devuelve un listado que muestre solamente los empleados que no tienen un
-- cliente asociado junto con los datos de la oficina donde trabajan.
SELECT
    e.codigo_empleado,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_empleado,
    o.codigo_oficina,
    o.ciudad,
    o.pais,
    o.region,
    o.codigo_postal,
    o.telefono,
    o.linea_direccion1,
    o.linea_direccion2
FROM
    empleado e
LEFT JOIN
    cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
    oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE
    c.codigo_empleado_rep_ventas IS NULL;


-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina
-- asociada y los que no tienen un cliente asociado.
SELECT
    e.codigo_empleado,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_empleado,
    o.codigo_oficina IS NULL AS sin_oficina,
    c.codigo_cliente IS NULL AS sin_cliente
FROM
    empleado e
LEFT JOIN
    oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN
    cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    o.codigo_oficina IS NULL OR c.codigo_cliente IS NULL;

-- 8. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.

SELECT
    p.codigo_producto,
    p.nombre,
    p.gama,
    p.dimensiones,
    p.proveedor,
    p.descripcion,
    p.cantidad_en_stock,
    p.precio_venta,
    p.precio_proveedor
FROM
    producto p
WHERE
    p.codigo_producto NOT IN (SELECT dp.codigo_producto FROM detalle_pedido dp);


-- 9. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

SELECT
    p.nombre,
    p.descripcion,
    gp.imagen
FROM
    producto p
JOIN
    gama_producto gp ON p.gama = gp.gama
WHERE
    p.codigo_producto NOT IN (SELECT dp.codigo_producto FROM detalle_pedido dp);
   
-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.
SELECT
    *
FROM
    oficina
WHERE
    codigo_oficina NOT IN (
        SELECT
            DISTINCT e.codigo_oficina
        FROM
            empleado e
        JOIN
            cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        JOIN
            pedido pd ON c.codigo_cliente = pd.codigo_cliente
        JOIN
            detalle_pedido dp ON pd.codigo_pedido = dp.codigo_pedido
        JOIN
            producto p ON dp.codigo_producto = p.codigo_producto
        WHERE
            p.gama = 'Frutales'
    );
-- 11. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.
SELECT DISTINCT
    c.*
FROM
    cliente c
JOIN
    pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN
    pago pg ON c.codigo_cliente = pg.codigo_cliente
WHERE
    pg.codigo_cliente IS NULL;
-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes
-- asociados y el nombre de su jefe asociado.
-- Listado de empleados que no tienen clientes asociados y el nombre de su jefe
SELECT
    e.codigo_empleado,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_empleado,
    j.nombre AS nombre_jefe,
    j.apellido1 AS apellido_jefe
FROM
    empleado e
LEFT JOIN
    empleado j ON e.codigo_jefe = j.codigo_empleado
LEFT JOIN
    cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.codigo_empleado_rep_ventas IS NULL;

--------------------------------------------------
---           Consultas resumen                ---
--------------------------------------------------
-- 1. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(*) AS total_empleados
FROM empleado;

-- 2. ¿Cuántos clientes tiene cada país?
SELECT
    p.nombre AS nombre_pais,
    COUNT(c.codigo_cliente) AS total_clientes
FROM
    cliente c
JOIN
    pais p ON c.pais = p.codigo_pais
GROUP BY
    p.nombre;

-- 3. ¿Cuál fue el pago medio en 2008?
SELECT
    AVG(total) AS pago_medio_2009
FROM
    pago
WHERE
    YEAR(fecha_pago) = 2008;
   
-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
-- descendente por el número de pedidos.

SELECT
    estado,
    COUNT(*) AS cantidad_pedidos
FROM
    pedido
GROUP BY
    estado
ORDER BY
    cantidad_pedidos DESC;
-- 5. Calcula el precio de venta del producto más caro y más barato en una
-- misma consulta.

SELECT
    'Más caro' AS tipo,
    MAX(precio_venta) AS precio
FROM
    producto
UNION ALL
SELECT
    'Más barato' AS tipo,
    MIN(precio_venta) AS precio
FROM
    producto;
-- 6. Calcula el número de clientes que tiene la empresa.
SELECT COUNT(*) AS total_clientes
FROM cliente;
-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT
COUNT(*) AS total_clientes_madrid
FROM
cliente c
JOIN
ciudad ci ON c.ciudad = ci.codigo_ciudad
WHERE
ci.nombre = 'Madrid';

-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
-- por M?
SELECT
ci.nombre AS ciudad, COUNT(*) AS total_clientes
FROM
cliente c
JOIN
ciudad ci ON c.ciudad = ci.codigo_ciudad
WHERE
ci.nombre LIKE 'M%'
GROUP BY
ci.nombre;

-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes
-- al que atiende cada uno.
SELECT
    e.nombre AS nombre_rep_ventas,
    COUNT(ci.codigo_cliente) AS numero_clientes
FROM
    empleado AS e
LEFT JOIN
    cliente AS ci ON e.codigo_empleado = ci.codigo_empleado_rep_ventas
GROUP BY
    e.nombre;

-- 10. Calcula el número de clientes que no tiene asignado representante de
-- ventas.
SELECT
COUNT(c.codigo_empleado_rep_ventas) as total_clientes_sin_rep_ventas
FROM
cliente AS c
WHERE
c.codigo_empleado_rep_ventas = 0;

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los
-- clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

SELECT
    c.nombre_contacto AS nombre_cliente,
    c.apellido_contacto AS apellido_cliente,
    MIN(p.fecha_pago) AS primera_fecha_pago,
    MAX(p.fecha_pago) AS ultima_fecha_pago
FROM
    cliente AS c
LEFT JOIN
    pago AS p ON c.codigo_cliente = p.codigo_cliente
GROUP BY
    c.nombre_contacto, c.apellido_contacto;
-- 12. Calcula el número de productos diferentes que hay en cada uno de los
-- pedidos.
SELECT
    codigo_pedido,
    COUNT(DISTINCT codigo_producto) AS num_productos_diferentes
FROM
    detalle_pedido
GROUP BY
    codigo_pedido;
-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en
-- cada uno de los pedidos.
SELECT
    codigo_pedido,
    SUM(cantidad) AS cantidad_total
FROM
    detalle_pedido
GROUP BY
    codigo_pedido;
-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de
-- unidades que se han vendido de cada uno. El listado deberá estar ordenado
-- por el número total de unidades vendidas.
SELECT
    p.codigo_producto,
    p.nombre AS nombre_producto,
    SUM(dp.cantidad) AS total_unidades_vendidas
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY
    p.codigo_producto, p.nombre
ORDER BY
    total_unidades_vendidas DESC
LIMIT 20;
-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la
-- base imponible, el IVA y el total facturado. La base imponible se calcula
-- sumando el coste del producto por el número de unidades vendidas de la
-- tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
-- suma de los dos campos anteriores.
SELECT
    SUM(dp.cantidad * p.precio_venta) AS base_imponible,
    SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
    SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.codigo_producto = p.codigo_producto;
-- 16. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto.

SELECT
    dp.codigo_producto,
    SUM(dp.cantidad * p.precio_venta) AS base_imponible,
    SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
    SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY
    dp.codigo_producto;
   
-- 17. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto filtrada por los códigos que empiecen por OR.
SELECT
    dp.codigo_producto,
    SUM(dp.cantidad * p.precio_venta) AS base_imponible,
    SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
    SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.codigo_producto = p.codigo_producto
WHERE
    dp.codigo_producto LIKE 'OR%'
GROUP BY
    dp.codigo_producto;
-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000
-- euros. Se mostrará el nombre, unidades vendidas, total facturado y total
-- facturado con impuestos (21% IVA).
SELECT
    p.nombre AS nombre_producto,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * p.precio_venta) AS total_facturado_sin_iva,
    SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado_con_iva
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY
    p.nombre
HAVING
    SUM(dp.cantidad * p.precio_venta) > 3000;
   
-- 19. Muestre la suma total de todos los pagos que se realizaron para cada uno
-- de los años que aparecen en la tabla pagos.
SELECT
    YEAR(fecha_pago) AS año,
    SUM(total) AS total_pagado
FROM
    pago
GROUP BY
    YEAR(fecha_pago)
ORDER BY
    YEAR(fecha_pago);
---------------------------------------------------------
--- Subconsultas Con operadores básicos de comparación---
---------------------------------------------------------
-- 1. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT
nombre_contacto
FROM
cliente
WHERE
limite_credito = (SELECT MAX(limite_credito) FROM cliente);
-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT
nombre
FROM
producto
WHERE
precio_venta = (SELECT MAX(precio_venta) FROM producto);
   
-- 3. Devuelve el nombre del producto del que se han vendido más unidades.
-- (Tenga en cuenta que tendrá que calcular cuál es el número total de
-- unidades que se han vendido de cada producto a partir de los datos de la
-- tabla detalle_pedido)

SELECT p.nombre
FROM producto p
JOIN (
    SELECT codigo_producto, SUM(cantidad) AS total_unidades_vendidas
    FROM detalle_pedido
    GROUP BY codigo_producto
) AS unidades_vendidas ON p.codigo_producto = unidades_vendidas.codigo_producto
ORDER BY unidades_vendidas.total_unidades_vendidas DESC
LIMIT 1;

-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
-- realizado. (Sin utilizar INNER JOIN).

SELECT codigo_cliente, nombre_cliente
FROM cliente
WHERE limite_credito > (
    SELECT SUM(total)
    FROM pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente
);
