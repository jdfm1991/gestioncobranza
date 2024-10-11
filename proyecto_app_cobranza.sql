-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2024 a las 18:05:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_app_cobranza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cliente_data`
--

CREATE TABLE `tabla_cliente_data` (
  `id` varchar(50) NOT NULL,
  `nombre_apel` varchar(200) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cliente_data`
--

INSERT INTO `tabla_cliente_data` (`id`, `nombre_apel`, `documento`, `correo`, `telefono`, `estatus`) VALUES
('6700474ad0b14', 'jovanni D. Franco M.', 'V-20975144-1', 'correo@gmail.com', '0424-9254565', 1),
('6700479d15fd1', 'Antoima Grabriela', 'V-25994336', 'otrocorreo@gmail.com', '0412-9543685', 2),
('670047f916710', 'Carlos Manuel Garcias', 'V-25987159', 'cmgarcias@gmail.com', '0426-5872358', 1),
('6707fce952572', 'juan jose', '145879656', 'juan@juan.com', '4249585687', 1),
('6708fc1fe2981', 'carlos martinez', '14587965', 'carlos@carlos.com', '4249585687', 1),
('6708fd131e4a4', 'jesus alvarado', 'V-25987159', 'juan@juan.com', '25482151', 1),
('6708ff135a0aa', 'jesus alvarado 2', 'V-259871565', 'juan@juan.com', '4249585687', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cliente_estatus`
--

CREATE TABLE `tabla_cliente_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cliente_estatus`
--

INSERT INTO `tabla_cliente_estatus` (`id`, `estatus`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Borrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_data`
--

CREATE TABLE `tabla_cobranza_data` (
  `id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `orden` varchar(20) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `nodo` varchar(20) NOT NULL,
  `plan` int(11) DEFAULT NULL,
  `monto` decimal(28,4) NOT NULL,
  `abono` decimal(28,4) DEFAULT 0.0000,
  `detalle` varchar(300) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_data`
--

INSERT INTO `tabla_cobranza_data` (`id`, `fecha_creacion`, `orden`, `contrato`, `cliente`, `nodo`, `plan`, `monto`, `abono`, `detalle`, `estatus`) VALUES
(1, '2024-10-04', 'OC-001/2024', '670049d82491b', '670047f916710', '1', 1, 20.0000, 20.0000, 'Cobro De Servicio Del Mes De Octubre', 2),
(2, '2024-10-04', 'OC-002/2024', '67004a3836e4c', '6700474ad0b14', '1', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Octubre', 1),
(3, '2024-10-04', 'OC-003/2024', '67004a188a520', '6700474ad0b14', '2', 5, 10.0000, 30.0000, 'Visita Tecnica Reparacion de Cableado', 2),
(4, '2024-10-05', 'OC-004/2024', '670049d82491b', '670047f916710', '1', 1, 20.0000, 15.0000, 'Cobro De Servicio Del Mes De Octubre', 3),
(5, '2024-10-06', 'OC-005/2024', '670049d82491b', '670047f916710', '1', 1, 20.0000, 20.0008, 'Cobro De Servicio Del Mes De Octubre', 2),
(6, '2024-10-06', 'OC-006/2024', '670049f0cdaf0', '670047f916710', '3', 5, 30.0000, 15.0000, 'cosas de revsion', 3),
(7, '2024-10-06', 'OC-007/2024', '6702dc09557fc', '670047f916710', '1', 5, 20.0000, 0.0000, 'cobro adicional', 1),
(13, '2024-10-11', 'OC-008/2024', '670049f0cdaf0', '670047f916710', '3', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Octubre', 1),
(14, '2024-10-11', 'OC-009/2024', '67004a188a520', '6700474ad0b14', '2', 1, 20.0000, 30.0000, 'Cobro De Servicio Del Mes De Octubre', 2),
(15, '2024-10-11', 'OC-010/2024', '6702dc09557fc', '670047f916710', '1', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Octubre', 1),
(16, '2024-10-11', 'OC-011/2024', '670901010170c', '6708fc1fe2981', '2', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Octubre', 1),
(17, '2024-10-11', 'OC-012/2024', '670049d82491b', '670047f916710', '1', 5, 10.0000, 5.0000, 'visita tecnica', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_estatus`
--

CREATE TABLE `tabla_cobranza_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_estatus`
--

INSERT INTO `tabla_cobranza_estatus` (`id`, `estatus`) VALUES
(1, 'Cobro Pendiente'),
(2, 'Cobro Liquidado'),
(3, 'Cobro Abonado'),
(4, 'Cobro Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_pago`
--

CREATE TABLE `tabla_cobranza_pago` (
  `id` int(11) NOT NULL,
  `orden` varchar(20) NOT NULL,
  `nota` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_pago`
--

INSERT INTO `tabla_cobranza_pago` (`id`, `orden`, `nota`) VALUES
(1, '1', '6702d01456565'),
(2, '4', '6702d03bae22b'),
(3, '5', '6702d0795228d'),
(4, '4', '6702d75065346'),
(5, '5', '6702da9f570da'),
(6, '17', '67093dc7a4892'),
(7, '3', '67093e0c19a27'),
(8, '14', '67093e0c19a27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_data`
--

CREATE TABLE `tabla_contrato_data` (
  `id` varchar(20) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `plan` int(11) NOT NULL,
  `nodo` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_data`
--

INSERT INTO `tabla_contrato_data` (`id`, `fecha_apertura`, `cliente`, `contrato`, `plan`, `nodo`, `direccion`, `estatus`) VALUES
('670049d82491b', '2024-09-02', '670047f916710', 'C-001/2024', 1, 1, 'La mansion de mi Abuela', 2),
('670049f0cdaf0', '2024-08-17', '670047f916710', 'C-002/2024', 1, 3, 'La otra casa de mi mama', 2),
('67004a188a520', '2024-10-04', '6700474ad0b14', 'C-003/2024', 1, 2, 'La direccion exacta', 1),
('67004a3836e4c', '2024-08-25', '6700474ad0b14', 'C-004/2024', 1, 1, 'Ahi mismitico, lleganod a la cazona', 2),
('6702dc09557fc', '2024-08-08', '670047f916710', 'C-005/2024', 1, 1, 'fhfdh', 2),
('670901010170c', '2024-08-15', '6708fc1fe2981', 'C-006/2024', 1, 2, 'la direccion', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_estatus`
--

CREATE TABLE `tabla_contrato_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_estatus`
--

INSERT INTO `tabla_contrato_estatus` (`id`, `estatus`) VALUES
(1, 'Nuevo'),
(2, 'Antiguo'),
(3, 'Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_nodo`
--

CREATE TABLE `tabla_contrato_nodo` (
  `id` int(11) NOT NULL,
  `nodo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_nodo`
--

INSERT INTO `tabla_contrato_nodo` (`id`, `nodo`) VALUES
(1, 'NODO de prueba'),
(2, 'NODO PRINCIPAL'),
(3, 'NODO SECUNDARIO'),
(4, 'nodo ultimo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_plan`
--

CREATE TABLE `tabla_contrato_plan` (
  `id` int(11) NOT NULL,
  `plan` varchar(50) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `costo` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_plan`
--

INSERT INTO `tabla_contrato_plan` (`id`, `plan`, `detalle`, `costo`) VALUES
(1, 'Plan Basico Ideal', 'Servicio de 20Mb de Velocidad de Internet', 20.0000),
(5, 'Contrato Servicio', 'cosas de servicio', 0.0000),
(6, 'plan avanzado', '40 mb de navegacion', 40.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_empresa_data`
--

CREATE TABLE `tabla_empresa_data` (
  `id` int(11) NOT NULL,
  `empresa` varchar(200) NOT NULL,
  `rif` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_data`
--

CREATE TABLE `tabla_pago_data` (
  `id` varchar(20) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `nota` varchar(20) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `forma_pago` int(11) NOT NULL,
  `detalle_pago` int(11) NOT NULL,
  `monto_dolar` decimal(28,4) NOT NULL,
  `fecha_pago` date NOT NULL,
  `tasa` decimal(28,4) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `monto_cambio` decimal(28,4) DEFAULT NULL,
  `monto_pago` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_data`
--

INSERT INTO `tabla_pago_data` (`id`, `fecha_registro`, `nota`, `cliente`, `contrato`, `forma_pago`, `detalle_pago`, `monto_dolar`, `fecha_pago`, `tasa`, `referencia`, `monto_cambio`, `monto_pago`) VALUES
('6702d01456565', '2024-10-06 13:10:48', 'NE-001/2024', '670047f916710', '670049d82491b', 1, 1, 20.0000, '2024-10-01', 37.0000, '55645', 20.0000, 740.0000),
('6702d03bae22b', '2024-10-06 14:10:27', 'NE-002/2024', '670047f916710', '670049d82491b', 2, 4, 20.0000, '2024-10-02', 37.0000, '', 10.0000, 10.0000),
('6702d0795228d', '2024-10-06 14:10:29', 'NE-003/2024', '670047f916710', '670049d82491b', 1, 2, 20.0000, '2024-10-03', 37.0000, '5488', 10.8108, 400.0000),
('6702d75065346', '2024-10-06 14:10:40', 'NE-004/2024', '670047f916710', '670049d82491b', 2, 4, 10.0000, '2024-10-03', 35.0000, '', 5.0000, 0.0000),
('6702da9f570da', '2024-10-06 14:10:47', 'NE-005/2024', '670047f916710', '670049d82491b', 2, 3, 9.1900, '2024-10-03', 37.0000, '', 9.1900, 340.0300),
('67093dc7a4892', '2024-10-11 11:10:27', 'NE-006/2024', '670047f916710', '670049d82491b', 2, 4, 10.0000, '2024-10-11', 35.0000, '', 5.0000, 0.0000),
('67093e0c19a27', '2024-10-11 11:10:36', 'NE-007/2024', '6700474ad0b14', '67004a188a520', 1, 1, 30.0000, '2024-10-10', 36.0000, '48454', 30.0000, 1080.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_forma`
--

CREATE TABLE `tabla_pago_forma` (
  `id` int(11) NOT NULL,
  `forma` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_forma`
--

INSERT INTO `tabla_pago_forma` (`id`, `forma`) VALUES
(1, 'Banco'),
(2, 'Efectivo'),
(3, 'Digital');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_forma_detalle`
--

CREATE TABLE `tabla_pago_forma_detalle` (
  `id` int(11) NOT NULL,
  `detalle` varchar(30) NOT NULL,
  `forma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_forma_detalle`
--

INSERT INTO `tabla_pago_forma_detalle` (`id`, `detalle`, `forma`) VALUES
(1, 'Transferencia', 1),
(2, 'Pago movil', 1),
(3, 'Efectivo Bs', 2),
(4, 'Efectivo $', 2),
(5, 'Binance', 3),
(6, 'Paypal', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_tasa_data`
--

CREATE TABLE `tabla_tasa_data` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tasa` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_tasa_data`
--

INSERT INTO `tabla_tasa_data` (`id`, `fecha`, `tasa`) VALUES
(1, '2024-10-11', 35.0000),
(2, '2024-10-10', 36.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_usuario_data`
--

CREATE TABLE `tabla_usuario_data` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenna` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_usuario_data`
--

INSERT INTO `tabla_usuario_data` (`id`, `nombre`, `usuario`, `contrasenna`, `fecha_registro`) VALUES
(2, 'jovanni Franco', 'jfranco', '$2y$10$sNBgUR2QUzWcT9hoDmZmiuvm.rAlKgefwniPbJKEcBUDq4tM7lsMS', '2024-09-29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tabla_cliente_data`
--
ALTER TABLE `tabla_cliente_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estatus_fk_c` (`estatus`);

--
-- Indices de la tabla `tabla_cliente_estatus`
--
ALTER TABLE `tabla_cliente_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_data`
--
ALTER TABLE `tabla_cobranza_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_data`
--
ALTER TABLE `tabla_contrato_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_fk_c` (`plan`),
  ADD KEY `cliente_fk_c` (`cliente`),
  ADD KEY `estado_fk_c` (`estatus`);

--
-- Indices de la tabla `tabla_contrato_estatus`
--
ALTER TABLE `tabla_contrato_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_nodo`
--
ALTER TABLE `tabla_contrato_nodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_plan`
--
ALTER TABLE `tabla_contrato_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_data`
--
ALTER TABLE `tabla_pago_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_forma`
--
ALTER TABLE `tabla_pago_forma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_forma_detalle`
--
ALTER TABLE `tabla_pago_forma_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_tasa_data`
--
ALTER TABLE `tabla_tasa_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_usuario_data`
--
ALTER TABLE `tabla_usuario_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tabla_cliente_estatus`
--
ALTER TABLE `tabla_cliente_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_data`
--
ALTER TABLE `tabla_cobranza_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_estatus`
--
ALTER TABLE `tabla_contrato_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_nodo`
--
ALTER TABLE `tabla_contrato_nodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_plan`
--
ALTER TABLE `tabla_contrato_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma`
--
ALTER TABLE `tabla_pago_forma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma_detalle`
--
ALTER TABLE `tabla_pago_forma_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_tasa_data`
--
ALTER TABLE `tabla_tasa_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tabla_usuario_data`
--
ALTER TABLE `tabla_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
