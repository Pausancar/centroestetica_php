-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2021 a las 13:03:07
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centroestetica_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `nombreClienteCita` varchar(65) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `horaDiaCita` datetime NOT NULL,
  `idTratamientoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `nombreClienteCita`, `horaDiaCita`, `idTratamientoFK`) VALUES
(1, 'Laura', '2021-05-20 12:30:00', 2),
(2, 'Jose', '2021-06-20 15:30:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombreEmpleado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidoEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `especialidadEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoJefeFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `apellidoEmpleado`, `especialidadEmpleado`, `idEmpleadoJefeFK`) VALUES
(1, 'Fernando', 'Gutierrez', 'Exfoliación', 1),
(2, 'Lorena', 'López', 'Cabello', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esteticistas`
--

CREATE TABLE `esteticistas` (
  `idEsteticista` int(11) NOT NULL,
  `salaTrabajoEsteticista` int(11) NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `esteticistas`
--

INSERT INTO `esteticistas` (`idEsteticista`, `salaTrabajoEsteticista`, `idEmpleadoFK`) VALUES
(1, 2, 1),
(2, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluqueros`
--

CREATE TABLE `peluqueros` (
  `idPeluquero` int(11) NOT NULL,
  `generoClientesPeluquero` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `peluqueros`
--

INSERT INTO `peluqueros` (`idPeluquero`, `generoClientesPeluquero`, `idEmpleadoFK`) VALUES
(1, 'Hombre', 1),
(2, 'Mujer', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `marcaProducto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idProveedorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `marcaProducto`, `idProveedorFK`) VALUES
(1, 'Loreal', 2),
(2, 'Kativa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `direccionProveedor` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `direccionProveedor`, `telefonoProveedor`) VALUES
(1, 'Calle Cereza Nº12', 665789532),
(2, 'Calle Manzana Nº23', 655683220);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `idTratamiento` int(11) NOT NULL,
  `nombreTratamiento` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `zonaTratamiento` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`idTratamiento`, `nombreTratamiento`, `zonaTratamiento`, `idEmpleadoFK`) VALUES
(1, 'Exfoliación mecánica', 'cuerpo', 1),
(2, 'Keratina', 'Cabello', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usos`
--

CREATE TABLE `usos` (
  `idUso` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `idTratamientoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usos`
--

INSERT INTO `usos` (`idUso`, `idProductoFK`, `idTratamientoFK`) VALUES
(1, 1, 2),
(2, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idTratamientoFK` (`idTratamientoFK`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idEmpleadoJefeFK` (`idEmpleadoJefeFK`);

--
-- Indices de la tabla `esteticistas`
--
ALTER TABLE `esteticistas`
  ADD PRIMARY KEY (`idEsteticista`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `peluqueros`
--
ALTER TABLE `peluqueros`
  ADD PRIMARY KEY (`idPeluquero`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idProveedorFK` (`idProveedorFK`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`idTratamiento`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `usos`
--
ALTER TABLE `usos`
  ADD PRIMARY KEY (`idUso`),
  ADD KEY `idTratamientoFK` (`idTratamientoFK`),
  ADD KEY `idProductoFK` (`idProductoFK`),
  ADD KEY `idTratamientoFK_2` (`idTratamientoFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `esteticistas`
--
ALTER TABLE `esteticistas`
  MODIFY `idEsteticista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `peluqueros`
--
ALTER TABLE `peluqueros`
  MODIFY `idPeluquero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usos`
--
ALTER TABLE `usos`
  MODIFY `idUso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idTratamientoFK`) REFERENCES `tratamientos` (`idTratamiento`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idEmpleadoJefeFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `esteticistas`
--
ALTER TABLE `esteticistas`
  ADD CONSTRAINT `esteticistas_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `peluqueros`
--
ALTER TABLE `peluqueros`
  ADD CONSTRAINT `peluqueros_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idProveedorFK`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `usos`
--
ALTER TABLE `usos`
  ADD CONSTRAINT `usos_ibfk_1` FOREIGN KEY (`idProductoFK`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `usos_ibfk_2` FOREIGN KEY (`idTratamientoFK`) REFERENCES `tratamientos` (`idTratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
