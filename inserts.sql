USE GARDEN;

-- Inserción para la tabla gama_producto
INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES
('Electrónica', 'Productos electrónicos de alta calidad', '<p>Productos electrónicos de alta calidad</p>', 'electronica.jpg'),
('Muebles', 'Muebles modernos y cómodos', '<p>Muebles modernos y cómodos</p>', 'muebles.jpg'),
('Juguetes', 'Juguetes para todas las edades', '<p>Juguetes para todas las edades</p>', 'juguetes.jpg'),
('Ropa', 'Ropa de moda para todas las estaciones', '<p>Ropa de moda para todas las estaciones</p>', 'ropa.jpg'),
('Alimentos', 'Productos alimenticios frescos y enlatados', '<p>Productos alimenticios frescos y enlatados</p>', 'alimentos.jpg'),
('Libros', 'Libros de todos los géneros', '<p>Libros de todos los géneros</p>', 'libros.jpg'),
('Electrodomésticos', 'Electrodomésticos para el hogar', '<p>Electrodomésticos para el hogar</p>', 'electrodomesticos.jpg'),
('Herramientas', 'Herramientas para profesionales y aficionados', '<p>Herramientas para profesionales y aficionados</p>', 'herramientas.jpg'),
('Deportes', 'Artículos deportivos y de fitness', '<p>Artículos deportivos y de fitness</p>', 'deportes.jpg'),
('Cosméticos', 'Productos de belleza y cuidado personal', '<p>Productos de belleza y cuidado personal</p>', 'cosmeticos.jpg'),
('Ornamentales', 'Productos para el cuidado del hogar', '<p>Productos para el cuidado del hogar<p>', 'ornamentales.jpg');

-- Inserción para la tabla forma_pago
INSERT INTO forma_pago (codigo_forma_pago, tipo) VALUES
(1, 'Tarjeta de Crédito'),
(2, 'PayPal'),
(3, 'Transferencia Bancaria'),
(4, 'Tarjeta de Débito'),
(5, 'Efectivo'),
(6, 'Cheque');

-- Inserción para la tabla telefono
INSERT INTO telefono (codigo_telefono, telefono_movil, telefono_fijo, identificador) VALUES
(1, '555-1234', '555-5678', 1),
(2, '555-2345', '555-6789', 2),
(3, '555-3456', '555-7890', 3),
(4, '555-4567', '555-8901', 4),
(5, '555-5678', '555-9012', 5),
(6, '555-6789', '555-0123', 6),
(7, '555-7890', '555-1234', 7),
(8, '555-8901', '555-2345', 8),
(9, '555-9012', '555-3456', 9),
(10, '555-0123', '555-4567', 10),
(11, '555-3456', '555-5678', 11);

-- Inserción para la tabla estado
INSERT INTO estado (codigo_estado, estado_producto, empresa_mensajeria) VALUES
(1, 'Procesando', 'DHL'),
(2, 'Enviado', 'FedEx'),
(3, 'Entregado', 'UPS'),
(4, 'Rechazado', 'DHL'),
(5, 'Devuelto', 'FedEx'),
(6, 'Pendiente', 'UPS'),
(7, 'Preparando', 'DHL'),
(8, 'Listo para enviar', 'FedEx'),
(9, 'En tránsito', 'UPS'),
(10, 'Retenido', 'DHL'),
(11, 'Cancelado', 'FedEx');

-- Inserción para la tabla proveedor
INSERT INTO proveedor (codigo_proveedor, nombre, apellido, telefono1) VALUES
(1, 'Juan', 'Perez', 1),
(2, 'Maria', 'Gomez', 2),
(3, 'Carlos', 'Hernandez', 3),
(4, 'Ana', 'Martinez', 4),
(5, 'Luis', 'Rodriguez', 5),
(6, 'Sofia', 'Lopez', 6),
(7, 'Miguel', 'Garcia', 7),
(8, 'Laura', 'Fernandez', 8),
(9, 'Jose', 'Martinez', 9),
(10, 'Elena', 'Gonzalez', 10),
(11, 'Pedro', 'Sanchez', 11);

