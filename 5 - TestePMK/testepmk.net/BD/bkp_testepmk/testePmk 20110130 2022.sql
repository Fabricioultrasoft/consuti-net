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
-- Create schema consuti7
--

CREATE DATABASE IF NOT EXISTS consuti7;
USE consuti7;

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
  `DESCRICAO` varchar(500) NOT NULL,
  `DATA` datetime NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

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
 (23,'grande promoção grande promoção grande promoção grande promoção grande promoção grande promoção ','2011-01-03 01:15:44','Promoção de 2011'),
 (24,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção....','2011-01-22 18:32:43','TESTE DE TÍTULO DE PROMOÇÃO'),
 (25,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-22 18:39:55','TESTE DE TÍTULO DE PROMOÇÃO'),
 (26,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-29 19:41:28','TESTE DE TÍTULO DE PROMOÇÃO'),
 (27,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-29 19:47:46','TESTE DE TÍTULO DE PROMOÇÃO'),
 (28,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-29 19:51:17','TESTE DE TÍTULO DE PROMOÇÃO'),
 (29,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-29 19:51:22','TESTE DE TÍTULO DE PROMOÇÃO');
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
  `NUMERO_OBJTO_CORREIO` varchar(100) DEFAULT NULL,
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
  `PRECO_UNIDADE` int(10) NOT NULL,
  `DESCRICAO` varchar(100) NOT NULL,
  `QTD_ESTOQUE` int(11) NOT NULL,
  `ID_CATEGORIA` int(4) NOT NULL,
  `PESO` int(7) NOT NULL,
  `DESCRICAO_COMPLETA` varchar(1000) NOT NULL,
  `CAMINHO_MINIATURA` varchar(300) NOT NULL,
  `LINK_VIDEO` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `categoria_produto` (`ID_CATEGORIA`),
  CONSTRAINT `categoria_produto` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`ID`,`NOME`,`PRECO_UNIDADE`,`DESCRICAO`,`QTD_ESTOQUE`,`ID_CATEGORIA`,`PESO`,`DESCRICAO_COMPLETA`,`CAMINHO_MINIATURA`,`LINK_VIDEO`) VALUES 
 (18,'teste 1 do produto ',1,'teshafsduflsda fkua sdglufgasd lkfusadglkfuasdufgasdluif asdfhlwwwwwwwwwwwwww o ho h huioh uoh ldas',5,6,1,'kjgfka sdyfgskkj k yugYF|Kudtsfuya agdskfyu gqqqqqqqqqqqqqqqqqqqqqqqqqq weweeeeeeeeeeeeeeew  wn ekw  hsgddfhgsa dfjasdgf gsadlfyigaslkudfl ks gflu sad gfg slfi gi fgsdi agfi asdgfld f ausdhfludashfasdiuhglfasdu gfasdflasdfg lugashdflkasdgflkasdgfkasdgflkhasdgfasdhf gsadfgsdalfglyigqoygfiasdgfiyqgwieurft sidaufisdau fuisda  f asidf isdua fia fadsf sdiauf isuad fka sfuashdfkasdkjf hsdaklj fhkjsda hfkjda fkjh jkd fkjjf sdakj fasjkd fjaksdhfkjasdhfhsdafkhasdljkfhsdajhf lkjasdh flkjasdhf lkjhsadjkf hasdjklh fkjsdahf kjsadhkjf hasdkjfh kjsladh fjlks dahfkljh asdlkjfh sadklj hflkjasdhf lkjasdh fkjd hfd asdfasd fjsda fjksdh fkjshdafk jhsadkfj hsadkjf hsdkajh fkjsdahf kjsad hfkjsdah  sd fh sdaha fsdk fkjsda hfkjsadh fkjhasd fjksdh kfjhasd fkjasdhjlkfh dsalkj fhasdlkjfhsadlkjfhasdlkfhasdlkjhfasdkjhfasdkjhfasdkhfasldkjhfasdkjhf lasdkfhkj sdahfjk hdsjkhfdsahfuie whfiuewghfiusdifud shuf ds  adsfda sdsa akjd hkj h jksdhf ljkasdhfjkashdfjkahsdkjfh asdjkfh j fhasdhfajksd fhajsdkhf laskdjhf kjdashflkj','~\\Graficos\\ImagemNaoDisponivel.jpg',NULL),
 (19,'teste 2 do produto ',1,'WWWWWW WWWWW WWWWW WWWWWWWWWWWWWWWWWWWW WWWWWWWWWWWWW WWWWWW WWWwwww wwwwwwww wwwwwwww wwwwwwwww',5,6,1,'kjgfka sdyfgskkj k yugYF|Kudtsfuya agdskfyu gqqqqqqqqqqqqqqqqqqqqqqqqqq weweeeeeeeeeeeeeeew  wn ekw  hsgddfhgsa dfjasdgf gsadlfyigaslkudfl ks gflu sad gfg slfi gi fgsdi agfi asdgfld f ausdhfludashfasdiuhglfasdu gfasdflasdfg lugashdflkasdgflkasdgfkasdgflkhasdgfasdhf gsadfgsdalfglyigqoygfiasdgfiyqgwieurft sidaufisdau fuisda  f asidf isdua fia fadsf sdiauf isuad fka sfuashdfkasdkjf hsdaklj fhkjsda hfkjda fkjh jkd fkjjf sdakj fasjkd fjaksdhfkjasdhfhsdafkhasdljkfhsdajhf lkjasdh flkjasdhf lkjhsadjkf hasdjklh fkjsdahf kjsadhkjf hasdkjfh kjsladh fjlks dahfkljh asdlkjfh sadklj hflkjasdhf lkjasdh fkjd hfd asdfasd fjsda fjksdh fkjshdafk jhsadkfj hsadkjf hsdkajh fkjsdahf kjsad hfkjsdah  sd fh sdaha fsdk fkjsda hfkjsadh fkjhasd fjksdh kfjhasd fkjasdhjlkfh dsalkj fhasdlkjfhsadlkjfhasdlkfhasdlkjhfasdkjhfasdkjhfasdkhfasldkjhfasdkjhf lasdkfhkj sdahfjk hdsjkhfdsahfuie whfiuewghfiusdifud shuf ds  adsfda sdsa akjd hkj h jksdhf ljkasdhfjkashdfjkahsdkjfh asdjkfh j fhasdhfajksd fhajsdkhf laskdjhf kjdashflkj','~\\Adm\\Produtos\\ImgsProdutos\\teste 2 do produto _1.jpg',''),
 (20,'y',1,'tt',20,7,1,'tttt','~\\Adm\\Produtos\\ImgsProdutos\\y_1.jpg','lsayfgk yusdkysdugysdgdsaygfsad gfkjsgdfkjsgd skjsd ');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(20) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `DATA_NASC` varchar(20) DEFAULT NULL,
  `SENHA` varchar(20) NOT NULL,
  `SEXO` varchar(10) DEFAULT NULL,
  `CELULAR` varchar(20) DEFAULT NULL,
  `TEL_FIXO` varchar(20) NOT NULL,
  `RUA` varchar(200) NOT NULL,
  `BAIRRO` varchar(100) NOT NULL,
  `COMPLEMENTO` varchar(200) DEFAULT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `ESTADO` varchar(2) NOT NULL,
  `PROFISSAO` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  `RAZAO_SOCIAL` varchar(200) DEFAULT NULL,
  `NUMERO` int(6) NOT NULL,
  `CEP` varchar(10) NOT NULL,
  `INSCRICAO_ESTADUAL` varchar(30) DEFAULT NULL,
  `RG` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`ID`,`CPF`,`NOME`,`DATA_NASC`,`SENHA`,`SEXO`,`CELULAR`,`TEL_FIXO`,`RUA`,`BAIRRO`,`COMPLEMENTO`,`CIDADE`,`ESTADO`,`PROFISSAO`,`EMAIL`,`CNPJ`,`RAZAO_SOCIAL`,`NUMERO`,`CEP`,`INSCRICAO_ESTADUAL`,`RG`) VALUES 
 (2,'015.673.256-45','CRISTIAN GOMES','2000-02-02 00:00:00','123','Masculino','(99) 9999-9999','(99) 9999-9999','planície','serrano','lololol','belo horizonte','MG','analista','crismetall@hotmail.com','41.878.474/0001-18','teste do teste',84,'',NULL,NULL),
 (3,'015.673.256-45','CRISTIAN GOMESDS','2010-12-07 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','planície','serrano','lololol','belo horizonte','MG','analista','cristian@consuti.net','41.878.474/0001-18','teste do teste',84,'',NULL,NULL),
 (4,'015.673.256-45','CRISTIAN GOMES','2000-12-22 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','planície','serrano','lololol','belo horizonte','MG','analista','cristia2n@consuti.net','41.878.474/0001-18','teste do teste',84,'',NULL,NULL),
 (5,'015.673.256-45','CRISTIAN GOMES','2010-10-13 00:00:00','1','Feminino','(__) ____-____','(99) 9999-9999','planície','serrano','','belo horizonte','AP','','cristia2n@consuti.net2','__.___.___/____-__','',84,'',NULL,NULL),
 (6,'015.673.256-45','CRISTIAN GOMESDSKK','2010-11-08 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','kkkkkkkk','çlçlçlçlçl','lçlçlçlçlçl','çlçlçlçlçl','MG','analista','cristia2n@consuti.net28','','',8888,'',NULL,NULL),
 (7,'015.673.256-45','QQQQQQQQQQQQQQ QQQQQQQQQQQQQQQ','1988-09-28 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','ppppppppp','ooooooooooo','ooooooooooooo','ooooooooooooo','MG','jppppp','cri@t.com','015.673.256-45','qqqqqqqqqqqqqqqqqqqqqqqqqqqqq',999999,'',NULL,NULL),
 (8,'25.564.763/0001-96','WERWERWERWER',NULL,'1','','(99) 9999-9999','(99) 9999-9999','jhffhgfjhgfjfjhghgf','ghfjhgfjhgfjhfjhf','tfghfghfhgfjhfjh','ghfghfhgfhg','MG','','e@c.com','25.564.763/0001-96','werwerwerwer',555,'',NULL,NULL),
 (9,'25.564.763/0001-96','TTTTTTTTTT',NULL,'1','','(99) 9999-9999','(99) 9999-9999','jkgyjhgkjjj','jhgkjhgjkhgjhjhg','jhkgjhgkjgkjg','jhgjkhgjkhgjhgjkg','MG','','t@c.com','25.564.763/0001-96','tttttttttt',6666,'',NULL,NULL),
 (10,'015.673.256-45','QQQQQQQQQQ','2010-10-11 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','qqqqqqqqqqqqq','qqqqqqqqqqqqqqqqq','qqqqqqqqqqqqqqqqqq','qqqqqqqqqqqqqqq','MG','','q@q.com','015.673.256-45','qqqqqqqqqq',111111,'',NULL,NULL),
 (11,'25.564.763/0001-96','QQQQQQQQQQQQQQ','0001-01-01 00:00:00','9','','(99) 9999-9999','(99) 9999-9999','9999999999999999','9999999999999','9999999999999','9999999999999','MG','','9@u.com','25.564.763/0001-96','qqqqqqqqqqqqqq',99999,'',NULL,NULL),
 (12,'015.673.256-45','PPPPPPPPP','1988-09-28 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','yyyyyyyyyyyyyyyy','yyyyyyyyyyyyyyyy','yyyyyyyyyyyyyyyyyy','yyyyyyyyyyyyyyyy','MG','hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh','y@y.com','015.673.256-45','ppppppppp',888888,'30000000',NULL,NULL),
 (13,'015.673.256-45','JJJJJJJJJ','1988-09-28 00:00:00','1','Masculino','(99) 9999-9999','(99) 9999-9999','uuuuuuuuu','uuuuuuuuuuuuu','uuuuuuuuuu','uuuuuuuuuuuuuuuu','MG','uuuuuuuuuuuuuu','u@j.com','015.673.256-45','jjjjjjjjj',7777,'30882120',NULL,NULL),
 (14,'68.335.228/0001-76','TESWTE111','0001-01-01 00:00:00','1','','(__) ____-____','(99) 9999-9999','ppppppo','gggg','','gggg','MG','','conta@c.com','68.335.228/0001-76','teswte111',99,'30888888','isento',NULL),
 (15,'015.673.256-45','PÇÇÇÇÇÇ','1988-09-28 00:00:00','5','Masculino','(__) ____-____','(99) 9999-9999','999','99','','99','RJ','','9@9.com','015.673.256-45','pçççççç',999,'99999-999','','mg-12.835.428-X'),
 (16,'015.673.256-45','T','1988-09-28 00:00:00','1','Masculino','(__) ____-____','(99) 9999-9999','88','8','','8','MG','','9@l.com','015.673.256-45','t',8,'99999-999','','8'),
 (17,'015.673.256-45','T','1988-09-28 00:00:00','1','Masculino','(__) ____-____','(99) 9999-9999','88','8','','8','MG','','9@l.com','015.673.256-45','t',8,'99999-999','','8'),
 (18,'015.673.256-45','T','1988-09-28 00:00:00','1','Masculino','(__) ____-____','(99) 9999-9999','88','8','','8','MG','','9@l.com','015.673.256-45','t',8,'99999-999','','8'),
 (19,'015.673.256-45','T','1988-09-28 00:00:00','1','Masculino','(__) ____-____','(99) 9999-9999','88','8','','8','MG','','9@l.com','015.673.256-45','t',8,'99999-999','','8'),
 (20,'015.673.256-45','T','1988-09-28 00:00:00','1','Masculino','(__) ____-____','(99) 9999-9999','88','8','','8','MG','','9@l.com','015.673.256-45','t',8,'99999-999','','8'),
 (21,'65.842.779000138','TESTERAZ','0001-01-01 00:00:00','a','','','9999999999','rua','9999','','999','RR','','9q@9.com','65.842.779000138','TESTERAZ',9,'99999-999','ISENTO','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
