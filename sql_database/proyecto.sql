-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db:3306
-- Tiempo de generación: 23-01-2024 a las 16:42:09
-- Versión del servidor: 5.7.44
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdduniversitat`
--
CREATE DATABASE IF NOT EXISTS `bbdduniversitat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bbdduniversitat`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignatura`
--

CREATE TABLE `assignatura` (
  `codi` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `assignatura`
--

INSERT INTO `assignatura` (`codi`, `nom`) VALUES
(1111, 'Catalan'),
(2222, 'Castellano'),
(3333, 'Matematicas'),
(4444, 'Fisica y Quimica'),
(5555, 'Tecnologia'),
(6666, 'Sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta`
--

CREATE TABLE `bicicleta` (
  `ID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bicicleta`
--

INSERT INTO `bicicleta` (`ID`) VALUES
(28879764),
(39349986),
(42794728),
(49338572),
(58669272),
(74328742),
(74577967),
(78497398),
(84665967),
(94355858);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classe`
--

CREATE TABLE `classe` (
  `ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `classe`
--

INSERT INTO `classe` (`ID`) VALUES
('1rM'),
('1rT'),
('2nM'),
('2nT'),
('3rM'),
('3rT'),
('4tM'),
('4tT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiant`
--

CREATE TABLE `estudiant` (
  `DNI` varchar(9) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL,
  `direccio` varchar(200) NOT NULL,
  `telefon` int(12) NOT NULL,
  `data_neixament` date NOT NULL,
  `num_expedient` int(11) NOT NULL,
  `ID_bicicleta` int(9) NOT NULL,
  `inici` date NOT NULL,
  `final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiant`
--

INSERT INTO `estudiant` (`DNI`, `nom`, `cognom`, `direccio`, `telefon`, `data_neixament`, `num_expedient`, `ID_bicicleta`, `inici`, `final`) VALUES
('10987654H', 'Carmen', 'Ruiz', 'Calle Z, Pueblo I', 123456789, '1993-09-05', 8, 78497398, '2022-10-20', '2023-04-20'),
('12345678A', 'Juan', 'Perez', 'Calle A, Ciudad B', 123456789, '1990-05-15', 1, 28879764, '2023-01-01', '2023-06-30'),
('21098765I', 'Javier', 'Gomez', 'Av. Norte, Ciudad J', 134567890, '1975-01-30', 9, 84665967, '2023-04-01', '2023-10-31'),
('23456789C', 'Carlos', 'Sanchez', 'Calle XYZ, Ciudad D', 145678901, '1978-12-10', 3, 42794728, '2023-03-01', '2023-09-30'),
('32109876J', 'Isabel', 'Diaz', 'Calle X, Pueblo K', 145678901, '1987-06-12', 10, 94355858, '2022-11-05', '2023-05-05'),
('34567890E', 'Alejandro', 'Fernandez', 'Av. Central, Ciudad F', 134567890, '1982-07-07', 5, 58669272, '2023-06-15', '2023-12-31'),
('54321098F', 'Ana', 'Martinez', 'Calle 456, Pueblo G', 189012345, '1998-11-20', 6, 74328742, '2022-12-01', '2023-05-31'),
('76543210G', 'Pedro', 'Lopez', 'Av. Secundaria, Ciudad H', 187654321, '1980-04-18', 7, 74577967, '2023-02-15', '2023-08-15'),
('87654321D', 'Laura', 'Gonzalez', 'Calle 123, Pueblo E', 167890123, '1995-02-28', 4, 49338572, '2022-09-10', '2023-03-31'),
('98765432B', 'Maria', 'Rodriguez', 'Av. Principal, Pueblo C', 187654321, '1985-08-22', 2, 39349986, '2022-11-15', '2023-04-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imparteix`
--

CREATE TABLE `imparteix` (
  `DNI_professor` varchar(9) NOT NULL,
  `CODI_assignatura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imparteix`
--

INSERT INTO `imparteix` (`DNI_professor`, `CODI_assignatura`) VALUES
('11111111A', 1111),
('22222222B', 6666),
('33333333C', 5555),
('44444444D', 3333),
('55555555E', 2222),
('66666666F', 4444),
('77777777G', 1111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `DNI_estudiant` varchar(9) NOT NULL,
  `CODI_assignatura` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`DNI_estudiant`, `CODI_assignatura`, `data`) VALUES
('10987654H', 5555, '2023-07-12'),
('12345678A', 1111, '2023-07-12'),
('21098765I', 2222, '2023-07-12'),
('23456789C', 6666, '2023-07-12'),
('32109876J', 4444, '2023-07-12'),
('34567890E', 5555, '2023-07-12'),
('54321098F', 3333, '2023-07-12'),
('76543210G', 6666, '2023-07-12'),
('87654321D', 1111, '2023-07-12'),
('98765432B', 4444, '2023-07-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `president`
--

CREATE TABLE `president` (
  `DNI_estudiant` varchar(9) NOT NULL,
  `DNI_president` varchar(9) NOT NULL,
  `ID_classe` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `president`
--

INSERT INTO `president` (`DNI_estudiant`, `DNI_president`, `ID_classe`) VALUES
('54321098F', '54321098F', '2nM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professor`
--

CREATE TABLE `professor` (
  `DNI` varchar(9) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL,
  `direccio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `professor`
--

INSERT INTO `professor` (`DNI`, `nom`, `cognom`, `direccio`) VALUES
('11111111A', 'Profesor1', 'Apellido1', 'Calle A, Barcelona'),
('22222222B', 'Profesor2', 'Apellido2', 'Av. Principal, Barcelona'),
('33333333C', 'Profesor3', 'Apellido3', 'Calle XYZ, Barcelona'),
('44444444D', 'Profesor4', 'Apellido4', 'Calle 123, Barcelona'),
('55555555E', 'Profesor5', 'Apellido5', 'Av. Central, Barcelona'),
('66666666F', 'Profesora6', 'Apellido6', 'Calle 456, Barcelona'),
('77777777G', 'Profesor7', 'Apellido7', 'Av. Secundaria, Barcelona');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `assignatura`
--
ALTER TABLE `assignatura`
  ADD PRIMARY KEY (`codi`);

--
-- Indices de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `estudiant`
--
ALTER TABLE `estudiant`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `ID_bicicleta` (`ID_bicicleta`);

--
-- Indices de la tabla `imparteix`
--
ALTER TABLE `imparteix`
  ADD KEY `DNI_professor` (`DNI_professor`,`CODI_assignatura`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD KEY `DNI_estudiant` (`DNI_estudiant`,`CODI_assignatura`),
  ADD KEY `CODI_assignatura` (`CODI_assignatura`);

--
-- Indices de la tabla `president`
--
ALTER TABLE `president`
  ADD KEY `DNI_estudiant` (`DNI_estudiant`,`DNI_president`,`ID_classe`),
  ADD KEY `ID_classe` (`ID_classe`),
  ADD KEY `DNI_president` (`DNI_president`);

--
-- Indices de la tabla `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`DNI`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiant`
--
ALTER TABLE `estudiant`
  ADD CONSTRAINT `estudiant_ibfk_1` FOREIGN KEY (`ID_bicicleta`) REFERENCES `bicicleta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imparteix`
--
ALTER TABLE `imparteix`
  ADD CONSTRAINT `imparteix_ibfk_1` FOREIGN KEY (`DNI_professor`) REFERENCES `professor` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`DNI_estudiant`) REFERENCES `estudiant` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`CODI_assignatura`) REFERENCES `assignatura` (`codi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `president`
--
ALTER TABLE `president`
  ADD CONSTRAINT `president_ibfk_1` FOREIGN KEY (`DNI_estudiant`) REFERENCES `estudiant` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `president_ibfk_2` FOREIGN KEY (`ID_classe`) REFERENCES `classe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `president_ibfk_3` FOREIGN KEY (`DNI_president`) REFERENCES `estudiant` (`DNI`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

GRANT ALL PRIVILEGES ON *.* TO 'sergibernat'@'db' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
