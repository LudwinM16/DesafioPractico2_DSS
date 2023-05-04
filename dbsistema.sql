-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-05-2023 a las 16:44:44
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE IF NOT EXISTS `articulo` (
  `idarticulo` int NOT NULL AUTO_INCREMENT,
  `idcategoria` int NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint DEFAULT '1',
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `condicion`) VALUES
(6, 7, '00458', 'Ligheter', 25, 'modelo lighter de MICRONICS', '1535417422.jpg', 1),
(7, 9, '0040kl', 'disco solido', 58, 'disco marca KINGSTON', '1535417431.jfif', 1),
(8, 9, 'PROD69420', 'DATATRAVEL', 107, 'usb de 16gb', '1535417452.jpg', 1),
(9, 8, 'PROD1234', 'Ludwin Ludwin', 7, 'Ejemplo otra vez', '1683002934.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(7, 'TECLADOS', 'teclados gamers', 1),
(8, 'CPU\'s', 'cpus gamers de alta categoria', 1),
(9, 'DISCOS DUROS', 'disco solidos', 1),
(12, 'MONITORES', 'monitores gamers', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
CREATE TABLE IF NOT EXISTS `detalle_ingreso` (
  `iddetalle_ingreso` int NOT NULL AUTO_INCREMENT,
  `idingreso` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_idx` (`idingreso`),
  KEY `fk_detalle_articulo_idx` (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(16, 6, 6, 10, '20.00', '30.00'),
(17, 6, 7, 5, '200.00', '250.00'),
(18, 7, 8, 10, '16.00', '25.00'),
(19, 8, 7, 10, '250.00', '300.00'),
(20, 9, 8, 50, '20.00', '30.00'),
(21, 10, 6, 10, '25.00', '30.00'),
(22, 11, 7, 15, '250.00', '300.00'),
(23, 12, 9, 1, '1.00', '1.00'),
(24, 12, 9, 1, '1.00', '1.00'),
(25, 12, 9, 1, '1.00', '1.00');

--
-- Disparadores `detalle_ingreso`
--
DROP TRIGGER IF EXISTS `tr_updStockIngreso`;
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock=stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int NOT NULL AUTO_INCREMENT,
  `idventa` int NOT NULL,
  `idarticulo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(12, 10, 6, 10, '30.00', '5.00'),
(13, 10, 7, 10, '250.00', '10.00'),
(14, 11, 6, 1, '30.00', '0.00'),
(15, 11, 7, 1, '250.00', '0.00'),
(16, 12, 7, 4, '250.00', '0.00'),
(17, 13, 7, 1, '250.00', '10.00'),
(18, 14, 7, 2, '250.00', '10.00'),
(19, 15, 6, 1, '30.00', '10.00'),
(20, 16, 7, 1, '250.00', '5.00'),
(21, 17, 7, 1, '250.00', '5.00'),
(22, 18, 6, 1, '30.00', '0.00'),
(23, 19, 7, 1, '250.00', '2.00'),
(24, 20, 8, 2, '25.00', '0.00'),
(25, 21, 6, 1, '30.00', '5.00'),
(26, 22, 6, 1, '30.00', '0.00'),
(27, 22, 7, 1, '300.00', '0.00'),
(28, 22, 8, 1, '30.00', '0.00'),
(29, 23, 9, 1, '5.00', '0.00'),
(30, 23, 9, 1, '4.00', '0.00'),
(31, 23, 9, 1, '1.00', '0.00'),
(32, 23, 9, 1, '1.00', '0.00');

--
-- Disparadores `detalle_venta`
--
DROP TRIGGER IF EXISTS `tr_udpStockVenta`;
DELIMITER $$
CREATE TRIGGER `tr_udpStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
CREATE TABLE IF NOT EXISTS `ingreso` (
  `idingreso` int NOT NULL AUTO_INCREMENT,
  `idproveedor` int NOT NULL,
  `idusuario` int DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_ingreso_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(6, 7, 1, 'Factura', '001', '0001', '2018-08-20 00:00:00', '18.00', '1200.00', 'Aceptado'),
(7, 7, 1, 'Factura', '001', '008', '2018-08-21 00:00:00', '18.00', '160.00', 'Aceptado'),
(8, 7, 1, 'Boleta', '0002', '0004', '2018-08-22 00:00:00', '0.00', '2500.00', 'Aceptado'),
(9, 9, 1, 'Factura', '001', '0005', '2018-08-23 00:00:00', '18.00', '1000.00', 'Aceptado'),
(10, 10, 1, 'Factura', '001', '0006', '2018-08-25 00:00:00', '18.00', '250.00', 'Aceptado'),
(11, 10, 1, 'Factura', '001', '0007', '2018-08-27 00:00:00', '18.00', '3750.00', 'Aceptado'),
(12, 9, 1, 'Factura', '12345', '123456', '2023-05-02 00:00:00', '12.00', '3.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(7, 'Proveedor', 'INKA-PC S.R.L', 'RUC', '12587845254', 'Av. los pinos 201', '54328730', 'inkapc@hotmail.com'),
(8, 'Cliente', 'publico general', 'DNI', '30224520', 'Av.jose olaya 215', '54325230', 'public@hotmail.com'),
(9, 'Proveedor', 'TECNO-PC', 'RUC', '20485248751', 'Calle los naranjales 245', '054587852', 'tecno@gmail.com'),
(10, 'Proveedor', 'INFONET', 'RUC', '40485245824', 'Av. quiñones 102', '054789854', 'infonet@hotmail.com'),
(11, 'Cliente', 'pedro', 'DNI', '458521748', 'Simon bolivar 120', '78954263', 'pedro@gmailcom');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'ludwin', 'DUI', '72154871', 'Calle los alpes 210', '547821', 'admin@gmail.com', 'Administrador', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1683045558.jpg', 1),
(2, 'juan', 'DUI', '30115425', 'calle los jirasoles 450', '054789521', 'juan@hotmail.com', 'empleado', 'juan', '5b065b0996c44ab2e641e24472b28d3e38554ce13d06d72b1aa93480dda21d43', '1535417486.jpg', 1),
(3, 'sadas', 'DUI', '06568862-7', 'Bosques de la Paz', '7989-5209', 'jiyar10196@dogemn.com', 'Tilinlover', 'dios', 'c3c193ec815eb5b0a292fd6ceea8c962b1d31d40b4522a0602f68653784e3733', '1682632164.jpg', 1),
(4, 'Jesus', 'DUI', '06568862-3', 'Bosques de la Paz', '79895206', 'asdasd@dasdasd', 'Tilinlover2', 'franco', '40ff986cb84b1d66ec02ee83fb692a720b0636f7c722468c649ec040e19bc5b9', '', 1),
(5, 'Thi Ling', 'DUI', '06568862-7', 'Bosques de la Paz', '7989-5209', 'jiyar10196@dogemn.com', 'Tilinlover3', 'tolon', '74ec7bb9371993f48236f8fd1f14b5f0a8604f19e90a70d81473071fcf068bcd', '1683005413.jpg', 1),
(6, 'xander', 'DUI', '06568892-8', 'sucasa', '1234-5678', 'correo@gmail.com', 'Tilinlover4', 'xander', '0c08d7b9b45c0753aed44e5395aedb56cd4856c02b7ffc409d4a24d3c729db3c', '1683045535.jpg', 1),
(7, 'ratapedo', 'DUI', '72154871', 'Calle los alpes 210', '79895206', 'asdasd@dasdasd', 'Tilinlover5', 'rata', '534e026da7ffac86bafe17a7f5d90181cfead524cc53299971090d9004fda8b9', '1683045734.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idusuario_permiso` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idpermiso` int NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  KEY `fk_usuario_permiso_idx` (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(97, 2, 1),
(98, 2, 4),
(99, 3, 3),
(100, 3, 5),
(101, 4, 4),
(102, 5, 1),
(103, 6, 1),
(104, 6, 2),
(105, 6, 3),
(106, 6, 4),
(107, 6, 5),
(108, 6, 6),
(109, 6, 7),
(117, 1, 1),
(118, 1, 2),
(119, 1, 3),
(120, 1, 4),
(121, 1, 5),
(122, 1, 6),
(123, 1, 7),
(124, 7, 1),
(125, 7, 2),
(126, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `idcliente` int NOT NULL,
  `idusuario` int NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(10, 8, 1, 'Boleta', '001', '0001', '2018-01-08 00:00:00', '0.00', '11800.15', 'Aceptado'),
(11, 8, 1, 'Factura', '001', '0002', '2018-03-05 00:00:00', '18.00', '3800.00', 'Aceptado'),
(12, 8, 1, 'Ticket', '001', '0001', '2018-04-17 00:00:00', '0.00', '1000.00', 'Aceptado'),
(13, 8, 1, 'Factura', '001', '0002', '2018-06-09 00:00:00', '18.00', '240.00', 'Aceptado'),
(14, 8, 1, 'Factura', '20', '30', '2018-07-24 00:00:00', '18.00', '490.00', 'Aceptado'),
(15, 8, 1, 'Factura', '001', '0008', '2018-08-26 00:00:00', '18.00', '20.00', 'Aceptado'),
(16, 8, 1, 'Boleta', '001', '0070', '2018-08-26 00:00:00', '0.00', '245.00', 'Aceptado'),
(17, 8, 1, 'Factura', '002', '0004', '2018-08-26 00:00:00', '18.00', '245.00', 'Aceptado'),
(18, 8, 1, 'Boleta', '001', '0006', '2018-08-26 00:00:00', '0.00', '30.00', 'Aceptado'),
(19, 8, 1, 'Factura', '001', '0009', '2018-08-26 00:00:00', '18.00', '248.00', 'Aceptado'),
(20, 8, 1, 'Factura', '001', '002', '2018-08-26 00:00:00', '18.00', '50.00', 'Aceptado'),
(21, 8, 1, 'Factura', '001', '0004', '2018-08-27 00:00:00', '18.00', '25.00', 'Aceptado'),
(22, 11, 1, 'Ticket', '001', '0004', '2018-08-27 00:00:00', '0.00', '360.00', 'Aceptado'),
(23, 11, 1, 'Factura', '12345', '123456', '2023-05-02 00:00:00', '99.99', '4.00', 'Aceptado');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