-- Inserción para la tabla pais
INSERT INTO pais (codigo_pais, nombre) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Chile'),
(4, 'Colombia'),
(5, 'Ecuador'),
(6, 'Mexico'),
(7, 'Peru'),
(8, 'Uruguay'),
(9, 'Venezuela'),
(10, 'Bolivia'),
(11, 'España');

-- Inserción para la tabla region
INSERT INTO region (codigo_region, nombre_pais, nombre) VALUES
(1, 1, 'Buenos Aires'),
(2, 2, 'São Paulo'),
(3, 3, 'Santiago'),
(4, 4, 'Bogotá'),
(5, 5, 'Quito'),
(6, 6, 'Ciudad de México'),
(7, 7, 'Lima'),
(8, 8, 'Montevideo'),
(9, 9, 'Caracas'),
(10, 10, 'La Paz'),
(11, 11, 'Madrid'),
(12, 11, 'Barcelona');

-- Inserción para la tabla ciudad
INSERT INTO ciudad (codigo_ciudad, nombre_pais, nombre_region, nombre, codigo_postal) VALUES
(1, 1, 1, 'Ciudad Autónoma de Buenos Aires', 1000),
(2, 2, 2, 'São Paulo', 2000),
(3, 3, 3, 'Santiago', 3000),
(4, 4, 4, 'Bogotá', 4000),
(5, 5, 5, 'Quito', 5000),
(6, 6, 6, 'Ciudad de México', 6000),
(7, 7, 7, 'Lima', 7000),
(8, 8, 8, 'Montevideo', 8000),
(9, 9, 9, 'Caracas', 9000),
(10, 10, 10, 'La Paz', 10000),
(11, 11, 11, 'Madrid', 28001),
(12, 11, 12, 'Barcelona', 08001);

-- Inserción para la tabla producto
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
('P001', 'Televisor', 'Electrónica', '40x30x10', 1, 'Televisor de alta definición', 50, 500.00, 400.00),
('P002', 'Sofá', 'Muebles', '200x100x90', 2, 'Sofá de tres plazas', 20, 300.00, 250.00),
('P003', 'Muñeca', 'Juguetes', '30x10x5', 3, 'Muñeca articulada', 100, 20.00, 15.00),
('P004', 'Camisa', 'Ropa', 'L', 4, 'Camisa de algodón', 150, 25.00, 20.00),
('P005', 'Lata de frijoles', 'Alimentos', '10x10x10', 5, 'Frijoles enlatados', 200, 1.50, 1.00),
('P006', 'Libro de aventuras', 'Libros', '20x15x5', 6, 'Libro de aventuras para jóvenes', 80, 10.00, 7.00),
('P007', 'Refrigerador', 'Electrodomésticos', '200x80x60', 7, 'Refrigerador con congelador', 10, 600.00, 500.00),
('P008', 'Taladro', 'Herramientas', '30x20x10', 8, 'Taladro eléctrico', 70, 100.00, 80.00),
('P009', 'Bicicleta', 'Deportes', '150x80x60', 9, 'Bicicleta de montaña', 15, 200.00, 150.00),
('P010', 'Maquillaje', 'Cosméticos', '5x5x5', 10, 'Maquillaje compacto', 120, 15.00, 10.00),
('P011', 'Maceta', 'Ornamentales', '30*10', 5, 'Maceta para ortaliza', 150, 800.00, 500.00),
('P012', 'Planta', 'Ornamentales', '50*20', 11, 'Planta de interior', 200, 1200.00, 800.00);

