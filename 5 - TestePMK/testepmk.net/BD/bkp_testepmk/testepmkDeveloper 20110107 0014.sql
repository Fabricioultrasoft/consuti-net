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
-- Create schema testepmk
--

CREATE DATABASE IF NOT EXISTS testepmk;
USE testepmk;

--
-- Definition of table `adm`
--

DROP TABLE IF EXISTS `adm`;
CREATE TABLE `adm` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `Login` varchar(20) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adm`
--

/*!40000 ALTER TABLE `adm` DISABLE KEYS */;
INSERT INTO `adm` (`ID`,`Login`,`Senha`) VALUES 
 (1,'a','a'),
 (2,'consuti','consuti');
/*!40000 ALTER TABLE `adm` ENABLE KEYS */;


--
-- Definition of table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) NOT NULL,
  `DATA` datetime NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`ID`,`DESCRICAO`,`DATA`,`TITULO`) VALUES 
 (1,'TESTEAAAAAAAAAAAAAAA','2001-12-26 00:00:00','TESTEA'),
 (2,'TESTEBBBB','2001-01-01 00:00:00','TESTEB'),
 (3,'TESTEC','2010-01-01 00:00:00','TESTEC'),
 (4,'TESTEC virou DDDDDDDDDDDDDddrdsg,sayf gaskfdsayfaksdfgdsafydsa gkfjgdsfjh dsaghfgdsmjhfgdsfsadfvsaf','2010-12-11 00:53:03','TESTEd- f-ds fa-f adfdsa9f564 56dsftar fgk4gruyg%$'),
 (5,'u','2010-12-11 00:55:18','UuUUuUUuU'),
 (6,'u','2010-12-11 00:55:55','UuUUuUUuU'),
 (7,'u','2010-12-11 00:55:55','UuUUuUUuU'),
 (8,'u','2010-12-11 00:55:55','UuUUuUUuU'),
 (9,'u','2010-12-11 00:56:40','UuUUuUUuU'),
 (10,'u','2010-12-11 00:56:40','UuUUuUUuU'),
 (11,'e eu aqui na braxisssssss','2010-12-11 00:57:35','uma da madruga'),
 (12,'e eu aqui na braxisssssss','2010-12-11 00:57:40','uma da madruga'),
 (13,' ','2010-12-11 01:01:18',' '),
 (14,' teste','2010-12-11 01:01:32','novo'),
 (15,'','2010-12-11 01:02:05',''),
 (16,'!!!!!','2010-12-11 01:02:21','finOOoOOOO'),
 (17,'!!!!!','2010-12-20 02:36:17','finOOoOOOO'),
 (18,'!@#$&*(fulribvuy gdsf g\r\ndfg fd g\r\ndfh fdgki, ygkfdigysfdiugl hoiglyubfdskidh gfds\r\ngsd hgfsmdfdsyg','2010-12-20 02:43:31','SUPER PROMOÇÃO DE NATAL KKKKKKKKKKKKKKKKKKKKKKKKKK'),
 (19,'sikfgdssadfs\r\ndfdsa\r\nfadsg','2010-12-21 20:57:19','SUPER PROMOÇÃO DE NATAL'),
 (20,'','2010-12-29 17:12:55',''),
 (21,'testando a funcionalidade de banner!!!','2010-12-30 16:58:20','teste de banner'),
 (22,'','2010-12-30 16:59:26',''),
 (23,'grande promoção grande promoção grande promoção grande promoção grande promoção grande promoção ','2011-01-03 01:15:44','Promoção de 2011');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;


--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `DESCRICAO` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`ID`,`NOME`,`DESCRICAO`) VALUES 
 (6,'Mesa PMK Profissional','Mesa Pmk Prafissional'),
 (7,'Anteparo Anatômico','Anteparo anatômico'),
 (8,'Mesa Portátil','Mesa Portátil'),
 (9,'Mesa Auxiliar','Mesa auxiliar'),
 (10,'Cadeira PMK','Cadeira PMK');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `ID_PEDIDO` int(4) NOT NULL,
  `ID_PRODUTO` int(4) NOT NULL,
  `QTD_PEDIDO` int(11) NOT NULL,
  `DESCONTO` double(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID_PEDIDO`,`ID_PRODUTO`),
  KEY `item_pedido_ibfk_2` (`ID_PRODUTO`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedido` (`ID`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`ID_PRODUTO`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_pedido`
--

/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;


--
-- Definition of table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(4) NOT NULL,
  `DATA_PEDIDO` tinyint(4) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `DATA_ENTREGA` datetime DEFAULT NULL,
  `DATA_ENVIO` datetime DEFAULT NULL,
  `FRETE` double(9,2) NOT NULL,
  `NOME_DESTINATARIO` varchar(100) NOT NULL,
  `ENDERECO_DSTINATARIO` varchar(200) NOT NULL,
  `CIDADE_DESTINO` varchar(100) NOT NULL,
  `CEP_DESTINO` int(15) NOT NULL,
  `PAIS_DESTINO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `pedido_ibfk_1` (`ID_USUARIO`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pedido`
--

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `PRECO_UNIDADE` double(12,2) NOT NULL,
  `DESCRICAO` varchar(200) NOT NULL,
  `QTD_ESTOQUE` int(11) NOT NULL,
  `ID_CATEGORIA` int(4) NOT NULL,
  `PESO` int(7) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `categoria_produto` (`ID_CATEGORIA`),
  CONSTRAINT `categoria_produto` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`ID`,`NOME`,`PRECO_UNIDADE`,`DESCRICAO`,`QTD_ESTOQUE`,`ID_CATEGORIA`,`PESO`) VALUES 
 (14,'Mesa Deslizante para teste PMK - Presilha super Ímã ',550.00,'A mesa profissional deslizante para teste PMK, dispõe de inovações que facilitam bem a aplicação do teste como o sistema de deslizamento para o centro da mesa e o travamento rápido, fácil e seguro que',10,6,9500),
 (15,'Mesa Deslizante para teste PMK - Presilha Prancheta',550.00,'O sistema de presilha do papel utilizando o magnetismo é muito prático e seguro uma vez que o ímã magnético não perde a sua energia (força) com o passar dos anos.\r\n\r\nPresilha do papel em 2 modelos: S',10,6,9500),
 (16,'Mesa Desmontável Deslizante para teste PMK - Presilha super Ímã',600.00,'Sua principal característica é a facilidade de transporte, uma vez que ela se divide em 4 partes é de fácil instalação e mantém todas as características e medidas determinadas pelo CRP.',10,6,9500),
 (17,'Mesa Desmontável Deslizante para teste PMK - Presilha Prancheta ',600.00,'O sistema de presilha do papel utilizando o magnetismo é muito prático e seguro uma vez que o ímã magnético não perde a sua energia (força) com o passar dos anos.\r\nDimensões do produto: 72,0 x 58,5',10,6,9500);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `CPF` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `DATA_NASC` datetime NOT NULL,
  `SENHA` varchar(20) NOT NULL,
  `SEXO` varchar(10) DEFAULT NULL,
  `CELULAR` int(11) DEFAULT NULL,
  `TEL_FIXO` int(11) NOT NULL,
  `RUA` varchar(200) NOT NULL,
  `BAIRRO` varchar(100) NOT NULL,
  `COMPLEMENTO` varchar(200) DEFAULT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `ESTADO` char(2) NOT NULL,
  `PROFISSAO` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CNPJ` int(14) DEFAULT NULL,
  `RAZAO_SOCIAL` varchar(200) DEFAULT NULL,
  `NUMERO` int(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`ID`,`CPF`,`NOME`,`DATA_NASC`,`SENHA`,`SEXO`,`CELULAR`,`TEL_FIXO`,`RUA`,`BAIRRO`,`COMPLEMENTO`,`CIDADE`,`ESTADO`,`PROFISSAO`,`EMAIL`,`CNPJ`,`RAZAO_SOCIAL`,`NUMERO`) VALUES 
 (1,1567325645,'cristian candido de oliveira gomes','0919-12-28 08:08:00','1234','masc',319765392,313564392,'planicie','serrano',NULL,'bh','mg','analista','cristian@consuti.net',NULL,'consuti.net',84);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
