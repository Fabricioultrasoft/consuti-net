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
-- Create schema sislpa
--

CREATE DATABASE IF NOT EXISTS sislpa;
USE sislpa;

--
-- Definition of table `compromissos`
--

DROP TABLE IF EXISTS `compromissos`;
CREATE TABLE `compromissos` (
  `ID` int(11) NOT NULL,
  `ID_Contato` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Criar_Google_Agenda` tinyint(1) NOT NULL,
  `Data` date NOT NULL,
  `Hora_Início` time NOT NULL,
  `Hora_Fim` time NOT NULL,
  `Mais_Informacoes` text,
  `Preferencia_Contato` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Compromissos_ID` (`ID`),
  KEY `ID_Contato` (`ID_Contato`),
  KEY `ID_Usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compromissos`
--

/*!40000 ALTER TABLE `compromissos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compromissos` ENABLE KEYS */;


--
-- Definition of table `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE `contato` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Contato_Recomendante` int(11) NOT NULL,
  `ID_Status_Contato` int(11) NOT NULL,
  `ID_Tipo_Contato` int(11) NOT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Estado_Civil` varchar(50) DEFAULT NULL,
  `Data_Cadastro` datetime NOT NULL,
  `Filhos` int(11) DEFAULT NULL,
  `Idade` int(11) DEFAULT NULL,
  `Nome` varchar(100) NOT NULL,
  `Outras_Informacoes` text,
  `Profissao` varchar(100) DEFAULT NULL,
  `Sexo` char(1) NOT NULL,
  `Telefone_Alternativo_1` varchar(20) DEFAULT NULL,
  `Telefone_Alternativo_2` varchar(20) DEFAULT NULL,
  `Telefone_Principal` varchar(20) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Contato_ID` (`ID`),
  KEY `ID_Contato_Recomendante` (`ID_Contato_Recomendante`),
  KEY `ID_Tipo_Contato` (`ID_Tipo_Contato`),
  KEY `Status_Contato` (`ID_Status_Contato`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contato`
--

/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` (`ID`,`ID_Contato_Recomendante`,`ID_Status_Contato`,`ID_Tipo_Contato`,`Cidade`,`Email`,`Estado_Civil`,`Data_Cadastro`,`Filhos`,`Idade`,`Nome`,`Outras_Informacoes`,`Profissao`,`Sexo`,`Telefone_Alternativo_1`,`Telefone_Alternativo_2`,`Telefone_Principal`,`UF`) VALUES 
 (1,1,7,4,'','','','3000-01-01 16:36:00',0,0,'EU MESMO','','','M','','','',''),
 (2,1,7,4,'','','','3000-01-01 16:36:00',0,0,'NENHUM',NULL,'','M','','','','');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;


--
-- Definition of table `contato_sit_plan`
--

DROP TABLE IF EXISTS `contato_sit_plan`;
CREATE TABLE `contato_sit_plan` (
  `ID` int(11) NOT NULL,
  `ID_Contato` int(11) NOT NULL,
  `ID_SIT_PLAN` int(11) NOT NULL,
  `ID_Status_Pre_TA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Contato_SIT_PLAN_ID` (`ID`),
  KEY `ID_Contato` (`ID_Contato`),
  KEY `ID_SIT_PLAN` (`ID_SIT_PLAN`),
  KEY `ID_Status_Pre_TA` (`ID_Status_Pre_TA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contato_sit_plan`
--

/*!40000 ALTER TABLE `contato_sit_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_sit_plan` ENABLE KEYS */;


--
-- Definition of table `log_eventos`
--

DROP TABLE IF EXISTS `log_eventos`;
CREATE TABLE `log_eventos` (
  `ID` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Data_Hora_Evento` datetime NOT NULL,
  `Evento` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Log_Eventos_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_eventos`
--

/*!40000 ALTER TABLE `log_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_eventos` ENABLE KEYS */;


--
-- Definition of table `sit_plan`
--

DROP TABLE IF EXISTS `sit_plan`;
CREATE TABLE `sit_plan` (
  `ID` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Inicio` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_SIT_PLAN_ID` (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sit_plan`
--

/*!40000 ALTER TABLE `sit_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `sit_plan` ENABLE KEYS */;


--
-- Definition of table `status_contato`
--

DROP TABLE IF EXISTS `status_contato`;
CREATE TABLE `status_contato` (
  `ID` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Status_Contato_ID` (`ID`),
  UNIQUE KEY `UQ_Status_Contato_Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_contato`
--

/*!40000 ALTER TABLE `status_contato` DISABLE KEYS */;
INSERT INTO `status_contato` (`ID`,`Status`) VALUES 
 (1,'Agendou C'),
 (2,'Agendou OI'),
 (3,'Já é Cliente'),
 (4,'Ligação Futura'),
 (5,'Não Atendeu'),
 (6,'Não Quer'),
 (7,'Nenhum');
/*!40000 ALTER TABLE `status_contato` ENABLE KEYS */;


--
-- Definition of table `tipo_contato`
--

DROP TABLE IF EXISTS `tipo_contato`;
CREATE TABLE `tipo_contato` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Tipo_Contato_ID` (`ID`),
  UNIQUE KEY `UQ_Tipo_Contato_Tipo` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_contato`
--

/*!40000 ALTER TABLE `tipo_contato` DISABLE KEYS */;
INSERT INTO `tipo_contato` (`ID`,`Tipo`) VALUES 
 (3,'Bronze'),
 (4,'Nenhum'),
 (1,'Ouro'),
 (2,'Prata');
/*!40000 ALTER TABLE `tipo_contato` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AgendaGoogleEmail` varchar(100) DEFAULT NULL,
  `AgendaGoogleSenha` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Usuario_Email` (`Email`),
  UNIQUE KEY `UQ_Usuario_ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`ID`,`AgendaGoogleEmail`,`AgendaGoogleSenha`,`Email`,`Nome`,`Senha`,`Telefone`) VALUES 
 (1,'','','a@b.com','lili','1','(76) 545476475'),
 (2,'','','a@a.com','lili2','1','(11) 111222222');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `usuario_contato`
--

DROP TABLE IF EXISTS `usuario_contato`;
CREATE TABLE `usuario_contato` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Contato` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Data_Cadastro` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Usuario_Contato_ID` (`ID`),
  KEY `ID_Contato` (`ID_Contato`),
  KEY `ID_Usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario_contato`
--

/*!40000 ALTER TABLE `usuario_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_contato` ENABLE KEYS */;


--
-- Definition of table `usuarios_autorizados`
--

DROP TABLE IF EXISTS `usuarios_autorizados`;
CREATE TABLE `usuarios_autorizados` (
  `Email` varchar(100) NOT NULL,
  `Admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Email`),
  UNIQUE KEY `UQ_Usuarios_Autorizados_Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios_autorizados`
--

/*!40000 ALTER TABLE `usuarios_autorizados` DISABLE KEYS */;
INSERT INTO `usuarios_autorizados` (`Email`,`Admin`) VALUES 
 ('a@a.com',0),
 ('a@b.com',1),
 ('cristian@consuti.net',1);
/*!40000 ALTER TABLE `usuarios_autorizados` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