-- Inserción para la tabla cliente
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES
(1, 'Cliente A', 'Juan', 'Perez', 1, '555-1234', 'Calle Falsa 123', NULL, 1, 1, 1, '1000', 1, 5000.00),
(2, 'Cliente B', 'Maria', 'Gomez', 2, '555-2345', 'Avenida Siempre Viva 456', NULL, 2, 2, 2, '2000', 2, 10000.00),
(3, 'Cliente C', 'Carlos', 'Hernandez', 3, '555-3456', 'Calle Luna 789', NULL, 3, 3, 3, '3000', 3, 7500.00),
(4, 'Cliente D', 'Ana', 'Martinez', 4, '555-4567', 'Calle Sol 101', NULL, 4, 4, 4, '4000', 4, 6000.00),
(5, 'Cliente E', 'Luis', 'Rodriguez', 5, '555-5678', 'Avenida Mar 202', NULL, 5, 5, 5, '5000', 5, 8500.00),
(6, 'Cliente F', 'Sofia', 'Lopez', 6, '555-6789', 'Calle Nube 303', NULL, 6, 6, 6, '6000', 6, 9000.00),
(7, 'Cliente G', 'Miguel', 'Garcia', 7, '555-7890', 'Avenida Rio 404', NULL, 7, 7, 7, '7000', 7, 11000.00),
(8, 'Cliente H', 'Laura', 'Fernandez', 8, '555-8901', 'Calle Lluvia 505', NULL, 8, 8, 8, '8000', 8, 12000.00),
(9, 'Cliente I', 'Jose', 'Martinez', 9, '555-9012', 'Avenida Sol 606', NULL, 9, 9, 9, '9000', 9, 13000.00),
(10, 'Cliente J', 'Elena', 'Gonzalez', 10, '555-0123', 'Calle Luna 707', NULL, 10, 10, 10, '10000', 10, 14000.00),
(11, 'Cliente Español', 'Pedro', 'Alvarez', 11, '555-1122', 'Calle Mayor 100', NULL, 11, 11, 11, '28001', 11, 12000.00);
-- Inserción para la tabla pago
INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) VALUES
(1, 1, 'TX001', '2022-01-10', 100.00),
(2, 2, 'TX002', '2022-02-15', 200.00),
(3, 3, 'TX003', '2022-03-20', 300.00),
(4, 4, 'TX004', '2022-04-25', 400.00),
(5, 5, 'TX005', '2022-05-30', 500.00),
(6, 6, 'TX006', '2022-06-05', 600.00),
(7, 1, 'TX007', '2022-07-10', 700.00),
(8, 2, 'TX008', '2022-08-15', 800.00),
(9, 3, 'TX009', '2022-09-20', 900.00),
(10, 4, 'TX010', '2022-10-25', 1000.00),
(11, 2, 'TX011', '2008-06-15', 1000.00),
(5, 2, 'TX012', '2008-05-05', 500.00);

-- Inserción para la tabla pedido
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES
(1, '2022-01-10', '2022-01-15', '2022-01-14', 3, 'Entregado a tiempo', 1),
(2, '2022-02-15', '2022-02-20', '2022-02-19', 3, 'Entregado a tiempo', 2),
(3, '2022-03-20', '2022-03-25', '2022-03-24', 3, 'Entregado a tiempo', 3),
(4, '2022-04-25', '2022-04-30', '2022-04-29', 3, 'Entregado a tiempo', 4),
(5, '2022-05-30', '2022-06-05', '2022-06-04', 3, 'Entregado a tiempo', 5),
(6, '2022-06-05', '2022-06-10', '2022-06-09', 3, 'Entregado a tiempo', 6),
(7, '2022-07-10', '2022-07-15', '2022-07-14', 3, 'Entregado a tiempo', 7),
(8, '2022-08-15', '2022-08-20', '2022-08-19', 3, 'Entregado a tiempo', 8),
(9, '2022-09-20', '2022-09-25', '2022-09-24', 3, 'Entregado a tiempo', 9),
(10, '2022-10-25', '2022-10-30', '2022-10-29', 3, 'Entregado a tiempo', 10),
(11, '2023-01-10', '2023-01-15', '2023-01-14', 1, 'Entregado a tiempo', 1),
(12, '2023-05-10', '2023-05-15', '2023-05-14', 4, 'Entregado antes de tiempo', 2),
(13, '2009-07-10', '2009-07-20', '2009-07-25', 4, 'Pedido rechazado', 3);

