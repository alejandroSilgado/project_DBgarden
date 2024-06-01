CREATE DATABASE GARDEN;
USE GARDEN;

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (gama)
);
CREATE TABLE forma_pago (
  codigo_forma_pago INT(11) NOT NULL,
  tipo VARCHAR(70) NOT NULL,
  PRIMARY KEY (codigo_forma_pago)
);
CREATE TABLE telefono (
  codigo_telefono INT(11) NOT NULL,
  telefono_movil VARCHAR(70) NOT NULL,
  telefono_fijo VARCHAR(80) NOT NULL,
  identificador TINYINT(5) NOT NULL,
  PRIMARY KEY (codigo_telefono)
);

CREATE TABLE estado (
  codigo_estado INT(11) NOT NULL,
  estado_producto VARCHAR(70) NOT NULL,
  empresa_mensajeria VARCHAR(150) NOT NULL,
  PRIMARY KEY (codigo_estado)
);

CREATE TABLE proveedor (
  codigo_proveedor INT(11) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  telefono1 INT(11),
  PRIMARY KEY (codigo_proveedor),
  FOREIGN KEY (telefono1) REFERENCES telefono(codigo_telefono)
);

CREATE TABLE pais (
  codigo_pais INT(11) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo_pais)
);

CREATE TABLE region (
  codigo_region INT(11) NOT NULL,
  nombre_pais INT(11) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo_region),
  FOREIGN KEY (nombre_pais) REFERENCES pais(codigo_pais)
);

CREATE TABLE ciudad (
  codigo_ciudad INT(11) NOT NULL,
  nombre_pais INT(11) NOT NULL,
  nombre_region INT(11) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  codigo_postal INT(9),
  PRIMARY KEY (codigo_ciudad),
  FOREIGN KEY (nombre_pais) REFERENCES pais(codigo_pais),
  FOREIGN KEY (nombre_region) REFERENCES region(codigo_region)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25),
  proveedor INT(11),
  descripcion TEXT,
  cantidad_en_stock SMALLINT(6),
  precio_venta DECIMAL(15,2),
  precio_proveedor DECIMAL(15,2),
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto(gama),
  FOREIGN KEY (proveedor) REFERENCES proveedor(codigo_proveedor)
);

CREATE TABLE cliente (
  codigo_cliente INT NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30),
  apellido_contacto VARCHAR(30),
  telefono INT,
  fax VARCHAR(15),
  linea_direccion1 VARCHAR(50),
  linea_direccion2 VARCHAR(50),
  ciudad INT,
  region INT,
  pais INT,
  codigo_postal VARCHAR(10),
  codigo_empleado_rep_ventas INT,
  limite_credito DECIMAL(15,2),
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (telefono) REFERENCES telefono(codigo_telefono),
  FOREIGN KEY (pais) REFERENCES pais(codigo_pais),
  FOREIGN KEY (region) REFERENCES region(codigo_region),
  FOREIGN KEY (ciudad) REFERENCES ciudad(codigo_ciudad)
);

CREATE TABLE pago (
  codigo_cliente INT(11) NOT NULL,
  forma_pago INT,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago DATE NOT NULL,
  total DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (forma_pago) REFERENCES forma_pago(codigo_forma_pago),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE pedido (
  codigo_pedido INT(11) NOT NULL,
  fecha_pedido DATE NOT NULL,
  fecha_esperada DATE,
  fecha_entrega DATE,
  estado INT(11),
  comentarios TEXT,
  codigo_cliente INT(11) NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
  FOREIGN KEY (estado) REFERENCES estado(codigo_estado)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INT(11) NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INT(11) NOT NULL,
  precio_unidad DECIMAL(15,2) NOT NULL,
  numero_linea SMALLINT(6) NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto, numero_linea),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);
CREATE TABLE oficina (
  codigo_oficina VARCHAR(10) NOT NULL,
  ciudad INT,
  pais INT,
  region INT,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono INT,
  linea_direccion1 VARCHAR(50),
  linea_direccion2 VARCHAR(50),
  PRIMARY KEY (codigo_oficina),
  FOREIGN KEY (ciudad) REFERENCES ciudad(codigo_ciudad),
  FOREIGN KEY (pais) REFERENCES pais(codigo_pais),
  FOREIGN KEY (region) REFERENCES region(codigo_region),
  FOREIGN KEY (telefono) REFERENCES telefono(codigo_telefono)
);

CREATE TABLE empleado (
  codigo_empleado INT(11) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  extension VARCHAR(10),
  email VARCHAR(100),
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe INT(11),
  puesto VARCHAR(50),
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina)
);