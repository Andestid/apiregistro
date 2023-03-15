-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2023 a las 14:04:58
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `nocandidato` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `genero` char(1) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `partido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`nocandidato`, `nombre`, `apellido`, `tipo`, `genero`, `localidad`, `partido`) VALUES
(2001, 'testca001', '1testca', 'CC', 'F', 'barranquilla', 'MIRA'),
(2002, 'testca002', '2testca', 'CC', 'F', 'bogota', 'CORAZON'),
(2003, 'testca003', '3testca', 'CC', 'F', 'medellin', 'PARTIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votante`
--

CREATE TABLE `votante` (
  `novotante` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `genero` char(1) NOT NULL,
  `localidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votante`
--

INSERT INTO `votante` (`novotante`, `nombre`, `apellido`, `tipo`, `genero`, `localidad`) VALUES
(1001, 'test001', '3test', 'CC', 'M', 'bogota'),
(1002, 'test002', '3test', 'CC', 'F', 'barranquilla'),
(1003, 'test003', '3test', 'CC', 'F', 'medellin'),
(1004, 'test004', '4test', 'CC', 'M', 'barranquilla'),
(1005, 'test005', '5test', 'CC', 'F', 'barranquilla'),
(1006, 'test006', '6test', 'CC', 'F', 'bogota'),
(1007, 'test007', '7test', 'CC', 'M', 'medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `Idv` int(11) NOT NULL,
  `nocandidato` int(11) DEFAULT NULL,
  `novotante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`Idv`, `nocandidato`, `novotante`) VALUES
(7, 2001, 1002),
(8, 2001, 1004),
(9, 2001, 1005),
(10, 2002, 1006),
(11, 2002, 1001),
(12, 2003, 1007),
(13, 2003, 1003);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`nocandidato`);

--
-- Indices de la tabla `votante`
--
ALTER TABLE `votante`
  ADD PRIMARY KEY (`novotante`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`Idv`),
  ADD KEY `fk_votos_candidato` (`nocandidato`),
  ADD KEY `fk_votos_votante` (`novotante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `Idv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `fk_votos_candidato` FOREIGN KEY (`nocandidato`) REFERENCES `candidato` (`nocandidato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_votos_votante` FOREIGN KEY (`novotante`) REFERENCES `votante` (`novotante`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