-- Inserts para la tabla detalle_pedido
INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES
(1, 'P001', 1, 500.00, 1),
(2, 'P002', 2, 300.00, 1),
(3, 'P003', 3, 20.00, 1),
(4, 'P004', 4, 25.00, 1),
(5, 'P005', 5, 1.50, 1),
(6, 'P006', 6, 10.00, 1),
(7, 'P007', 1, 600.00, 1),
(8, 'P008', 2, 100.00, 1),
(9, 'P009', 3, 200.00, 1),
(10, 'P010', 4, 15.00, 1);

-- Inserción para la tabla oficina
INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES
('OFC01', 1, 1, 1, '1000', 1, 'Calle Falsa 123', NULL),
('OFC02', 2, 2, 2, '2000', 2, 'Avenida Siempre Viva 456', NULL),
('OFC03', 3, 3, 3, '3000', 3, 'Calle Luna 789', NULL),
('OFC04', 4, 4, 4, '4000', 4, 'Calle Sol 101', NULL),
('OFC05', 5, 5, 5, '5000', 5, 'Avenida Mar 202', NULL),
('OFC06', 6, 6, 6, '6000', 6, 'Calle Nube 303', NULL),
('OFC07', 7, 7, 7, '7000', 7, 'Avenida Rio 404', NULL),
('OFC08', 8, 8, 8, '8000', 8, 'Calle Lluvia 505', NULL),
('OFC09', 9, 9, 9, '9000', 9, 'Avenida Sol 606', NULL),
('OFC10', 10, 10, 10, '10000', 10, 'Calle Luna 707', NULL),
('OFC11', 11, 11, 11, '28001', 11, 'Calle Mayor 100', NULL);

-- Inserción para la tabla empleado
INSERT INTO empleado (codigo_empleado, nombre, apellido1, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
(1, 'Juan', 'Perez', '101', 'juan.perez@empresa.com', 'OFC01', NULL, 'Gerente'),
(2, 'Maria', 'Gomez', '102', 'maria.gomez@empresa.com', 'OFC02', 1, 'Subgerente'),
(3, 'Carlos', 'Hernandez', '103', 'carlos.hernandez@empresa.com', 'OFC03', 1, 'Supervisor'),
(4, 'Ana', 'Martinez', '104', 'ana.martinez@empresa.com', 'OFC04', 2, 'Vendedor'),
(5, 'Luis', 'Rodriguez', '105', 'luis.rodriguez@empresa.com', 'OFC05', 7, 'Vendedor'),
(6, 'Sofia', 'Lopez', '106', 'sofia.lopez@empresa.com', 'OFC06', 3, 'Vendedor'),
(7, 'Miguel', 'Garcia', '107', 'miguel.garcia@empresa.com', 'OFC07', 3, 'Vendedor'),
(8, 'Laura', 'Fernandez', '108', 'laura.fernandez@empresa.com', 'OFC08', 4, 'Vendedor'),
(9, 'Jose', 'Martinez', '109', 'jose.martinez@empresa.com', 'OFC09', 7, 'Vendedor'),
(10, 'Elena', 'Gonzalez', '110', 'elena.gonzalez@empresa.com', 'OFC10', 7, 'Vendedor'),
(11, 'Pedro', 'Alvarez', '111', 'pedro.alvarez@empresa.com', 'OFC11', 7, 'Vendedor');

UPDATE `GARDEN`.`pago` SET `codigo_cliente` = '10' WHERE (`codigo_cliente` = '9') and (`id_transaccion` = 'TX009');
UPDATE `GARDEN`.`pago` SET `codigo_cliente` = '10' WHERE (`codigo_cliente` = '8') and (`id_transaccion` = 'TX008');
