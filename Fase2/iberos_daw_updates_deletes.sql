-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2021 a las 12:02:23
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iberos_daw`
--
CREATE DATABASE IF NOT EXISTS `iberos_daw` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `iberos_daw`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

DROP TABLE IF EXISTS `armas`;
CREATE TABLE IF NOT EXISTS `armas` (
  `cod_arma` int(11) NOT NULL,
  `id_guerrero` int(11) DEFAULT NULL,
  `est_conservacion` enum('Perfecto','Buen estado','Regular','Mal estado') COLLATE utf8_spanish_ci NOT NULL,
  `material` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_arma`),
  KEY `id_guerrero` (`id_guerrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `armas`
--

INSERT INTO `armas` VALUES(10, 1, 'Buen estado', 'Plata', 'Espada curva');
INSERT INTO `armas` VALUES(20, 2, 'Regular', 'Hierro', 'Jabalina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asentamiento`
--

DROP TABLE IF EXISTS `asentamiento`;
CREATE TABLE IF NOT EXISTS `asentamiento` (
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `num_hab` int(11) NOT NULL,
  `localizacion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asentamiento`
--

INSERT INTO `asentamiento` VALUES('Augusta Emerita', 13000, 'Lusitania');
INSERT INTO `asentamiento` VALUES('Segóbriga', 8000, 'Celtiberia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caballeria`
--

DROP TABLE IF EXISTS `caballeria`;
CREATE TABLE IF NOT EXISTS `caballeria` (
  `codigo_org_militar` int(11) NOT NULL,
  `num_caballos` int(11) NOT NULL,
  PRIMARY KEY (`codigo_org_militar`),
  KEY `codigo_org_militar` (`codigo_org_militar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `caballeria`
--

INSERT INTO `caballeria` VALUES(111, 25);
INSERT INTO `caballeria` VALUES(222, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dioses`
--

DROP TABLE IF EXISTS `dioses`;
CREATE TABLE IF NOT EXISTS `dioses` (
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dioses`
--

INSERT INTO `dioses` VALUES('Camdamuis', 'Dios del Cielo y de las Tormentas');
INSERT INTO `dioses` VALUES('Cosus', 'Dios de la Guerra. Asimilado con Marte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dioses_guerreros`
--

DROP TABLE IF EXISTS `dioses_guerreros`;
CREATE TABLE IF NOT EXISTS `dioses_guerreros` (
  `nombre_dios` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `id_guerrero` int(11) NOT NULL,
  PRIMARY KEY (`nombre_dios`,`id_guerrero`),
  KEY `nombre_dios` (`nombre_dios`),
  KEY `id_guerrero` (`id_guerrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dioses_guerreros`
--

INSERT INTO `dioses_guerreros` VALUES('Camdamuis', 2);
INSERT INTO `dioses_guerreros` VALUES('Cosus', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guerreros`
--

DROP TABLE IF EXISTS `guerreros`;
CREATE TABLE IF NOT EXISTS `guerreros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_asentamiento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido2` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sexo` enum('Hombre','Mujer') COLLATE utf8_spanish_ci NOT NULL,
  `cod_org_militar` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nombre_asentamiento` (`nombre_asentamiento`),
  KEY `cod_org_militar` (`cod_org_militar`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `guerreros`
--

INSERT INTO `guerreros` VALUES(1, 'Augusta Emerita', 'Caciro', 'Sekaiza', NULL, 'Hombre', 111);
INSERT INTO `guerreros` VALUES(2, 'Segóbriga', 'Bodilkas', 'Sergeton', NULL, 'Hombre', 222);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infanteria`
--

DROP TABLE IF EXISTS `infanteria`;
CREATE TABLE IF NOT EXISTS `infanteria` (
  `codigo_org_militar` int(11) NOT NULL,
  `tipo` enum('Arquería','Tropas terrestres') COLLATE utf8_spanish_ci NOT NULL,
  `num_soldados` int(11) NOT NULL,
  PRIMARY KEY (`codigo_org_militar`),
  KEY `codigo_org_militar` (`codigo_org_militar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `infanteria`
--

INSERT INTO `infanteria` VALUES(111, 'Tropas terrestres', 250);
INSERT INTO `infanteria` VALUES(222, 'Arquería', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lider`
--

DROP TABLE IF EXISTS `lider`;
CREATE TABLE IF NOT EXISTS `lider` (
  `id_lider` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `años_liderazgo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `lider`
--

INSERT INTO `lider` VALUES(1, 'Olíndico', NULL, 10);
INSERT INTO `lider` VALUES(2, 'Cauceno', 'Conistorgis', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `org_militar`
--

DROP TABLE IF EXISTS `org_militar`;
CREATE TABLE IF NOT EXISTS `org_militar` (
  `codigo` int(11) NOT NULL,
  `id_lider` int(11) DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `color_estandarte` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `id_lider` (`id_lider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `org_militar`
--

INSERT INTO `org_militar` VALUES(111, 1, 'Tropa de Olíndico', 'Verde');
INSERT INTO `org_militar` VALUES(222, 2, 'Ejército de Cauceno', 'Negro y blanco');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armas`
--
ALTER TABLE `armas`
  ADD CONSTRAINT `armas_ibfk_1` FOREIGN KEY (`id_guerrero`) REFERENCES `guerreros` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `caballeria`
--
ALTER TABLE `caballeria`
  ADD CONSTRAINT `caballeria_ibfk_1` FOREIGN KEY (`codigo_org_militar`) REFERENCES `org_militar` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dioses_guerreros`
--
ALTER TABLE `dioses_guerreros`
  ADD CONSTRAINT `dioses_guerreros_ibfk_1` FOREIGN KEY (`nombre_dios`) REFERENCES `dioses` (`nombre`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `dioses_guerreros_ibfk_2` FOREIGN KEY (`id_guerrero`) REFERENCES `guerreros` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `guerreros`
--
ALTER TABLE `guerreros`
  ADD CONSTRAINT `guerreros_ibfk_1` FOREIGN KEY (`nombre_asentamiento`) REFERENCES `asentamiento` (`nombre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `infanteria`
--
ALTER TABLE `infanteria`
  ADD CONSTRAINT `infanteria_ibfk_1` FOREIGN KEY (`codigo_org_militar`) REFERENCES `org_militar` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `org_militar`
--
ALTER TABLE `org_militar`
  ADD CONSTRAINT `org_militar_ibfk_1` FOREIGN KEY (`id_lider`) REFERENCES `lider` (`id_lider`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Updates
--
UPDATE `dioses` SET `nombre`='Baraecus',`descripcion`='Dios relacionado con las Aguas' WHERE `nombre`='Camdamuis';
UPDATE `guerreros` SET `nombre`='Amílcar',`apellido1`='Barca' WHERE `id`=1;

--
-- Deletes
--
DELETE FROM `armas` WHERE `cod_arma`=20;
DELETE FROM `org_militar` WHERE `codigo`=222;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
