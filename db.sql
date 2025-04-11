CREATE DATABASE IF NOT EXISTS proyectophp3;

USE proyectophp3;

CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(30),
  password VARCHAR(32),
  nombre VARCHAR(30),
  apellido VARCHAR(30),
  cedula INT,
  /*nuevos*/
  pais VARCHAR(30),
  nickname VARCHAR(30),
  /*nuevos*/
  tipo VARCHAR(30),
  PRIMARY KEY(id_usuario)
);
CREATE TABLE IF NOT EXISTS compra (
  id_compra INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha DATE,
  total FLOAT,
  /*nuevos*/
  metodo_pago VARCHAR(30),
  impuesto VARCHAR(30),
  /*nuevos*/
  PRIMARY KEY(id_compra),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30),
  precio FLOAT,
  cantidad INT NOT NULL,
  descripcion VARCHAR(100),
  /*nuevos PONER BOOLEANO*/
  liberado VARCHAR(2),
  nuevo VARCHAR(2),
  /*nuevos PONER BOOLEANO*/
  imagen LONGBLOB,
  PRIMARY KEY(id_producto)
);
CREATE TABLE IF NOT EXISTS carrito (
  id_carrito INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  fecha DATE,
  /*nuevos*/
  cupon_descuento VARCHAR(30),
  porcentaje_descuento VARCHAR(30),
  /*nuevos*/
  PRIMARY KEY(id_carrito),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);

INSERT INTO usuario (email, password, nombre, apellido, cedula, tipo)
VALUES ('migonzv@gmail.com', md5('123'), 'miguel', 'gonzalez', '321', 'Administrador'),
('migonzv2@gmail.com', md5('123'), 'miguel2', 'gonzalez2', '654', 'usuario');