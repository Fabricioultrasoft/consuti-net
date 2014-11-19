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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contato`
--

/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` (`ID`,`ID_Contato_Recomendante`,`ID_Status_Contato`,`ID_Tipo_Contato`,`Cidade`,`Email`,`Estado_Civil`,`Data_Cadastro`,`Filhos`,`Idade`,`Nome`,`Outras_Informacoes`,`Profissao`,`Sexo`,`Telefone_Alternativo_1`,`Telefone_Alternativo_2`,`Telefone_Principal`,`UF`) VALUES 
 (1,1,1,1,'','','','2014-10-26 16:36:00',0,0,'EU MESMO','','','M','','','',''),
 (2,1,1,1,'','','','2014-10-26 16:37:53',0,0,'AAAprimeiro contato','','','F','','','98111276229',''),
 (3,1,1,1,'','','','2014-10-26 16:38:39',0,0,'primeiBBBo contato','','','M','','','12228766633',''),
 (4,1,1,1,'','','','2014-10-29 20:47:38',0,0,'novo contato da lili','','','M','','','3197653922',''),
 (5,4,1,1,'','','','2014-10-29 20:48:53',0,0,'teste 2','','','M','','','',''),
 (6,1,1,1,'','','','2014-10-29 20:51:39',0,0,'eu denovo','','','M','','','',''),
 (7,1,1,1,'','','','2014-10-29 20:54:58',0,0,'lili 222222','','','M','','','',''),
 (8,1,1,1,'','','','2014-10-29 20:55:54',0,0,'aaaaaa','','','M','','','',''),
 (9,1,1,1,'','','','2014-10-29 21:17:57',0,0,'XXXXXXXXXXXXXX','','','M','','','',''),
 (10,2,1,1,'','','','2014-10-29 21:18:17',0,0,'DEEEEEEEEEEEEEE','','','M','','','',''),
 (11,9,1,1,'','','','2014-10-30 19:03:24',0,0,'GOSTOSSSSSSS','','','M','','','',''),
 (12,9,1,1,'','','','2014-10-30 19:04:45',0,0,'ERRO BANCO','','','M','','','',''),
 (14,13,1,1,'','','<Selecione>','2014-10-30 19:13:53',0,0,'e3e3e3e3e3','','','M','','','3197653922',''),
 (15,7,1,1,'','','<Selecione>','2014-10-30 19:25:25',0,0,'aaaaaaaaaaaaaaaaa','','','M','3197655555','3832433922','3197653922',''),
 (16,7,1,1,'','','<Selecione>','2014-10-30 19:27:32',0,0,'2121212121','','','M','34434343434','56565656565','12121212121',''),
 (17,1,1,1,'','','<Selecione>','2014-10-30 19:36:22',0,0,'ersarasdasdasDSAD','','','M','42423432534','42677678787','23432423432',''),
 (18,1,1,1,'','','<Selecione>','2014-10-30 19:36:53',0,0,'ersarasdasdasDSAD','','','M','42423432534','42677678787','23432423432',''),
 (20,1,1,0,NULL,NULL,NULL,'2014-11-02 13:09:54',0,0,'111111111111111111111','1111111111111111111',NULL,'M',NULL,NULL,'11111111111',NULL),
 (21,1,1,0,NULL,NULL,NULL,'2014-11-02 13:10:06',0,0,'2222222222222222222222','2222222222222222222222',NULL,'F',NULL,NULL,'22222222222',NULL),
 (22,1,1,0,NULL,NULL,NULL,'2014-11-02 13:10:10',0,0,'333333333333','33333333333333333333333333',NULL,'M',NULL,NULL,'33333333333',NULL),
 (23,5,2,1,'','','','2014-11-02 13:21:45',0,0,'1111111111111111','11111111111111111111','','M','','','11111111111',''),
 (24,5,7,1,'','','','2014-11-02 13:21:45',0,0,'222222222222','2222222222222222222222222','','F','','','22222222222',''),
 (25,5,1,1,'','','','2014-11-02 13:21:45',0,0,'33333333333333','33333333333333333333333333333','','M','','','33333333333',''),
 (26,12,1,1,'','','','2014-11-02 13:26:04',0,0,'55555','5555555','','F','','','55555555555',''),
 (27,15,1,1,'','','','2014-11-02 15:31:49',0,0,'11111111111111111111111','111111111111111111111','','M','','','11111111111',''),
 (28,15,1,1,'','','','2014-11-02 15:31:49',0,0,'222222222222222222222','22222222222222222222222','','F','','','22222222222',''),
 (30,15,1,1,'','','','2014-11-02 15:34:43',0,0,'11111111111111111111111','111111111111111111111','','M','','','11111111111',''),
 (31,15,1,1,'','','','2014-11-02 15:34:43',0,0,'222222222222222222222','22222222222222222222222','','F','','','22222222222',''),
 (32,15,7,1,'','','','2014-11-02 15:34:43',0,0,'00000000000','0000000000000000000','','M','','','00000000000',''),
 (33,1,3,1,'','','','2014-11-03 12:19:26',0,0,'teste aaa','','','M','','','',''),
 (34,32,1,1,'','','','2014-11-03 12:20:55',0,0,'aaaa','111111111111','','F','','','11111111111',''),
 (35,32,1,1,'','','','2014-11-03 12:20:55',0,0,'bbbbbb','22222222222','','F','','','22222222222',''),
 (36,32,1,1,'','','','2014-11-03 12:20:55',0,0,'teste ultimo','9999tlfjaslk fskadhfjakdhfjksdf ds\r\nfsd\r\nf\r\nsd\r\ndas\r\nf a\r\nsdf\r\n ds\r\nfasdgf,hsdagfhafk','','F','','','99999999999',''),
 (37,1,1,4,'','','','2014-11-04 09:32:49',0,0,'dddddddddddddd','','','M','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario_contato`
--

/*!40000 ALTER TABLE `usuario_contato` DISABLE KEYS */;
INSERT INTO `usuario_contato` (`ID`,`ID_Contato`,`ID_Usuario`,`Data_Cadastro`) VALUES 
 (1,2,1,'2014-10-26 16:38:09'),
 (2,3,1,'2014-10-26 16:38:45'),
 (3,4,1,'2014-10-29 20:47:38'),
 (4,5,1,'2014-10-29 20:49:03'),
 (5,6,1,'2014-10-29 20:52:30'),
 (6,7,2,'2014-10-29 20:55:01'),
 (7,8,2,'2014-10-29 20:55:54'),
 (8,9,1,'2014-10-29 21:17:57'),
 (9,10,1,'2014-10-29 21:18:18'),
 (10,11,1,'2014-10-30 19:03:24'),
 (11,12,1,'2014-10-30 19:05:39'),
 (12,13,1,'2014-10-30 19:10:56'),
 (13,14,1,'2014-10-30 19:13:55'),
 (14,15,2,'2014-10-30 19:25:25'),
 (15,16,2,'2014-10-30 19:27:32'),
 (16,17,1,'2014-10-30 19:36:22'),
 (17,18,1,'2014-10-30 19:36:54'),
 (18,19,1,'2014-10-30 20:26:42'),
 (19,0,1,'2014-11-02 13:11:47'),
 (20,0,1,'2014-11-02 13:11:51'),
 (21,0,1,'2014-11-02 13:11:54'),
 (22,23,1,'2014-11-02 13:22:53'),
 (23,24,1,'2014-11-02 13:23:43'),
 (24,25,1,'2014-11-02 13:24:03'),
 (25,26,1,'2014-11-02 13:26:06'),
 (26,27,2,'2014-11-02 15:31:50'),
 (27,28,2,'2014-11-02 15:31:53'),
 (28,29,2,'2014-11-02 15:31:54'),
 (29,30,2,'2014-11-02 15:34:45'),
 (30,31,2,'2014-11-02 15:34:47'),
 (31,32,2,'2014-11-02 15:34:51'),
 (32,33,2,'2014-11-03 12:19:26'),
 (33,34,2,'2014-11-03 12:20:55'),
 (34,35,2,'2014-11-03 12:20:55'),
 (35,36,2,'2014-11-03 12:20:57'),
 (36,37,1,'2014-11-04 09:32:52');
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
