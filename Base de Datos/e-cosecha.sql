-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2024 a las 15:59:58
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
-- Base de datos: `e-cosecha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_cosechero`
--

CREATE TABLE `caja_cosechero` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `cosechero_id` int(11) DEFAULT NULL,
  `tipo_caja_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo`
--

CREATE TABLE `campo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_de_costos`
--

CREATE TABLE `centro_de_costos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `detalle` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_de_barras`
--

CREATE TABLE `codigo_de_barras` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `cantidad_impresos` int(11) DEFAULT NULL,
  `cantidad_entregados` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cosecha`
--

CREATE TABLE `cosecha` (
  `id` int(11) NOT NULL,
  `año` year(4) NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `detalle` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cosechero`
--

CREATE TABLE `cosechero` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `cuadrilla_id` int(11) DEFAULT NULL,
  `codigo_de_barras_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadrilla`
--

CREATE TABLE `cuadrilla` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `jefe_de_cuadrilla_id` int(11) DEFAULT NULL,
  `control_calidad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falta`
--

CREATE TABLE `falta` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `cosechero_id` int(11) DEFAULT NULL,
  `tipo_de_falta_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huerto`
--

CREATE TABLE `huerto` (
  `id` int(11) NOT NULL,
  `campo_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `año` year(4) NOT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeciones`
--

CREATE TABLE `objeciones` (
  `id` int(11) NOT NULL,
  `cosechero_id` int(11) DEFAULT NULL,
  `tarja_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `cuenta_corriente` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_de_usuario`
--

CREATE TABLE `rol_de_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarja`
--

CREATE TABLE `tarja` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `carro_id` int(11) NOT NULL,
  `variedad_huerto_id` int(11) NOT NULL,
  `trabajador_id` int(11) DEFAULT NULL,
  `tipo_caja_id` int(11) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `total_fisico` int(11) NOT NULL,
  `total_codigos` int(11) NOT NULL,
  `codigos_registrados` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_caja`
--

CREATE TABLE `tipo_caja` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `capacidad_kg` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_falta`
--

CREATE TABLE `tipo_de_falta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `gravedad` enum('leve','moderada','grave') DEFAULT NULL,
  `detalles` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trabajo`
--

CREATE TABLE `tipo_trabajo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id` int(11) NOT NULL,
  `cosecha_id` int(11) DEFAULT NULL,
  `tipo_trabajo_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `rol_de_usuario_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variedad`
--

CREATE TABLE `variedad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variedad_huerto`
--

CREATE TABLE `variedad_huerto` (
  `id` int(11) NOT NULL,
  `huerto_id` int(11) DEFAULT NULL,
  `variedad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja_cosechero`
--
ALTER TABLE `caja_cosechero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosecha_id` (`cosecha_id`),
  ADD KEY `cosechero_id` (`cosechero_id`),
  ADD KEY `tipo_caja_id` (`tipo_caja_id`);

--
-- Indices de la tabla `campo`
--
ALTER TABLE `campo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `centro_de_costos`
--
ALTER TABLE `centro_de_costos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo_de_barras`
--
ALTER TABLE `codigo_de_barras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosecha_id` (`cosecha_id`);

--
-- Indices de la tabla `cosecha`
--
ALTER TABLE `cosecha`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cosechero`
--
ALTER TABLE `cosechero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `cosechero_ibfk_2` (`cosecha_id`),
  ADD KEY `cosechero_ibfk_4` (`codigo_de_barras_id`),
  ADD KEY `cosechero_ibfk_3` (`cuadrilla_id`);

--
-- Indices de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosecha_id` (`cosecha_id`),
  ADD KEY `jefe_de_cuadrilla_id` (`jefe_de_cuadrilla_id`),
  ADD KEY `control_calidad_id` (`control_calidad_id`);

--
-- Indices de la tabla `falta`
--
ALTER TABLE `falta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosecha_id` (`cosecha_id`),
  ADD KEY `cosechero_id` (`cosechero_id`),
  ADD KEY `tipo_de_falta_id` (`tipo_de_falta_id`);

--
-- Indices de la tabla `huerto`
--
ALTER TABLE `huerto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campo_id` (`campo_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `objeciones`
--
ALTER TABLE `objeciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosechero_id` (`cosechero_id`),
  ADD KEY `tarja_id` (`tarja_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_de_usuario`
--
ALTER TABLE `rol_de_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarja`
--
ALTER TABLE `tarja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosecha_id` (`cosecha_id`),
  ADD KEY `trabajador_id` (`trabajador_id`),
  ADD KEY `carro_id` (`carro_id`),
  ADD KEY `variedad_huerto_id` (`variedad_huerto_id`),
  ADD KEY `tipo_caja_id` (`tipo_caja_id`);

--
-- Indices de la tabla `tipo_caja`
--
ALTER TABLE `tipo_caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_de_falta`
--
ALTER TABLE `tipo_de_falta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `tipo_trabajo_id` (`tipo_trabajo_id`),
  ADD KEY `cosecha_id` (`cosecha_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol_de_usuario_id` (`rol_de_usuario_id`);

--
-- Indices de la tabla `variedad`
--
ALTER TABLE `variedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `variedad_huerto`
--
ALTER TABLE `variedad_huerto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `huerto_id` (`huerto_id`),
  ADD KEY `variedad_id` (`variedad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja_cosechero`
--
ALTER TABLE `caja_cosechero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `campo`
--
ALTER TABLE `campo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centro_de_costos`
--
ALTER TABLE `centro_de_costos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codigo_de_barras`
--
ALTER TABLE `codigo_de_barras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cosecha`
--
ALTER TABLE `cosecha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cosechero`
--
ALTER TABLE `cosechero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `falta`
--
ALTER TABLE `falta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `huerto`
--
ALTER TABLE `huerto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objeciones`
--
ALTER TABLE `objeciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol_de_usuario`
--
ALTER TABLE `rol_de_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarja`
--
ALTER TABLE `tarja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_caja`
--
ALTER TABLE `tipo_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_falta`
--
ALTER TABLE `tipo_de_falta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `variedad`
--
ALTER TABLE `variedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `variedad_huerto`
--
ALTER TABLE `variedad_huerto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja_cosechero`
--
ALTER TABLE `caja_cosechero`
  ADD CONSTRAINT `caja_cosechero_ibfk_1` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`),
  ADD CONSTRAINT `caja_cosechero_ibfk_2` FOREIGN KEY (`cosechero_id`) REFERENCES `cosechero` (`id`),
  ADD CONSTRAINT `caja_cosechero_ibfk_3` FOREIGN KEY (`tipo_caja_id`) REFERENCES `tipo_caja` (`id`);

--
-- Filtros para la tabla `codigo_de_barras`
--
ALTER TABLE `codigo_de_barras`
  ADD CONSTRAINT `codigo_de_barras_ibfk_1` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`);

--
-- Filtros para la tabla `cosechero`
--
ALTER TABLE `cosechero`
  ADD CONSTRAINT `cosechero_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `cosechero_ibfk_2` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`),
  ADD CONSTRAINT `cosechero_ibfk_3` FOREIGN KEY (`cuadrilla_id`) REFERENCES `cuadrilla` (`id`),
  ADD CONSTRAINT `cosechero_ibfk_4` FOREIGN KEY (`codigo_de_barras_id`) REFERENCES `codigo_de_barras` (`id`);

--
-- Filtros para la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD CONSTRAINT `cuadrilla_ibfk_1` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`),
  ADD CONSTRAINT `cuadrilla_ibfk_2` FOREIGN KEY (`jefe_de_cuadrilla_id`) REFERENCES `trabajador` (`id`),
  ADD CONSTRAINT `cuadrilla_ibfk_3` FOREIGN KEY (`control_calidad_id`) REFERENCES `trabajador` (`id`);

--
-- Filtros para la tabla `falta`
--
ALTER TABLE `falta`
  ADD CONSTRAINT `falta_ibfk_1` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`),
  ADD CONSTRAINT `falta_ibfk_2` FOREIGN KEY (`cosechero_id`) REFERENCES `cosechero` (`id`),
  ADD CONSTRAINT `falta_ibfk_3` FOREIGN KEY (`tipo_de_falta_id`) REFERENCES `tipo_de_falta` (`id`);

