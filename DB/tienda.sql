-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-05-2023 a las 05:08:16
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
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

DROP TABLE IF EXISTS `caja`;
CREATE TABLE IF NOT EXISTS `caja` (
  `caja_id` int NOT NULL AUTO_INCREMENT,
  `caja_numero` int NOT NULL,
  `caja_nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `caja_estado` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL,
  PRIMARY KEY (`caja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_descripcion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_estado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_descripcion`, `categoria_estado`) VALUES
(1, 'Prueba', 'Prueba 1', 'Habilitada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(37) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_apellido` varchar(37) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_genero` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_telefono` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_provincia` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_ciudad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_direccion` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_clave` varchar(535) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_foto` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_cuenta_estado` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `cliente_cuenta_verificada` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_nombre`, `cliente_apellido`, `cliente_genero`, `cliente_telefono`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_email`, `cliente_clave`, `cliente_foto`, `cliente_cuenta_estado`, `cliente_cuenta_verificada`) VALUES
(1, 'Ludwin', 'Martínez', 'Masculino', '22222121', 'San Salvador', 'Ilopango', 'Mi casa', 'ludwin@gmail.com', 'QldNRXpqc2tHWEdyVC9YOWxwYjgvQT09', 'Avatar_Male_4.png', 'Activa', 'Verificada'),
(2, 'Xander', 'Hernandez', 'Masculino', '21212121', 'Soyapango', 'Soyapango', 'SU casa suya', 'xander@correo.com', 'M0VEMGlQMGNKVU9nS3lobUdna2tZZz09', 'Avatar_Female_4.png', 'Activa', 'No verificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `empresa_id` int NOT NULL AUTO_INCREMENT,
  `empresa_tipo_documento` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_numero_documento` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_nombre` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_impuesto_nombre` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `empresa_impuesto_porcentaje` int NOT NULL,
  `empresa_factura_impuestos` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

DROP TABLE IF EXISTS `favorito`;
CREATE TABLE IF NOT EXISTS `favorito` (
  `favorito_id` int NOT NULL AUTO_INCREMENT,
  `favorito_fecha` date NOT NULL,
  `cliente_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`favorito_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE IF NOT EXISTS `imagen` (
  `imagen_id` int NOT NULL AUTO_INCREMENT,
  `imagen_nombre` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`imagen_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_sku` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_nombre` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_descripcion` varchar(535) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_stock` int NOT NULL,
  `producto_stock_minimo` int NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_descuento` int NOT NULL,
  `producto_tipo` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_presentacion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_marca` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_modelo` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_estado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_portada` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_sku`, `producto_nombre`, `producto_descripcion`, `producto_stock`, `producto_stock_minimo`, `producto_precio_compra`, `producto_precio_venta`, `producto_descuento`, `producto_tipo`, `producto_presentacion`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_portada`, `categoria_id`) VALUES
(1, 'PROD123', '1123456', 'FRESAS', 'PRUEBA PRUEBA', 1234, 3, '123.00', '321.00', 0, 'Fisico', 'Caja', 'DIOS', 'TILIN', 'Habilitado', 'E7E1H1Q5I9-1.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(37) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(37) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_telefono` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_genero` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_cargo` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_clave` varchar(535) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_cuenta_estado` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario_foto` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_telefono`, `usuario_genero`, `usuario_cargo`, `usuario_usuario`, `usuario_email`, `usuario_clave`, `usuario_cuenta_estado`, `usuario_foto`) VALUES
(1, 'Administrador', 'Principal', '00000000', 'Masculino', 'Administrador', 'Administrador', 'admin@admin.com', 'K1hvdkhOR2hvQ1pzK2V1STJPaGlwQT09', 'Activa', 'Avatar_Male_2.png'),
(2, 'Xander', 'Martinez', '', 'Masculino', 'Administrador', 'xander', 'xander@correo.com', 'M0VEMGlQMGNKVU9nS3lobUdna2tZZz09', 'Activa', 'Avatar_default_male.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `venta_codigo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_tipo_envio` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_impuesto_nombre` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_impuesto_porcentaje` int NOT NULL,
  `venta_estado_envio` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_estado_pagado` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_subtotal` decimal(30,2) NOT NULL,
  `venta_impuestos` decimal(30,2) NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_costo` decimal(30,2) NOT NULL,
  `venta_utilidad` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `caja_id` int NOT NULL,
  PRIMARY KEY (`venta_id`),
  UNIQUE KEY `venta_codigo` (`venta_codigo`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empresa_id` (`empresa_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `caja_id` (`caja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
CREATE TABLE IF NOT EXISTS `venta_detalle` (
  `venta_detalle_id` int NOT NULL,
  `venta_detalle_cantidad` int NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_regular` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_costo` decimal(30,2) NOT NULL,
  `venta_detalle_utilidad` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `venta_codigo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `producto_id` int NOT NULL,
  KEY `venta_id` (`venta_codigo`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`);

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  ADD CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
