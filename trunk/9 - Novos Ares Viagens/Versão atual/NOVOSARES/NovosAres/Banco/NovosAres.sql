-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.45-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema novosares
--

CREATE DATABASE IF NOT EXISTS novosares;
USE novosares;

--
-- Definition of table `antesdeviajar`
--

DROP TABLE IF EXISTS `antesdeviajar`;
CREATE TABLE `antesdeviajar` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `CaminhoArquivo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `antesdeviajar`
--

/*!40000 ALTER TABLE `antesdeviajar` DISABLE KEYS */;
/*!40000 ALTER TABLE `antesdeviajar` ENABLE KEYS */;


--
-- Definition of table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `IdCategoriaPost` int(8) NOT NULL,
  `TituloPost` varchar(100) NOT NULL,
  `TextoPost` varchar(10000) NOT NULL,
  `LinkPagDestinos` varchar(300) DEFAULT NULL,
  `LinkGoogleMaps` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Categoria_Post` (`IdCategoriaPost`),
  CONSTRAINT `Categoria_Post` FOREIGN KEY (`IdCategoriaPost`) REFERENCES `categoriapost` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;


--
-- Definition of table `categoriapost`
--

DROP TABLE IF EXISTS `categoriapost`;
CREATE TABLE `categoriapost` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoriapost`
--

/*!40000 ALTER TABLE `categoriapost` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriapost` ENABLE KEYS */;


--
-- Definition of table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cidade`
--

/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;


--
-- Definition of table `continente`
--

DROP TABLE IF EXISTS `continente`;
CREATE TABLE `continente` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `continente`
--

/*!40000 ALTER TABLE `continente` DISABLE KEYS */;
/*!40000 ALTER TABLE `continente` ENABLE KEYS */;


--
-- Definition of table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
CREATE TABLE `destinos` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `IdContinente` int(8) NOT NULL,
  `IdPais` int(8) NOT NULL,
  `IdCidade` int(8) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Descricao` varchar(1000) NOT NULL,
  `LinkPostBlog` varchar(300) DEFAULT NULL,
  `LinkGoogleMaps` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Continente_Destino` (`IdContinente`),
  KEY `Pais_Destino` (`IdPais`),
  KEY `Cidade_Destino` (`IdCidade`),
  CONSTRAINT `Continente_Destino` FOREIGN KEY (`IdContinente`) REFERENCES `continente` (`ID`),
  CONSTRAINT `Pais_Destino` FOREIGN KEY (`IdPais`) REFERENCES `pais` (`ID`),
  CONSTRAINT `Cidade_Destino` FOREIGN KEY (`IdCidade`) REFERENCES `cidade` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `destinos`
--

/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;


--
-- Definition of table `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pais`
--

/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;


--
-- Definition of table `sejabemvindo`
--

DROP TABLE IF EXISTS `sejabemvindo`;
CREATE TABLE `sejabemvindo` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `Descricao` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sejabemvindo`
--

/*!40000 ALTER TABLE `sejabemvindo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sejabemvindo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