--
-- Filtros para la tabla `huerto`
--
ALTER TABLE `huerto`
  ADD CONSTRAINT `huerto_ibfk_1` FOREIGN KEY (`campo_id`) REFERENCES `campo` (`id`);

--
-- Filtros para la tabla `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `objeciones`
--
ALTER TABLE `objeciones`
  ADD CONSTRAINT `objeciones_ibfk_1` FOREIGN KEY (`cosechero_id`) REFERENCES `cosechero` (`id`),
  ADD CONSTRAINT `objeciones_ibfk_2` FOREIGN KEY (`tarja_id`) REFERENCES `tarja` (`id`);

--
-- Filtros para la tabla `tarja`
--
ALTER TABLE `tarja`
  ADD CONSTRAINT `tarja_ibfk_1` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`),
  ADD CONSTRAINT `tarja_ibfk_2` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`),
  ADD CONSTRAINT `tarja_ibfk_3` FOREIGN KEY (`carro_id`) REFERENCES `carro` (`id`),
  ADD CONSTRAINT `tarja_ibfk_4` FOREIGN KEY (`variedad_huerto_id`) REFERENCES `variedad_huerto` (`id`),
  ADD CONSTRAINT `tarja_ibfk_5` FOREIGN KEY (`tipo_caja_id`) REFERENCES `tipo_caja` (`id`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `trabajador_ibfk_3` FOREIGN KEY (`tipo_trabajo_id`) REFERENCES `tipo_trabajo` (`id`),
  ADD CONSTRAINT `trabajador_ibfk_5` FOREIGN KEY (`cosecha_id`) REFERENCES `cosecha` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_de_usuario_id`) REFERENCES `rol_de_usuario` (`id`);

--
-- Filtros para la tabla `variedad_huerto`
--
ALTER TABLE `variedad_huerto`
  ADD CONSTRAINT `variedad_huerto_ibfk_2` FOREIGN KEY (`huerto_id`) REFERENCES `huerto` (`id`),
  ADD CONSTRAINT `variedad_huerto_ibfk_3` FOREIGN KEY (`variedad_id`) REFERENCES `variedad` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
