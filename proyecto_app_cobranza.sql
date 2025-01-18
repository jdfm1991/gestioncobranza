-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2025 a las 14:50:11
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
('678a73525cd80', 'Carlos Manuel Garcias', 'V-25987159', 'juan@juan.com', '123147', 1),
('678a73664e3a6', 'jesus alvarado', 'V-259871565', 'correo@gmail.com', '159123', 1);

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
  `id` varchar(20) NOT NULL,
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
('678ba1241e573', '2025-01-18', 'OC-003/2025', '678b484b69895', '678a73525cd80', '1', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Enero-2025', 1),
('678ba12420b91', '2025-01-18', 'OC-004/2025', '678b4869c639d', '678a73664e3a6', '4', 6, 40.0000, 40.0000, 'Cobro De Servicio Del Mes De Enero-2025', 2),
('678ba1cb03ae2', '2025-01-18', 'OC-005/2025', '678ba16e1eda8', '678a73664e3a6', '3', 1, 20.0000, 0.0000, 'Cobro De Servicio Del Mes De Enero-2025', 1),
('678ba1cb0951d', '2025-01-18', 'OC-006/2025', '678ba1bc74442', '678a73664e3a6', '1', 7, 30.0000, 20.0000, 'Cobro De Servicio Del Mes De Enero-2025', 3),
('67d967454934d', '2025-03-18', 'OC-001/2025', '678b484b69895', '678a73525cd80', '1', 1, 20.0000, 10.0000, 'Cobro De Servicio Del Mes De Marzo-2025', 3),
('67d9674551c0e', '2025-03-18', 'OC-002/2025', '678b4869c639d', '678a73664e3a6', '4', 6, 40.0000, 40.0000, 'Cobro De Servicio Del Mes De Marzo-2025', 2);

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
  `nota` varchar(20) NOT NULL,
  `pago` decimal(28,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_pago`
--

INSERT INTO `tabla_cobranza_pago` (`id`, `orden`, `nota`, `pago`) VALUES
(1, '67d967454934d', '67d967454d9ba', 10.0000),
(2, '67d9674551c0e', '67d9674552fc4', 5.0000),
(3, '678ba1cb0951d', '678ba2c4672c2', 20.0000),
(4, '678ba12420b91', '678ba8255e00b', 40.0000),
(5, '67d9674551c0e', '678ba8255e00b', 35.0000);

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
  `estatus` int(11) NOT NULL,
  `saldo` decimal(28,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_data`
--

INSERT INTO `tabla_contrato_data` (`id`, `fecha_apertura`, `cliente`, `contrato`, `plan`, `nodo`, `direccion`, `estatus`, `saldo`) VALUES
('678b484b69895', '2024-12-01', '678a73525cd80', 'C-001/2024', 1, 1, 'la casa de el', 2, 0.0000),
('678b4869c639d', '2024-11-01', '678a73664e3a6', 'C-002/2024', 6, 4, 'ota  as', 2, 0.9259),
('678ba16e1eda8', '2024-12-05', '678a73664e3a6', 'C-001/2025', 1, 3, 'oknoooi', 2, 0.0000),
('678ba1bc74442', '2024-11-20', '678a73664e3a6', 'C-004/2024', 7, 1, 'lkjnon', 2, 0.0000);

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
(1, 'NODO BALA'),
(2, 'NODO PRINCIPAL'),
(3, 'NODO SECUNDARIO'),
(4, 'NODO FULL');

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
(6, 'plan avanzado', '40 mb de navegacion', 40.0000),
(7, 'Plan 3', 'muenod', 30.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_departamento_data`
--

CREATE TABLE `tabla_departamento_data` (
  `id` int(11) NOT NULL,
  `link` varchar(20) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_departamento_data`
--

INSERT INTO `tabla_departamento_data` (`id`, `link`, `departamento`, `modulo`) VALUES
(1, 'contrato', 'Gestion De Contratos', 2),
(2, 'cliente', 'Gestion De Cliente', 1),
(3, 'cobranza', 'Gestion De Cobranza', 2),
(4, 'pago', 'Gestion De Pagos', 2),
(5, 'herramientas', 'Herramientas De Sistema', 3),
(6, 'usuario', 'Gestion de Usuario', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_accion_data`
--

CREATE TABLE `tabla_depart_accion_data` (
  `id` int(11) NOT NULL,
  `accion` varchar(10) NOT NULL,
  `departamento` int(11) NOT NULL,
  `opcion` varchar(15) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_boton_data`
--

CREATE TABLE `tabla_depart_boton_data` (
  `id` int(11) NOT NULL,
  `boton` varchar(20) NOT NULL,
  `usuario` int(11) NOT NULL,
  `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_depart_boton_data`
--

INSERT INTO `tabla_depart_boton_data` (`id`, `boton`, `usuario`, `departamento`) VALUES
(1, '#btn_ver', 2, 3),
(2, '#btn_auto', 2, 3),
(3, '#btn_reg', 2, 2),
(4, '#btn_reg', 2, 4),
(5, '#btn_ver', 2, 4),
(6, '#btn_report', 2, 4),
(7, '#btn_reg', 2, 2),
(8, '#btn_ver', 2, 2),
(9, '#btn_report', 2, 2),
(13, '#btn_reg', 2, 2),
(14, '#btn_ver', 2, 2),
(15, '#btn_report', 2, 2),
(16, '#btn_reg', 2, 3),
(17, '#btn_ver', 2, 3),
(18, '#btn_report', 2, 3),
(19, '#btn_auto', 2, 3),
(23, '#btn_report', 2, 2),
(24, '#btn_ver', 2, 2),
(25, '#btn_report', 2, 4),
(26, '#btn_ver', 2, 4),
(27, '#btn_report', 2, 2),
(28, '#btn_ver', 2, 2),
(41, '#btn_ver', 2, 2),
(42, '#btn_ver', 2, 2),
(43, '#btn_reg', 2, 1),
(44, '#btn_ver', 2, 1),
(45, '#btn_report', 2, 1),
(46, '#btn_reg_nodo', 2, 5),
(48, '#btn_reg_tasa', 2, 5),
(49, '#btn_reg_plan', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_usuario_data`
--

CREATE TABLE `tabla_depart_usuario_data` (
  `id` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_depart_usuario_data`
--

INSERT INTO `tabla_depart_usuario_data` (`id`, `departamento`, `usuario`) VALUES
(48, 6, 2),
(56, 2, 2),
(57, 3, 2),
(63, 4, 2),
(69, 1, 2),
(72, 5, 2);

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
-- Estructura de tabla para la tabla `tabla_modulo_data`
--

CREATE TABLE `tabla_modulo_data` (
  `id` int(11) NOT NULL,
  `modulo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_modulo_data`
--

INSERT INTO `tabla_modulo_data` (`id`, `modulo`) VALUES
(1, 'Modulo Administrativo'),
(2, 'Modulo de Ventas'),
(3, 'Ajuste de Sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_modulo_usuario_data`
--

CREATE TABLE `tabla_modulo_usuario_data` (
  `id` int(11) NOT NULL,
  `modulo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_modulo_usuario_data`
--

INSERT INTO `tabla_modulo_usuario_data` (`id`, `modulo`, `usuario`) VALUES
(77, 2, 2),
(78, 3, 2),
(80, 1, 2);

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
('678ba2c4672c2', '2025-01-18 08:01:00', 'NE-003/2025', '678a73664e3a6', '678ba1bc74442', 2, 4, 30.0000, '2025-01-09', 50.0000, '', 20.0000, 0.0000),
('678ba8255e00b', '2025-01-18 09:01:57', 'NE-004/2025', '678a73664e3a6', '678b4869c639d', 1, 1, 75.0000, '2025-01-10', 54.0000, '1482', 75.9259, 4100.0000),
('67d967454d9ba', '2025-03-18 00:00:00', 'NE-001/2025', '678a73525cd80', '678b484b69895', 2, 4, 20.0000, '2025-03-18', 0.0000, 'Capital a Favor Abon', 10.0000, 0.0000),
('67d9674552fc4', '2025-03-18 00:00:00', 'NE-002/2025', '678a73664e3a6', '678b4869c639d', 2, 4, 40.0000, '2025-03-18', 0.0000, 'Capital a Favor Abon', 5.0000, 0.0000);

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
(2, 'jovanni Franco', 'jfranco', '$2y$10$HDqEXRehVxbDO5ppzOmtMONTGOGDHC./j/N7YV05SMBSX1Sup8X5.', '2024-10-19');

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
-- Indices de la tabla `tabla_departamento_data`
--
ALTER TABLE `tabla_departamento_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_accion_data`
--
ALTER TABLE `tabla_depart_accion_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_boton_data`
--
ALTER TABLE `tabla_depart_boton_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_usuario_data`
--
ALTER TABLE `tabla_depart_usuario_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_modulo_data`
--
ALTER TABLE `tabla_modulo_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_modulo_usuario_data`
--
ALTER TABLE `tabla_modulo_usuario_data`
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
-- AUTO_INCREMENT de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tabla_departamento_data`
--
ALTER TABLE `tabla_departamento_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_accion_data`
--
ALTER TABLE `tabla_depart_accion_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_boton_data`
--
ALTER TABLE `tabla_depart_boton_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_usuario_data`
--
ALTER TABLE `tabla_depart_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_data`
--
ALTER TABLE `tabla_modulo_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_usuario_data`
--
ALTER TABLE `tabla_modulo_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
