-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2024 a las 23:55:12
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_belen2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `responsable` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre`, `responsable`) VALUES
(1, 'Dirección', 'Juan Cabrejos Limo'),
(116, 'Administración', 'Cheryl Apagueño Saavedra'),
(117, 'Estadística', 'Juan Armando'),
(120, 'Epidemiología', 'Laura Perez'),
(122, 'Tesorería', 'Mari Gaby Santillán'),
(123, 'Logística', 'Jhon Damian Flores'),
(124, 'Laboratorio', 'Fiorela Campos'),
(125, 'Medicina', 'Anita Quevedo'),
(126, 'Nutrición', 'Jorge Castillo'),
(127, 'Comunicaciones', 'Luis Torres Sanchez'),
(128, 'CSI', 'DIEGO VILLALOBOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras`
--

CREATE TABLE `computadoras` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `marca` enum('HP','TOSHIBA','LENOVO','DELL','LG','SAMSUNG','HUAWEI','ASUS','ACER') DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `sis_ope` varchar(50) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `procesador` varchar(20) DEFAULT NULL,
  `ram` enum('2GB','4GB','8GB','12GB','16GB','32GB') DEFAULT NULL,
  `disco` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `estado` enum('BUENO','MALO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `computadoras`
--

INSERT INTO `computadoras` (`cod_patrimonial`, `marca`, `modelo`, `serie`, `sis_ope`, `ip`, `procesador`, `ram`, `disco`, `area_id`, `estado`) VALUES
('10080500-01', 'HP', 'Victus', '123TRE', 'Windows 8', '64', 'Core I5', '8GB', 'HDD 1 TB', 125, 'MALO'),
('10080500-05', 'TOSHIBA', 'Satellite', '8E086082S', 'Windows 8', '3453453', 'Core I5', '2GB', 'HDD 1 TB', 117, 'BUENO'),
('11180500-01', 'TOSHIBA', 'Victus', '', 'Windows 11', '', 'Core I9', '16GB', '', 124, 'BUENO'),
('20081500-01', 'LENOVO', 'Idea Pad', 'SDF435K', 'Windows 7', '', 'Core i7', '4GB', 'HD 1Tb', 120, 'MALO'),
('24081500-04', 'LENOVO', 'Idea Pad', 'WE34TB45', 'Windows 10', '', 'Core I5', '2GB', 'HDD 1 TB', 122, 'BUENO'),
('74080500-07', 'HP', 'Satellite C55-B5218KM', '5F065702P', 'Windows 10 Pro', '', 'Core i3', '4GB', 'HD 1Tb', 123, 'BUENO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desplazamiento`
--

CREATE TABLE `desplazamiento` (
  `id` int(9) NOT NULL,
  `motivo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_prov` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsable_prov` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_asig` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_asig` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `desplazamiento`
--

INSERT INTO `desplazamiento` (`id`, `motivo`, `area_prov`, `responsable_prov`, `area_asig`, `responsable_asig`, `fecha`) VALUES
(38, 'Desplazamiento', 'Administración', 'Cheryl Apagueño Saavedra', 'Logística', 'Jhon Damian Flores', '2024-02-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_desplazamiento`
--

CREATE TABLE `detalle_desplazamiento` (
  `id_desplazamiento` int(9) NOT NULL,
  `cod_patrimonial` varchar(50) NOT NULL,
  `tipo_bien` enum('COMPUTADORAS','IMPRESORAS','SWITCHES','PERIFERICOS','SCANNERS','SERVIDORES') NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `serie` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_desplazamiento`
--

INSERT INTO `detalle_desplazamiento` (`id_desplazamiento`, `cod_patrimonial`, `tipo_bien`, `marca`, `modelo`, `serie`) VALUES
(38, '74222358-0443', 'SCANNERS', 'EPSON', 'DR-M260', 'DR-M260');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresoras`
--

CREATE TABLE `impresoras` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `num_toner` varchar(10) DEFAULT NULL,
  `estado` enum('BUENO','REGULAR','MALO') DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `impresoras`
--

INSERT INTO `impresoras` (`cod_patrimonial`, `marca`, `modelo`, `serie`, `num_toner`, `estado`, `area_id`) VALUES
('74080500-08', 'Epson', 'Satellite C55-B5218KM', '5F065702P', '8AC', 'BUENO', 127),
('74222358-02', 'Epson', 'Epson HTJ', '5CG92O7SBW2', '8A', 'BUENO', 116);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patrimonio`
--

CREATE TABLE `patrimonio` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `tipo_dispositivo` enum('computadora','impresora','periferico','servidore','switche') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perifericos`
--

CREATE TABLE `perifericos` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `estado` enum('BUENO','MALO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perifericos`
--

INSERT INTO `perifericos` (`cod_patrimonial`, `nombre`, `marca`, `modelo`, `serie`, `area_id`, `estado`) VALUES
('740895-48', 'Scaner', 'HP', 'Hp Scanner', 'XP1356DFG', 128, 'MALO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scanners`
--

CREATE TABLE `scanners` (
  `cod_patrimonial` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` enum('HP','BROTHER','CANON','EPSON','XEROX') COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sistema_operativo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `velocidad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolucion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `estado` enum('BUENO','MALO') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `scanners`
--

INSERT INTO `scanners` (`cod_patrimonial`, `marca`, `modelo`, `serie`, `sistema_operativo`, `velocidad`, `resolucion`, `area_id`, `estado`) VALUES
('74222358-0443', 'EPSON', 'DR-M260', '', 'Windows', '129 ipm', ' 150 x 150', 116, 'BUENO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servidores`
--

CREATE TABLE `servidores` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `sis_ope` varchar(50) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `procesador` varchar(50) DEFAULT NULL,
  `ram` enum('2GB','4GB','8GB','12GB','16GB','32GB') DEFAULT NULL,
  `disco` varchar(20) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `estado` enum('BUENO','MALO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servidores`
--

INSERT INTO `servidores` (`cod_patrimonial`, `nombre`, `marca`, `modelo`, `serie`, `sis_ope`, `ip`, `procesador`, `ram`, `disco`, `area_id`, `estado`) VALUES
('21089950-21', 'Sismed 123', 'Altron', 'E2051TR', '5CG92O7SBW', 'Ubuntu', '', 'Core i7', '16GB', '', 127, 'MALO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `switches`
--

CREATE TABLE `switches` (
  `cod_patrimonial` varchar(50) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `puertos` int(11) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `estado` enum('BUENO','MALO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `switches`
--

INSERT INTO `switches` (`cod_patrimonial`, `nombre`, `marca`, `modelo`, `serie`, `puertos`, `area_id`, `estado`) VALUES
('12228117-01', 'Sismed XTR', 'TP ALTRON', 'LINK 5G', '5CG92O7SBW', 4, 122, 'MALO'),
('74080500-02', 'Router', 'ZyXel', 'DGS', 'QB1A1B5001063', 16, 127, 'BUENO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass_hash` varchar(255) NOT NULL,
  `rol` enum('ADMINISTRADOR','INFORMATICO') NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `pregunta` varchar(100) DEFAULT NULL,
  `respuesta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `email`, `pass_hash`, `rol`, `estado`, `pregunta`, `respuesta`) VALUES
(1, 'Maria Santillán Cabrejos', 'mari.cabsantillan@gmail.com', '$2y$12$5il/Vsg9YBk3Qg0fHhGVP.B5MUhB8MNVyCyfZh6hENZR8K/r42rkS', 'ADMINISTRADOR', 'ACTIVO', 'Nombre de mascota ', 'Winnie'),
(3, 'Jhon Damian Flores', 'flores20@gmail.com', '$2y$12$2cPrT00JDW06AlwbDK8ai.Hsy9UsSD4MXJFUL0PfMGSo5QGG.mCya', 'INFORMATICO', 'ACTIVO', 'Playa favorita', 'Pimentel'),
(10, 'Laura Santillan', 'laura_santillan@gmail.com', '$2y$12$Clb11ztE7mqbiA/KgyL/7.682f.NlKg1LPPYqKJE4wZimKO7dkjnO', 'INFORMATICO', 'INACTIVO', 'Lugar de Nacimiento', 'Lambayeque'),
(11, 'Admin', 'admin@gmail.com', '$2y$12$RWr9fB1upKxPLp2K2zVleOxEE9AM4oehhuPdcetCn2ZKfqGzwo.3u', 'INFORMATICO', 'ACTIVO', 'Pelicula favorita', 'Fast and furious'),
(12, 'Informatico', 'informatico@gmail.com', '$2y$12$.oaLjpD8d6Wp43r1eoHB.uQeJXcPlCKuU3NJrzRl8FF8mlh/W2zSi', 'INFORMATICO', 'ACTIVO', 'Que miras bobo', 'messi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `desplazamiento`
--
ALTER TABLE `desplazamiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_desplazamiento`
--
ALTER TABLE `detalle_desplazamiento`
  ADD KEY `fk_tabla_principal` (`id_desplazamiento`);

--
-- Indices de la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `patrimonio`
--
ALTER TABLE `patrimonio`
  ADD PRIMARY KEY (`cod_patrimonial`);

--
-- Indices de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `scanners`
--
ALTER TABLE `scanners`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `FK_area` (`area_id`);

--
-- Indices de la tabla `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `switches`
--
ALTER TABLE `switches`
  ADD PRIMARY KEY (`cod_patrimonial`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT de la tabla `desplazamiento`
--
ALTER TABLE `desplazamiento`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD CONSTRAINT `computadoras_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `detalle_desplazamiento`
--
ALTER TABLE `detalle_desplazamiento`
  ADD CONSTRAINT `fk_tabla_principal` FOREIGN KEY (`id_desplazamiento`) REFERENCES `desplazamiento` (`id`);

--
-- Filtros para la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD CONSTRAINT `impresoras_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `patrimonio`
--
ALTER TABLE `patrimonio`
  ADD CONSTRAINT `patrimonio_ibfk_1` FOREIGN KEY (`cod_patrimonial`) REFERENCES `computadoras` (`cod_patrimonial`),
  ADD CONSTRAINT `patrimonio_ibfk_2` FOREIGN KEY (`cod_patrimonial`) REFERENCES `impresoras` (`cod_patrimonial`),
  ADD CONSTRAINT `patrimonio_ibfk_3` FOREIGN KEY (`cod_patrimonial`) REFERENCES `perifericos` (`cod_patrimonial`),
  ADD CONSTRAINT `patrimonio_ibfk_4` FOREIGN KEY (`cod_patrimonial`) REFERENCES `servidores` (`cod_patrimonial`),
  ADD CONSTRAINT `patrimonio_ibfk_5` FOREIGN KEY (`cod_patrimonial`) REFERENCES `switches` (`cod_patrimonial`);

--
-- Filtros para la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD CONSTRAINT `perifericos_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `scanners`
--
ALTER TABLE `scanners`
  ADD CONSTRAINT `FK_area` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `servidores`
--
ALTER TABLE `servidores`
  ADD CONSTRAINT `servidores_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `switches`
--
ALTER TABLE `switches`
  ADD CONSTRAINT `switches_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
