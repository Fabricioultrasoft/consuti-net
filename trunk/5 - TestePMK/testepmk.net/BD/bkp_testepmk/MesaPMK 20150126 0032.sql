-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-rel12.6-log


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
 (1,'e','e'),
 (2,'consuti','consuti');
/*!40000 ALTER TABLE `adm` ENABLE KEYS */;


--
-- Definition of table `anonimail`
--

DROP TABLE IF EXISTS `anonimail`;
CREATE TABLE `anonimail` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `EmailDestinatario` varchar(100) NOT NULL,
  `Texto` text NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `CodEnvio` varchar(50) NOT NULL,
  `DataEnvio` datetime NOT NULL,
  `EmailResposta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anonimail`
--

/*!40000 ALTER TABLE `anonimail` DISABLE KEYS */;
/*!40000 ALTER TABLE `anonimail` ENABLE KEYS */;


--
-- Definition of table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(2500) NOT NULL,
  `DATA` datetime NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

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
 (29,'Promoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!\r\nPromoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção imperdível!Promoção impeP','2011-01-29 19:51:22','TESTE DE TÍTULO DE PROMOÇÃO'),
 (30,'','2011-02-04 01:52:10',''),
 (31,'faça seu pedido agora, e na compra de 2 mesas PMK você lega inteiramente gratis 2 cadeiras.\r\n\r\nPromoção válida até dia 28 de fevereiro de 2011','2011-02-04 20:01:39','www.testepmk.com.br  você só tem a ganhar'),
 (32,'Faça seu pedido agora, \r\ne na compra de 2 mesas PMK você levará inteiramente grátis 2 cadeiras.\r\n\r\n\r\nPromoção válida até dia 28 de fevereiro de 2011','2011-02-04 23:06:50','www.testepmk.com.br      você só tem a ganhar'),
 (33,'Indique este site a um amigo.\r\n\r\nNa compra de três mesas PMK você leva inteiramente grátis uma mesa PMK portátil.\r\n\r\nPromoção válida até dia 15 de março de 2011.','2011-02-25 20:00:40','www.testepmk.com.br      você só tem a ganhar'),
 (34,'Indique este site a um amigo.\r\n\r\nComprando 2 mesas PMK com anteparo e leve de brinde as 2 cadeiras.\r\n\r\nPromoção válida até 20 de abril 2011.','2011-03-23 11:28:44','PROMOÇAO: CADEIRA PMK DE BRINDE'),
 (35,'Indique este site a um amigo.\r\n\r\nComprando 2 mesas PMK com anteparo e leve de brinde as 2 cadeiras.\r\n\r\nPromoção válida até 20 de abril 2011.','2011-03-23 11:29:21','PROMOÇAO: CADEIRA PMK DE BRINDE'),
 (36,'Ultimos dias da PROMOÇÃO:\r\n\r\nComprando 2 mesas PMK com anteparo = leve de brinde as 2 cadeiras.\r\n\r\nPromoção válida até 20 de abril 2011.','2011-04-19 00:04:52','PROMOÇAO: CADEIRA PMK DE BRINDE'),
 (37,'Ultimos dias da PROMOÇÃO:\r\n\r\nComprando 02 mesas PMK + 02 cadeiras:\r\nvocê ganha 01 MESA PORTÁTIL. \r\n\r\nPromoção válida até 20 de maio 2011.','2011-04-27 16:06:32','PROMOÇAO: CADEIRA PMK DE BRINDE'),
 (38,'\r\nComprando 02 mesas PMK + 02 cadeiras:\r\nvocê ganha 01 MESA PORTÁTIL. \r\n\r\n\r\nPromoção válida até 20 de maio 2011.','2011-04-27 16:09:39','PROMOÇAO - GANHE UMA MESA PORTÁTIL'),
 (39,'Comprando 02 mesas PMK + 02 cadeiras:\r\nvocê ganha 01 MESA PORTÁTIL. \r\n\r\n\r\nPromoção válida até dia 20 de maio 2011.','2011-04-27 16:11:50','PROMOÇÃO - GANHE UMA MESA PORTÁTIL'),
 (40,'O segundo domingo de Maio é consagrado ao abraço.\r\n\r\nNão um abraço qualquer.\r\n\r\nÉ consagrado ao abraço em nossas mães.\r\n','2011-05-23 16:52:57','FELIZ DIA DAS MÃES'),
 (41,'Devido ao grande sucesso e vários pedidos, retornamos com a promoção em que na compra de DUAS MESAS e DUAS CADEIRAS, você leva inteiramente grátis UMA MESA PORTÁTIL. Promoção válida até dia 30 de junho 2011.','2011-06-07 08:17:08','PROMOÇÃO DE JUNHO'),
 (42,'Devido ao grande sucesso e vários pedidos, retornamos com a promoção em que na compra de DUAS MESAS e DUAS CADEIRAS, você leva inteiramente grátis UMA MESA PORTÁTIL. Promoção válida até dia 30 de junho 2011.','2011-06-07 08:18:13','PROMOÇÃO: COMPRE 2 LEVE 3'),
 (43,'Devido ao grande sucesso e vários pedidos retornamos com a promoção em que na compra de DUAS MESAS PMK mais DUAS CADEIRAS PMK, você levará inteiramente grátis UMA MESA PORTÁTIL. Promoção válida até dia 30 de junho 2011.','2011-06-07 08:22:40','PROMOÇÃO: COMPRE 2 LEVE 3'),
 (44,'Devido ao grande sucesso e vários pedidos retornamos com a promoção em que na compra de DUAS MESAS PMK mais DUAS CADEIRAS PMK, você levará inteiramente grátis UMA MESA PORTÁTIL. Promoção válida até dia 30 de junho 2011 ou em quanto durarem os estoques.','2011-06-07 08:24:27','PROMOÇÃO: COMPRE 2 LEVE 3'),
 (45,'EM BREVE, AGUARDE.','2011-07-08 00:33:51','PROMOÇÕES ESPECIAIS'),
 (46,'Na compra de uma mesa você leva inteiramente grátis uma cadeira. Promoção válida até dia 31 de julho de 2011 ou até quando durar o estoque.\r\n','2011-07-18 23:44:20','COMPRE UMA MESA E LEVE A CADEIRA'),
 (47,'Na compra de uma mesa você leva inteiramente grátis uma cadeira. Promoção válida até dia 15 de Agosto de 2011 ou até quanto durar o estoque.                                OBS.: Ao realizar o pedido NÃO adicione a cadeira no carrinho, ela será adicionada ao seu pedido pelo setor de empacotamento.','2011-08-02 10:25:11','COMPRE UMA MESA E LEVE A CADEIRA'),
 (48,'','2011-08-03 23:19:21',''),
 (49,'Promoção válida até o dia 15 de agosto ou enquanto durarem os estoques. Não é necessário adicionar a cadeira ao pedido, ela será automaticamente enviada junto com a mesa.','2011-08-03 23:26:48','COMPRE UMA MESA E LEVE A CADEIRA'),
 (50,'Promoção válida até o dia 15 de agosto ou enquanto durarem os estoques. Não é necessário adicionar a cadeira ao pedido, ela será automaticamente enviada junto com a mesa.','2011-08-03 23:27:45','COMPRE UMA MESA E LEVE A CADEIRA'),
 (51,'Promoção válida até o dia 15 de agosto ou enquanto durarem os estoques. Não é necessário adicionar a cadeira ao pedido, ela será automaticamente enviada junto com a mesa.','2011-08-03 23:27:54','COMPRE UMA MESA E LEVE A CADEIRA'),
 (52,'indique este site a um amigo.','2011-08-16 11:52:13','www.testepmk.com.br'),
 (53,'','2011-08-27 19:28:56',''),
 (54,'São os votos de todos da Eber Móveis Profissionais','2011-08-27 19:34:40','FELIZ DIA DO PSICÓLOGO'),
 (55,'<p class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 10pt\"><span lang=\"EN-US\" style=\"mso-ansi-language: en-us\"><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\"><span style=\"font-family: verdana,arial,helvetica,sans-serif; color: #006699; font-size: 14pt; font-weight: bold\">Pençando em você a empresa Eber Móveis Profissionais esta oferecendo uma serie de links que facilitarão sua vida. Formulários, leis, rastreamento, e muito mais.</span></font></font></font><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\">\r\n<o:p></o:p></font></font></font></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 10pt\"><span lang=\"EN-US\" style=\"mso-ansi-language: en-us\"><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\"><span style=\"color: #990033; mso-spacerun: yes\">&nbsp;</span><span style=\"color: #990033\">Entre e confira e não esqueça de indicar a um amigo esta novidade.</span></font></font></font><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\">\r\n<o:p></o:p></font></font></font></span></p>','2011-09-09 22:57:00','NOVIDADES NO SITE'),
 (56,'<p class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 10pt\"><span lang=\"EN-US\" style=\"mso-ansi-language: en-us\"><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\"><span style=\"font-family: verdana,arial,helvetica,sans-serif; color: #006699; font-size: 10pt; font-weight: bold\">Pençando em você a empresa Eber Móveis Profissionais esta oferecendo uma serie de links que facilitarão sua vida. Formulários, leis, rastreamento, e muito mais.</span></font></font></font></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center; margin: 0cm 0cm 10pt\"><span lang=\"EN-US\" style=\"mso-ansi-language: en-us\"><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\"></font></font></font><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\"><span style=\"color: #990033; mso-spacerun: yes\">&nbsp;</span><span style=\"color: #990033\">Entre e confira e não esqueça de indicar a um amigo esta novidade.</span></font></font></font><font size=\"3\"><font color=\"#000000\"><font face=\"Calibri\">\r\n<o:p></o:p></font></font></font></span></p>','2011-09-09 22:59:23','NOVIDADES NO SITE'),
 (57,'','2011-09-18 18:55:19',''),
 (58,'<span style=\"color: #000000; font-family: times new roman; font-size: medium; \">\r\n<div style=\"color: #404040; background-color: #ffffff; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 2px; padding-right: 2px; padding-bottom: 2px; padding-left: 2px; font-family: verdana, sans-serif; font-size: 10pt; \">\r\n<p class=\"MsoNormal\" style=\"text-align: center; margin-top: 0cm; margin-right: 0cm; margin-bottom: 10pt; margin-left: 0cm; \"><font color=\"#006699\" face=\"verdana, arial, helvetica, sans-serif\"><b><span style=\"font-size: 12pt; \">Promoção válida até dia 23 de Setembro de 2011.</span></b></font></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center; margin-top: 0cm; margin-right: 0cm; margin-bottom: 10pt; margin-left: 0cm; \"><font color=\"#006699\" face=\"verdana, arial, helvetica, sans-serif\"><b><span style=\"color: #990033; \">Na compra de qualquer produto o frete será gratuito.</span></b></font></p></div></span>','2011-09-18 19:02:03','PROMOÇÃO FIM DE INVERNO'),
 (59,'','2011-09-26 08:54:48',''),
 (60,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">NA COMRA DE QUALQUER MODELO DE MESA PMK </span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">VOCÊ LEVA DE BRINDE UMA CADEIRA PMK.</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">=PROMOÇÃO VÁLIDA ATÉ DIA 28 DE OUTUBRO 2011=</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">OU ATÉ QUANDO DURAREM OS ESTOQUES.</span></p>','2011-10-24 13:01:44','PROMOÇÃO RELÂMPAGO'),
 (61,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">NA COMRA DE QUALQUER MODELO DE MESA PMK </span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">VOCÊ LEVA DE BRINDE UMA CADEIRA PMK.</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">=PROMOÇÃO VÁLIDA ATÉ DIA 28 DE OUTUBRO 2011=</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">OU ATÉ QUANDO DURAREM OS ESTOQUES.</span></p>','2011-10-24 13:06:45','PROMOÇÃO RELÂMPAGO'),
 (62,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">NA COMRA DE QUALQUER MODELO DE MESA PMK VOCÊ LEVA DE BRINDE UMA CADEIRA PMK.</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">=PROMOÇÃO VÁLIDA ATÉ DIA 28 DE OUTUBRO 2011=</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">OU ATÉ QUANDO DURAREM OS ESTOQUES.</span></p>','2011-10-24 13:08:10','PROMOÇÃO RELÂMPAGO'),
 (63,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">NA COMRA DE QUALQUER MODELO DE MESA PMK VOCÊ LEVA DE BRINDE UMA CADEIRA PMK.</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">=PROMOÇÃO VÁLIDA ATÉ DIA 28 DE OUTUBRO 2011=</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">OU ATÉ QUANDO DURAREM OS ESTOQUES.</span></p>','2011-10-24 13:12:50','PROMOÇÃO RELÂMPAGO'),
 (64,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: arial,helvetica,sans-serif; color: #ff0000; font-size: 12pt; font-weight: bold\">NA COMPRA DE QUALQUER MODELO DE MESA PMK VOCÊ LEVA DE BRINDE UMA CADEIRA PMK.</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">=PROMOÇÃO VÁLIDA ATÉ DIA 28 DE OUTUBRO 2011=</span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-size: 8pt\">OU ATÉ QUANDO DURAREM OS ESTOQUES.</span></p>','2011-10-24 13:15:09','PROMOÇÃO RELÂMPAGO'),
 (65,'','2011-10-30 02:29:30',''),
 (66,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 12pt\">A empresa Eber Móveis Profissionais deseja a </span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 12pt\">todos os clientes um Feliz Natal.</span></p>','2011-12-16 09:43:28','FELIZ NATAL'),
 (67,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-style: italic; font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 14pt\">A empresa Eber Móveis Profissionais deseja a </span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-style: italic; font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 14pt\">todos os clientes um Feliz Natal.</span></p>','2011-12-16 09:44:15','FELIZ NATAL'),
 (68,'<p style=\"text-align: center; margin: 0px\"><span style=\"font-style: italic; font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 14pt\">A empresa Eber Móveis Profissionais deseja a </span></p>\r\n<p style=\"text-align: center; margin: 0px\"><span style=\"font-style: italic; font-family: georgia,times new roman,times,serif; color: #ff0000; font-size: 14pt\">todos os clientes um Feliz Ano Novo.</span></p>','2012-01-03 00:42:57','FELIZ ANO NOVO'),
 (69,'','2012-01-30 23:00:24',''),
 (70,'www.testepmk.com.br','2012-01-30 23:05:04','parcele suas compras em até 12x no cartão'),
 (71,'<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; \"><span style=\"color: #ff0000; font-size: 12pt; \">www.testepmk.com.br</span></p>','2012-01-30 23:09:36','parcele suas compras em até 12x no cartão'),
 (72,'<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; \"><font color=\"#ff0000\" size=\"3\">Entre em contato pelo nosso e-mail &nbsp;mesapmk@gmail.co &nbsp;informe seu CEP e solicite uma simulação do frete para sua cidade.</font></p>\r\n<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; \"><font color=\"#ff0000\" size=\"3\">O frete é pago a parte ele não esta incluso em seu carrinho de compras.</font></p>','2012-02-10 00:24:19','SIMULE SEU FRETE'),
 (73,'<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; \"><font color=\"#ff0000\" size=\"3\">Entre em contato pelo nosso e-mail &nbsp;</font><font color=\"#ff0000\" size=\"3\"><span style=\"text-decoration: underline; font-style: italic; font-weight: bold; \">mesapmk@gmail.com</span></font><font color=\"#ff0000\" size=\"3\"> &nbsp;informe seu CEP e solicite uma simulação do frete para sua cidade.</font></p>\r\n<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; \"><font color=\"#ff0000\" size=\"3\">O frete é pago a parte ele não esta incluso em seu carrinho de compras.</font></p>','2012-02-10 00:25:09','SIMULE SEU FRETE'),
 (74,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt;\">Nas compras realizadas até o dia 31/03/2012 tendo pelo menos </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt; text-decoration: underline;\">uma mesa PMK </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt;\">no carrinho o frete será gratuito para qualquer lugar do Brasil. </span></font></p>\r\n<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #ff0000; font-size: 10pt;\">OBS: o frete será gratuito </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #ff0000; font-size: 10pt;\">somente tendo pelo menos&nbsp;uma mesa na lista</span></font></p>','2012-03-23 18:30:56','FRETE GRÁTIS'),
 (75,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt;\">Nas compras realizadas até o dia 31/03/2012 tendo pelo menos </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt; text-decoration: underline;\">uma mesa PMK </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 10pt;\">no carrinho o frete será gratuito para qualquer lugar do Brasil. </span></font></p>\r\n<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #ff0000; font-size: 10pt; font-weight: bold;\">OBS: o frete será gratuito </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #ff0000; font-size: 10pt; font-weight: bold;\">somente se tiver pelo menos&nbsp;uma mesa PMK&nbsp;na lista</span></font></p>','2012-03-23 18:36:19','PROMOÇÃO - COMPROU A MESA O FRETE GRÁTIS'),
 (76,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\">Antes de efetuar sua compra entre em contato pelo e-mail </span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\"><a shape=\"rect\" href=\"mailto:mesapmk@gmail.com\">mesapmk@gmail.com</a></span></font><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\"> e solicite uma simulação dos custos de seu frete para ver se vale a pena comprar. Favor fornecer seu CEP.</span></font></p>','2012-04-02 12:29:35','SIMULE SEU FRETE ANTES DE COMPRAR'),
 (77,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\">VAMOS FICAR NA TORCIDA PARA QUE O TESTE RETORNE REFORMULADO E COM A CREDIBILIDADE BEM MAIOR QUE ANTES. MUITOS INVESTIRAM ALTO PARA PODER APLICAR ESTE TESTE E NÃO ACHAMOS JUSTO QUE ELE SEJA DEPOIS DE TANTO TEMPO DESQUALIFICADO DESTA MANEIRA.</span></font></p>\r\n<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"></font></p>','2012-05-29 16:42:07','CFP JULGA TESTE PMK DESFAVORÁVEL'),
 (78,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\">VAMOS FICAR NA TORCIDA PARA QUE O TESTE RETORNE REFORMULADO E COM A CREDIBILIDADE BEM MAIOR QUE ANTES. MUITOS INVESTIRAM ALTO PARA PODER APLICAR ESTE TESTE E NÃO ACHAMOS JUSTO QUE ELE SEJA DEPOIS DE TANTO TEMPO DESQUALIFICADO DESTA MANEIRA.</span></font></p>\r\n<p style=\"margin: 0px; text-align: center;\"></p>','2012-05-29 16:42:44','CFP JULGA TESTE PMK DESFAVORÁVEL'),
 (79,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #000066; font-size: 8pt;\">VAMOS FICAR NA TORCIDA PARA QUE O TESTE RETORNE REFORMULADO E COM A CREDIBILIDADE BEM MAIOR QUE ANTES. MUITOS INVESTIRAM ALTO PARA PODER APLICAR ESTE TESTE E NÃO ACHAMOS JUSTO QUE ELE SEJA DEPOIS DE TANTO TEMPO NO MERCADO DESQUALIFICADO DESTA MANEIRA.</span></font></p>\r\n<p style=\"margin: 0px; text-align: center;\"></p>','2012-05-29 16:45:35','CFP JULGA TESTE PMK DESFAVORÁVEL'),
 (80,'<p style=\"margin: 0px; text-align: center;\"><font color=\"#ff0000\" size=\"3\"><span style=\"color: #ff0000; font-size: 10pt; font-weight: bold;\">Aproveite o momento para adquirir sua Mesa PMK e os demais acessórios,&nbsp;porque assim que o teste PMK for liberado pelo CFP o teste e os demais acessorio sofrerão reajustes.</span></font></p>','2012-06-11 09:59:03','APROVEITE A OPORTUNIDADE'),
 (81,'<strong><font color=\"#ff0000\"><span style=\"font-size: 18pt;\">COMPRE A MESA PMK R$ 600,00 E GANHE A CADEIRA COMO BRINDE.</span></font></strong>','2012-06-26 15:50:24','APROVEITE A OPORTUNIDADE'),
 (82,'<strong><font color=\"#ff0000\"><span style=\"font-size: 18pt;\">Antes de concluir sua compre solicite por e-mail a simulação do frete. </span></font></strong><font color=\"#ff0000\"><span style=\"font-size: 18pt;\">&nbsp;mesapmk@gmail.com</span></font>','2012-07-13 10:26:54','Quanto pagarei pelo frete???');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`ID`,`NOME`,`DESCRICAO`) VALUES 
 (6,'Mesa PMK Profissional','Mesa Pmk Prafissional - ideal para aplicação do teste PMK'),
 (7,'Anteparo Anatômico','Anteparo anatômico com regulagem de altura. Produto patenteado'),
 (8,'Mesa Portátil','Mesa Portátil ideal para quem tem que transportar a mesa.'),
 (9,'Mesa Auxiliar','Mesa auxiliar, um grande apoio no momento do teste.'),
 (10,'Cadeira PMK','Cadeira PMK, indicada para que o candidato realize o teste na postura correta.'),
 (11,'Papelaria','Calculadora eletrônica, Regua, lápis, grampeador, extrator, cronômetro, caneta, chaveiro.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `contadoracesso`
--

DROP TABLE IF EXISTS `contadoracesso`;
CREATE TABLE `contadoracesso` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `IP` varchar(20) DEFAULT NULL,
  `Data` datetime NOT NULL,
  `Tela` varchar(20) NOT NULL,
  `BrowsertName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contadoracesso`
--

/*!40000 ALTER TABLE `contadoracesso` DISABLE KEYS */;
INSERT INTO `contadoracesso` (`ID`,`IP`,`Data`,`Tela`,`BrowsertName`) VALUES 
 (1,'127.0.0.1','2013-09-16 20:55:09','Enviar','Chrome29');
/*!40000 ALTER TABLE `contadoracesso` ENABLE KEYS */;


--
-- Definition of table `emailsbloqueados`
--

DROP TABLE IF EXISTS `emailsbloqueados`;
CREATE TABLE `emailsbloqueados` (
  `Email` varchar(100) NOT NULL,
  `CodDesbloqueio` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailsbloqueados`
--

/*!40000 ALTER TABLE `emailsbloqueados` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailsbloqueados` ENABLE KEYS */;


--
-- Definition of table `itens_retorno`
--

DROP TABLE IF EXISTS `itens_retorno`;
CREATE TABLE `itens_retorno` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `TransacaoID` varchar(50) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  `Frete` float(10,2) DEFAULT NULL,
  `Peso` int(10) NOT NULL,
  `Quantidade` int(4) NOT NULL,
  `Valor` float(10,2) NOT NULL,
  `ValorExtra` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_retorno`
--

/*!40000 ALTER TABLE `itens_retorno` DISABLE KEYS */;
INSERT INTO `itens_retorno` (`ID`,`TransacaoID`,`Codigo`,`Descricao`,`Frete`,`Peso`,`Quantidade`,`Valor`,`ValorExtra`) VALUES 
 (1,'4C597589503B4B6E9A193DFAA58A9787','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (2,'422905CB042941E69580B827A186B86F','26','A mesa profissional deslizante para teste PMK.',0.00,0,1,550.00,0.00),
 (3,'CDC570A804534677A280E50DC399D61B','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (4,'422905CB042941E69580B827A186B86F','26','A mesa profissional deslizante para teste PMK.',0.00,0,1,550.00,0.00),
 (5,'014711E4AD044475B556CC11D2591E34','18','teshafsduflsda fkua sdglufgasd lkfusadglkfuasdufgasdluif asdfhlwwwwwwwwwwwwww o ho h huioh uoh ldas',0.00,0,1,0.01,0.00),
 (6,'E9445063DAFF41BAA11D9AA460164402','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (7,'4C597589503B4B6E9A193DFAA58A9787','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (8,'CDC570A804534677A280E50DC399D61B','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (9,'422905CB042941E69580B827A186B86F','26','A mesa profissional deslizante para teste PMK.',0.00,0,1,550.00,0.00),
 (10,'B594B0767B49460FACD73404C83E2A17','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (11,'B594B0767B49460FACD73404C83E2A17','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (12,'ED9A96A5BA1F4587937707D1A193B899','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (13,'ED9A96A5BA1F4587937707D1A193B899','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (14,'2BD00A83999B4EFCA71FE7C7EABF5EB2','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (15,'2BD00A83999B4EFCA71FE7C7EABF5EB2','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (16,'5D944DBD1E2A46B190DE031B72710216','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (17,'9D95FC2B3E934AD5A1B9D9C35A5030C7','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (18,'5D944DBD1E2A46B190DE031B72710216','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (19,'47533CD298E2413BB8634DAB35EA2770','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (20,'47533CD298E2413BB8634DAB35EA2770','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (21,'16059564238C4E538C67AC5A55881C9A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (22,'16059564238C4E538C67AC5A55881C9A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (23,'3872AB87E4BD4CDC902F453AF4338591','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (24,'ED9A96A5BA1F4587937707D1A193B899','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (25,'7B9E8225E9E844A889B5033AAFADA94D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (26,'6088AAF652A548C7AFD7B42307A9DA67','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (27,'6088AAF652A548C7AFD7B42307A9DA67','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (28,'BAB5F4E869D940C6BE2F7B7A41DEF0AE','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (29,'917E94F5DA744E02BEFD57D2A917B3BF','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (30,'6CFE4F3DBB7A478D93D2BF6354A52F1D','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (31,'FF9490009E1042248C20BBDFBBCF6DAC','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (32,'2BD00A83999B4EFCA71FE7C7EABF5EB2','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (33,'FF9490009E1042248C20BBDFBBCF6DAC','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (34,'9D95FC2B3E934AD5A1B9D9C35A5030C7','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (35,'5D944DBD1E2A46B190DE031B72710216','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (36,'6B9F7E8B41AC4525B7137E132844DC62','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (37,'6B9F7E8B41AC4525B7137E132844DC62','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (38,'16059564238C4E538C67AC5A55881C9A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (39,'3872AB87E4BD4CDC902F453AF4338591','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (40,'8ECC62081558459D96128A64CC4ACFDD','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (41,'1FBDC9DC5C5540578581E8E6DE69B6FC','26','A mesa profissional para teste PMK.',0.00,0,3,550.00,0.00),
 (42,'2CBA03A8D91B40EE850298BC3332904E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (43,'6071C50DDD7F472EB15C8B17065839B8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (44,'0419DE9307504654864613EFE30632A7','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (45,'0419DE9307504654864613EFE30632A7','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (46,'440EC985719646E0B77C619353ADF84D','26','A mesa profissional para teste PMK.',0.00,0,3,550.00,0.00),
 (47,'BF84E6768EFF4ABE968F5523985E21F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (48,'440EC985719646E0B77C619353ADF84D','26','A mesa profissional para teste PMK.',0.00,0,3,550.00,0.00),
 (49,'7B9E8225E9E844A889B5033AAFADA94D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (50,'BF84E6768EFF4ABE968F5523985E21F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (51,'6088AAF652A548C7AFD7B42307A9DA67','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (52,'BAB5F4E869D940C6BE2F7B7A41DEF0AE','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (53,'917E94F5DA744E02BEFD57D2A917B3BF','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (54,'6CFE4F3DBB7A478D93D2BF6354A52F1D','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (55,'33E966A539AD4C7487D1EDAC3D0650FC','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (56,'33E966A539AD4C7487D1EDAC3D0650FC','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (57,'FF9490009E1042248C20BBDFBBCF6DAC','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (58,'DB5168C6C8094C03B1069A196AEDC04A','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (59,'123CD6DDB72A4E37AF66C323846D44BF','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (60,'123CD6DDB72A4E37AF66C323846D44BF','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (61,'CE22CD62DFBD470CBF3F257CBA76B678','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (62,'2258F4A5801F4C6FAD71655777A86F06','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (63,'CE22CD62DFBD470CBF3F257CBA76B678','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (64,'2258F4A5801F4C6FAD71655777A86F06','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (65,'8ECC62081558459D96128A64CC4ACFDD','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (66,'2CBA03A8D91B40EE850298BC3332904E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (67,'6071C50DDD7F472EB15C8B17065839B8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (68,'FA580BF7F4BB42DF81643684BD653BC5','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (69,'0419DE9307504654864613EFE30632A7','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (70,'F7ACB190F6084022B4F539362623D695','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (71,'459B296C18654E91A7A0C17F2C5CF1DF','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (72,'7F7EDE77CF84484EB2A9EBAF0FC11CF1','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (73,'440EC985719646E0B77C619353ADF84D','26','A mesa profissional para teste PMK.',0.00,0,3,550.00,0.00),
 (74,'BF84E6768EFF4ABE968F5523985E21F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (75,'33E966A539AD4C7487D1EDAC3D0650FC','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (76,'DB5168C6C8094C03B1069A196AEDC04A','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (77,'51734FF3CFD149E9B2EBD401F85AD745','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (78,'F2CB21696E0E43A8B7CD7D2979201746','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (79,'F2CB21696E0E43A8B7CD7D2979201746','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (80,'51734FF3CFD149E9B2EBD401F85AD745','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (81,'D5F59FF760DB4463ABC7768762D1CB61','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (82,'D5F59FF760DB4463ABC7768762D1CB61','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (83,'CE22CD62DFBD470CBF3F257CBA76B678','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (84,'2258F4A5801F4C6FAD71655777A86F06','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (85,'FA580BF7F4BB42DF81643684BD653BC5','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (86,'459B296C18654E91A7A0C17F2C5CF1DF','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (87,'7F7EDE77CF84484EB2A9EBAF0FC11CF1','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (88,'BA068787F9E64342B84154DF786C89EE','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (89,'058D442522F2459B8121295CBAC50BA1','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (90,'EED222D3AF314E85A55A361EC71AAE7A','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (91,'ACD9CB754F604B0AA1ECA00E7E854293','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (92,'6011C62039C7492D87FD4C33DA55F14D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (93,'D84EDC678F7443718243A8B706AE8F78','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (94,'BA068787F9E64342B84154DF786C89EE','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (95,'F2CB21696E0E43A8B7CD7D2979201746','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (96,'51734FF3CFD149E9B2EBD401F85AD745','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (97,'EED222D3AF314E85A55A361EC71AAE7A','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (98,'D84EDC678F7443718243A8B706AE8F78','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (99,'21561D7659C644F5940DBFD060B5CC35','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (100,'D69494A8152C4DE8936A94EAB7C0BF65','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (101,'AC8D3786F03A48B3AD3AA7E0C3FB808A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (102,'D69494A8152C4DE8936A94EAB7C0BF65','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (103,'AC8D3786F03A48B3AD3AA7E0C3FB808A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (104,'6011C62039C7492D87FD4C33DA55F14D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (105,'EED222D3AF314E85A55A361EC71AAE7A','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (106,'D84EDC678F7443718243A8B706AE8F78','26','A mesa profissional para teste PMK.',0.00,0,2,550.00,0.00),
 (107,'21561D7659C644F5940DBFD060B5CC35','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (108,'6011C62039C7492D87FD4C33DA55F14D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (109,'9516E126FC5D420DA01C1F427068CC04','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (110,'9516E126FC5D420DA01C1F427068CC04','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,550.00,0.00),
 (111,'D69494A8152C4DE8936A94EAB7C0BF65','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (112,'AC8D3786F03A48B3AD3AA7E0C3FB808A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (113,'295E037636FB438FB864CC058AA9B2FF','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (114,'295E037636FB438FB864CC058AA9B2FF','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (115,'9E80462053A040B3945665654CFA1E69','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (116,'9E80462053A040B3945665654CFA1E69','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (117,'E0205AF5B49A4086A828CA83E9624589','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (118,'E0205AF5B49A4086A828CA83E9624589','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (119,'B8EA153836804644A839073D053BE95B','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (120,'21AB11E3F05C4C08B377FC2AA4BEF854','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (121,'21AB11E3F05C4C08B377FC2AA4BEF854','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (122,'251A511EC41F44C88B6C9D9955F30F3E','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (123,'251A511EC41F44C88B6C9D9955F30F3E','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (124,'A262CF15C21B4431BB21E5513A7380EF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (125,'A262CF15C21B4431BB21E5513A7380EF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (126,'E0205AF5B49A4086A828CA83E9624589','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (127,'B8EA153836804644A839073D053BE95B','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (128,'148D9613D2C1441D814A7F66BC2A447E','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (129,'21AB11E3F05C4C08B377FC2AA4BEF854','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (130,'CE7C58B62D664D4AA3E094F2CEEDD848','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (131,'6F55E3F8A4E249338662D8543031D3D6','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (132,'CE7C58B62D664D4AA3E094F2CEEDD848','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (133,'251A511EC41F44C88B6C9D9955F30F3E','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (134,'148D9613D2C1441D814A7F66BC2A447E','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (135,'A262CF15C21B4431BB21E5513A7380EF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (136,'83911A5137AD4BEEABB84DF3634A573A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (137,'83911A5137AD4BEEABB84DF3634A573A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (138,'CBC80CA23C7E4118A412DFEBAC0AC831','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (139,'AE7276EF6BCE4DE3A8231D00797D40D1','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (140,'6F55E3F8A4E249338662D8543031D3D6','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (141,'CE7C58B62D664D4AA3E094F2CEEDD848','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (142,'148D9613D2C1441D814A7F66BC2A447E','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (143,'D7AEC6D2EF634697864027C13872ABEE','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (144,'080200C527144B4F82E683EE79D45634','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (145,'0696D326C3AB416DA2C832A42EE49DE8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (146,'080200C527144B4F82E683EE79D45634','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (147,'83911A5137AD4BEEABB84DF3634A573A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (148,'D7AEC6D2EF634697864027C13872ABEE','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (149,'CBC80CA23C7E4118A412DFEBAC0AC831','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (150,'AE7276EF6BCE4DE3A8231D00797D40D1','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (151,'0696D326C3AB416DA2C832A42EE49DE8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (152,'080200C527144B4F82E683EE79D45634','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (153,'7FCD776BEDA840CA8B612322B298CCAF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (154,'7FCD776BEDA840CA8B612322B298CCAF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (155,'D7AEC6D2EF634697864027C13872ABEE','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (156,'0696D326C3AB416DA2C832A42EE49DE8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (157,'8E4B5A5C2F6B4E6484699191F2F16BC9','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (158,'8E4B5A5C2F6B4E6484699191F2F16BC9','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (159,'8E4B5A5C2F6B4E6484699191F2F16BC9','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (160,'012F8445A5BE424E9574B908B38A504B','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (161,'A4944CEEAAA34B53B82612CFEC80C7B9','33','Cronômetro Progressivo MJ-2005 - un',0.00,0,1,15.00,0.00),
 (162,'A3D00A2FAFF74E6886F5C018C913A95E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (163,'D4D3BCFD76E048F183574D3C9CF6F970','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (164,'D2D55BA5E22B4BCB9C9C088522768CB3','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (165,'E810AB5F31B34E2CA537BE539266BC5D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (166,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (167,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (168,'977A750E4AA0445F9CE4E97B28CFE1DF','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (169,'831C7D38ACC94D87A446300035B02198','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (170,'E810AB5F31B34E2CA537BE539266BC5D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (171,'A4944CEEAAA34B53B82612CFEC80C7B9','33','Cronômetro Progressivo MJ-2005 - un',0.00,0,1,15.00,0.00),
 (172,'D2D55BA5E22B4BCB9C9C088522768CB3','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (173,'DD16AA817685454F8A9A8D232E67D4C3','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (174,'002383496D2A4BAABFFDA709B5E0AF34','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (175,'05B6397EE12E49EB893A8C5CD850AF9D','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (176,'3B8E0CCC115B4F228761D001B2A87DF0','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (177,'CA1A913F7369407D8122973FEEDB964F','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (178,'CA9B631071EF4F11AE338FFFE340B32C','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (179,'154DB9B2396545DCA1CB7773FBB6E733','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (180,'002383496D2A4BAABFFDA709B5E0AF34','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (181,'3B8E0CCC115B4F228761D001B2A87DF0','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (182,'CA9B631071EF4F11AE338FFFE340B32C','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (183,'5BF356F535F347038D13592AAC3009A0','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (184,'154DB9B2396545DCA1CB7773FBB6E733','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (185,'012F8445A5BE424E9574B908B38A504B','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (186,'D4D3BCFD76E048F183574D3C9CF6F970','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (187,'977A750E4AA0445F9CE4E97B28CFE1DF','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (188,'831C7D38ACC94D87A446300035B02198','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (189,'D46A8D881BCA49A09A1A39B538E17AD7','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (190,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (191,'A4944CEEAAA34B53B82612CFEC80C7B9','33','Cronômetro Progressivo MJ-2005 - un',0.00,0,1,15.00,0.00),
 (192,'D2D55BA5E22B4BCB9C9C088522768CB3','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (193,'DD16AA817685454F8A9A8D232E67D4C3','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (194,'504E11B8CBF64EED9ED83F20D56B3802','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (195,'05B6397EE12E49EB893A8C5CD850AF9D','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (196,'CA1A913F7369407D8122973FEEDB964F','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (197,'002383496D2A4BAABFFDA709B5E0AF34','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (198,'3B8E0CCC115B4F228761D001B2A87DF0','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (199,'5BF356F535F347038D13592AAC3009A0','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (200,'154DB9B2396545DCA1CB7773FBB6E733','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (201,'DC205AF7771A41848D9070E144BE6498','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (202,'0B1CE94F6DBE475C8BB7FA808192B517','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (203,'D46A8D881BCA49A09A1A39B538E17AD7','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (204,'E0C89B9B633A45BFBF52BDAFF08CE76D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (205,'E0C89B9B633A45BFBF52BDAFF08CE76D','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (206,'AACFF4A130DE45E58F1967B10AF12670','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (207,'504E11B8CBF64EED9ED83F20D56B3802','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (208,'1A55EDEE2D734A60A7E3016FC5D4684B','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (209,'AACFF4A130DE45E58F1967B10AF12670','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (210,'1A55EDEE2D734A60A7E3016FC5D4684B','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (211,'DC205AF7771A41848D9070E144BE6498','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (212,'0B1CE94F6DBE475C8BB7FA808192B517','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (213,'E84897173386464FA007FBABB49329D4','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (214,'CC08DA03E5BD45C79A6ED25A38F13D90','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (215,'6875B229E52041CDA604ACB9EBDBE735','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (216,'6875B229E52041CDA604ACB9EBDBE735','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (217,'AACFF4A130DE45E58F1967B10AF12670','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (218,'41E6E3B700E74944884C0A3D35C4A301','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (219,'CC08DA03E5BD45C79A6ED25A38F13D90','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (220,'1A55EDEE2D734A60A7E3016FC5D4684B','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (221,'43586C55934C404B8E4CC0D7C4B9FAF8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (222,'43586C55934C404B8E4CC0D7C4B9FAF8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (223,'E740A83963914A21913E53F674BAB227','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (224,'E740A83963914A21913E53F674BAB227','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (225,'6875B229E52041CDA604ACB9EBDBE735','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (226,'41E6E3B700E74944884C0A3D35C4A301','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (227,'CC08DA03E5BD45C79A6ED25A38F13D90','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (228,'0B55FEBC9C02445781A9936E27A36185','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (229,'D9AB22F3096E4FF2BE509E22D7DE88B2','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (230,'43586C55934C404B8E4CC0D7C4B9FAF8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (231,'E740A83963914A21913E53F674BAB227','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (232,'82834F08D6C7497DB4F6531A7062EC50','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (233,'82834F08D6C7497DB4F6531A7062EC50','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (234,'93A77C0C2EA344B281E6337EEDF715AE','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (235,'93A77C0C2EA344B281E6337EEDF715AE','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (236,'0B55FEBC9C02445781A9936E27A36185','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (237,'D9AB22F3096E4FF2BE509E22D7DE88B2','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (238,'395DEB3C19B34CB396E8B291EFFFA80E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (239,'395DEB3C19B34CB396E8B291EFFFA80E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (240,'E6AEA68219D048C0939CD3EF98F9230D','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (241,'E6AEA68219D048C0939CD3EF98F9230D','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (242,'93A77C0C2EA344B281E6337EEDF715AE','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (243,'830E94DEC3764696A28B38469C9E8BEB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (244,'B026D63969CE48E780285C2481A35D12','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (245,'B026D63969CE48E780285C2481A35D12','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (246,'395DEB3C19B34CB396E8B291EFFFA80E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (247,'CD327A4C3D6642778CE6977C27325ABB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (248,'BDCEFF91DEBA4245B9DDBC445DE55280','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (249,'E6AEA68219D048C0939CD3EF98F9230D','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (250,'830E94DEC3764696A28B38469C9E8BEB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (251,'B026D63969CE48E780285C2481A35D12','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (252,'CD327A4C3D6642778CE6977C27325ABB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (253,'BDCEFF91DEBA4245B9DDBC445DE55280','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (254,'DA447FFE1E694E8EA072C32D4D50F440','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (255,'DA447FFE1E694E8EA072C32D4D50F440','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (256,'B3AE3FE195464D478A067334284F1595','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (257,'BEB222F905414B8E87683F3CF4D8E94E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (258,'BEB222F905414B8E87683F3CF4D8E94E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (259,'B3AE3FE195464D478A067334284F1595','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (260,'F0D220D81F344E16A87ADAA3DCCABCC7','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (261,'3701E5D116574349B1AFCDF1A332BC62','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (262,'48EF89F2995C42148D93DC9160265FB8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (263,'3701E5D116574349B1AFCDF1A332BC62','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (264,'F0D220D81F344E16A87ADAA3DCCABCC7','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (265,'48EF89F2995C42148D93DC9160265FB8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (266,'BEB222F905414B8E87683F3CF4D8E94E','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (267,'8709E07B1F834618ACDCE59FCE48ED9D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (268,'B3AE3FE195464D478A067334284F1595','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (269,'4F27B5C8E6F1401E846B97F95C9AEC90','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (270,'8709E07B1F834618ACDCE59FCE48ED9D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (271,'EE50A28A9CFD47849E7916D55F64E665','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (272,'EF218A7A585E40A395CA3FF4E6D33183','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (273,'A5396088181C434DA505D3DAB598ADBD','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (274,'3701E5D116574349B1AFCDF1A332BC62','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (275,'EF218A7A585E40A395CA3FF4E6D33183','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (276,'F0D220D81F344E16A87ADAA3DCCABCC7','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (277,'48EF89F2995C42148D93DC9160265FB8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (278,'4F27B5C8E6F1401E846B97F95C9AEC90','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (279,'8709E07B1F834618ACDCE59FCE48ED9D','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (280,'EE50A28A9CFD47849E7916D55F64E665','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (281,'A5396088181C434DA505D3DAB598ADBD','30','Anteparo com regulagem de altura. Fixo na mesa',0.00,0,1,50.00,0.00),
 (282,'08BBCFA577AA4148BD9F09F4778C8B14','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (283,'EF218A7A585E40A395CA3FF4E6D33183','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,500.00,0.00),
 (284,'E99A47E2997D425691CDCD4DCC3DD020','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (285,'E99A47E2997D425691CDCD4DCC3DD020','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (286,'BBD423A9DC9C4B239E8A159872E89ADB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (287,'BBD423A9DC9C4B239E8A159872E89ADB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (288,'56D8F1AEA22B43B4959857FEED7A813F','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (289,'08BBCFA577AA4148BD9F09F4778C8B14','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (290,'B5F041A619E6451183EB74C3774F38B0','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (291,'B5F041A619E6451183EB74C3774F38B0','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (292,'72510F9744B54218A8FCA7829F07A7E3','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (293,'72510F9744B54218A8FCA7829F07A7E3','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (294,'E99A47E2997D425691CDCD4DCC3DD020','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (295,'BBD423A9DC9C4B239E8A159872E89ADB','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (296,'56D8F1AEA22B43B4959857FEED7A813F','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (297,'AEA4E67D5F684C8992B00F453D732EF1','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (298,'75A16469C05142BFA2B69DC74FC3F9A0','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (299,'1473743FD3C44C0BA34E21D889FF69C7','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (300,'D21D4CF2B68F4CACAE503D9046257BFD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (301,'D21D4CF2B68F4CACAE503D9046257BFD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (302,'B5F041A619E6451183EB74C3774F38B0','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (303,'72510F9744B54218A8FCA7829F07A7E3','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (304,'AE5B828539FC454699B2920842D792CD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (305,'AE5B828539FC454699B2920842D792CD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (306,'DD0318091403492CA78B30017628E613','43','Prancheta em plástico poliestireno no tamanho 1/2 oficio',0.00,0,2,5.00,0.00),
 (307,'AEA4E67D5F684C8992B00F453D732EF1','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (308,'75A16469C05142BFA2B69DC74FC3F9A0','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (309,'1473743FD3C44C0BA34E21D889FF69C7','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (310,'D21D4CF2B68F4CACAE503D9046257BFD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (311,'217F5EB13713425B8426E3715E0ADBB5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (312,'F5387C6278BE4F20B8BDE179320358EC','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (313,'CB468CD588B9473FBB956BBAD2235C38','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (314,'CB468CD588B9473FBB956BBAD2235C38','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (315,'F5387C6278BE4F20B8BDE179320358EC','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (316,'5754F1D50CC94814900F7669592A289C','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (317,'5754F1D50CC94814900F7669592A289C','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (318,'AD2F51AA1AE740F09649BAAF56962706','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (319,'D234E3A631B74AECAA16BEFB7A78B0A5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (320,'26BD90B60CCF4A8184461FC078B03353','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (321,'DD0318091403492CA78B30017628E613','43','Prancheta em plástico poliestireno no tamanho 1/2 oficio',0.00,0,2,5.00,0.00),
 (322,'26BD90B60CCF4A8184461FC078B03353','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (323,'D234E3A631B74AECAA16BEFB7A78B0A5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (324,'B3AD6DBE89E643A5B379514F967A343F','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (325,'AE5B828539FC454699B2920842D792CD','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (326,'B3AD6DBE89E643A5B379514F967A343F','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (327,'217F5EB13713425B8426E3715E0ADBB5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (328,'88CC310B58A0430BB80250EB577A22F5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (329,'CB468CD588B9473FBB956BBAD2235C38','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (330,'F5387C6278BE4F20B8BDE179320358EC','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (331,'5754F1D50CC94814900F7669592A289C','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (332,'AD2F51AA1AE740F09649BAAF56962706','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (333,'5757E10B8CCE447A8A96E1FE42FF68E8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (334,'BF791F4D6EDE439EA855D4BB8149CC94','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (335,'5757E10B8CCE447A8A96E1FE42FF68E8','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (336,'BF791F4D6EDE439EA855D4BB8149CC94','28','A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar.',0.00,0,1,300.00,0.00),
 (337,'B8031BC7EBC3432BB5A7654C43FE315E','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (338,'B8031BC7EBC3432BB5A7654C43FE315E','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (339,'26BD90B60CCF4A8184461FC078B03353','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (340,'D234E3A631B74AECAA16BEFB7A78B0A5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (341,'A274F36CB85E492AB78457C62B2FDC0A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (342,'B3AD6DBE89E643A5B379514F967A343F','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (343,'88CC310B58A0430BB80250EB577A22F5','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (344,'E3713CBAF9894E858A7BB8C5D857C2F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (345,'E3713CBAF9894E858A7BB8C5D857C2F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (346,'91E9878380BD4F598860E59A0BAEDBB0','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (347,'A274F36CB85E492AB78457C62B2FDC0A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (348,'D7D6C2EDCED14EE2A0EC9D7FBB3B332D','26','A mesa profissional para teste PMK.',0.00,0,1,600.00,0.00),
 (349,'C99CDD3247D64A0C98FBD28C816FBD97','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (350,'C99CDD3247D64A0C98FBD28C816FBD97','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (351,'8F77CC11243B4F25A7A86D63C0F83159','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (352,'8F77CC11243B4F25A7A86D63C0F83159','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (353,'DF4D9E6648EE4BC2B9BA11A2C9E1D504','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (354,'DF4D9E6648EE4BC2B9BA11A2C9E1D504','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (355,'A0F3DF7F9EB34E6BBE97879B445EA177','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (356,'317C03E3A29849608C6FE15ED22BFC73','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (357,'B8031BC7EBC3432BB5A7654C43FE315E','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,600.00,0.00),
 (358,'317C03E3A29849608C6FE15ED22BFC73','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (359,'F47AF759503045238475CE927ABE92B8','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,650.00,0.00),
 (360,'902E30163DE24A6DAD61CC66258DC879','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,550.00,0.00),
 (361,'F47AF759503045238475CE927ABE92B8','31','Mesa PMK Desmontável facil de ser transportada',0.00,0,1,650.00,0.00),
 (362,'902E30163DE24A6DAD61CC66258DC879','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,550.00,0.00),
 (363,'91E9878380BD4F598860E59A0BAEDBB0','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (364,'E3713CBAF9894E858A7BB8C5D857C2F8','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (365,'A274F36CB85E492AB78457C62B2FDC0A','26','A mesa profissional para teste PMK.',0.00,0,1,550.00,0.00),
 (366,'2BE3FD0DA4C34D13AFDB7BBAAF4A8AAB','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,2,550.00,0.00),
 (367,'D7D6C2EDCED14EE2A0EC9D7FBB3B332D','26','A mesa profissional para teste PMK.',0.00,0,1,600.00,0.00),
 (368,'64D0B767F6EF4557A0D8E760B5CAA8A2','26','A mesa profissional para teste PMK.',0.00,0,1,600.00,0.00),
 (369,'C99CDD3247D64A0C98FBD28C816FBD97','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (370,'64D0B767F6EF4557A0D8E760B5CAA8A2','26','A mesa profissional para teste PMK.',0.00,0,1,600.00,0.00),
 (371,'23649BDB39E84795AD2443F670F856D1','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,2,550.00,0.00),
 (372,'23649BDB39E84795AD2443F670F856D1','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,2,550.00,0.00),
 (373,'DF4D9E6648EE4BC2B9BA11A2C9E1D504','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (374,'A0F3DF7F9EB34E6BBE97879B445EA177','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (375,'317C03E3A29849608C6FE15ED22BFC73','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (376,'902E30163DE24A6DAD61CC66258DC879','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,1,550.00,0.00),
 (377,'2BE3FD0DA4C34D13AFDB7BBAAF4A8AAB','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,2,550.00,0.00),
 (378,'8EA2C631C4A44A3785BD223E5C833D69','37','Caneta chaveiro. un',0.00,0,3,4.00,0.00),
 (379,'64D0B767F6EF4557A0D8E760B5CAA8A2','26','A mesa profissional para teste PMK.',0.00,0,1,600.00,0.00),
 (380,'23649BDB39E84795AD2443F670F856D1','27','A mesa profissional para teste PMK sem o anteparo',0.00,0,2,550.00,0.00),
 (381,'3858B39A33154E14AC42D2E7AC29C6E2','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (382,'8EA2C631C4A44A3785BD223E5C833D69','37','Caneta chaveiro. un',0.00,0,3,4.00,0.00),
 (383,'3858B39A33154E14AC42D2E7AC29C6E2','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (384,'2951F6A5CDDE45889FA277E6623348A7','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (385,'6848FDE5AD87461EA3A61B5E42E34C9E','35','Extrator de grampo espátula inóx Central CX 1 UN',0.00,0,6,3.20,0.00),
 (386,'2951F6A5CDDE45889FA277E6623348A7','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (387,'6848FDE5AD87461EA3A61B5E42E34C9E','35','Extrator de grampo espátula inóx Central CX 1 UN',0.00,0,6,3.20,0.00),
 (388,'CA7E93285DAA45E1B5D0C48FEFC084FF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (389,'CA7E93285DAA45E1B5D0C48FEFC084FF','29','Cadeira indicada para o teste.',0.00,0,1,50.00,0.00),
 (390,'64FAF842AD9246CC863AA0312D1D69FF','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (391,'32ABDB7FD7514A5DBD34A6FD319D5473','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (392,'32ABDB7FD7514A5DBD34A6FD319D5473','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (393,'64FAF842AD9246CC863AA0312D1D69FF','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (394,'32ABDB7FD7514A5DBD34A6FD319D5473','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (395,'64FAF842AD9246CC863AA0312D1D69FF','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (396,'19DD1DE401D74BA4BB41CD6F517EBCF9','29','Cadeira indicada para o teste.',0.00,0,2,50.00,0.00),
 (397,'3BA9109E2F8842BDB5A2F291358517F1','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00),
 (398,'3BA9109E2F8842BDB5A2F291358517F1','26','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',0.00,0,1,650.00,0.00);
/*!40000 ALTER TABLE `itens_retorno` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `PRECO_UNIDADE` decimal(10,2) NOT NULL,
  `DESCRICAO` varchar(100) NOT NULL,
  `QTD_ESTOQUE` int(11) NOT NULL,
  `ID_CATEGORIA` int(4) NOT NULL,
  `PESO` int(7) NOT NULL,
  `DESCRICAO_COMPLETA` varchar(1000) NOT NULL,
  `CAMINHO_MINIATURA` varchar(300) NOT NULL,
  `LINK_VIDEO` varchar(1000) DEFAULT NULL,
  `PRECO_INT` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `categoria_produto` (`ID_CATEGORIA`),
  CONSTRAINT `categoria_produto` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`ID`,`NOME`,`PRECO_UNIDADE`,`DESCRICAO`,`QTD_ESTOQUE`,`ID_CATEGORIA`,`PESO`,`DESCRICAO_COMPLETA`,`CAMINHO_MINIATURA`,`LINK_VIDEO`,`PRECO_INT`) VALUES 
 (26,'Mesa PMK - COM ANTEPARO','650.00','Modelo completo: Mesa para teste PMK com anteparo, pé fixo.',40,6,12500,'A mesa profissional para teste PMK, dispõe de inovações que facilitam bem a aplicação do teste. \r\nO sistema de deslizamento para o centro da mesa que deixa a superficie na posição e distância ideal de trabalho. O travamento rápido, fácil e seguro que a mantém na vertical, permitindo a correta realização dos testes, sem a necessidade de deslocar a mesa ou a cadeira.\r\n\r\nO sistema de presilha do papel utilizando o magnetismo é muito prático e seguro uma vez que o ímã magnético não perde a sua energia (força) com o passar dos anos.\r\n\r\nPresilha do papel em 2 modelos: Sistema Super Imã e prendedor tipo Prancheta\r\n\r\nDimensões do produto: 72,0 x 58,5 x 42,5cm (AxLxP)\r\nPeso líquido do produto: 13 kg \r\nGarantia do fornecedor: 6 meses\r\nPRODUTO PATENTIADO','~\\Adm\\Produtos\\ImgsProdutos\\Mesa PMK - COM ANTEPARO_1.jpg','',65000),
 (27,'Mesa PMK - SEM ANTEPARO','600.00','Modelo Simples: Mesa para teste PMK sem o anteparo. Pé fixo.',40,6,12500,'A mesa profissional para teste PMK sem o anteparo, é indicada para quem não utiliza o anteparo fixo e prefere utilizar só os anteparos manuais. \r\nDispõe de inovações que facilitam bem a aplicação do teste como o sistema de deslizamento para o centro da mesa e o travamento rápido, fácil e seguro que a mantém na vertical, permitindo a correta realização dos testes, sem a necessidade de deslocar a mesa ou a cadeira.\r\n\r\nO sistema de presilha do papel utilizando o magnetismo é muito prático e seguro uma vez que o ímã magnético não perde a sua energia (força) com o passar dos anos.\r\n\r\nPresilha do papel em 2 modelos: Sistema Super Imã e prendedor tipo Prancheta\r\n\r\nDimensões do produto: 72,0 x 58,5 x 42,5cm (AxLxP)\r\nPeso líquido do produto: 12,5kg \r\nGarantia do fornecedor: 6 meses\r\nPRODUTO PATENTIADO','~\\Adm\\Produtos\\ImgsProdutos\\Mesa PMK - SEM ANTEPARO_1.jpg','',60000),
 (28,'Mesa Portátil PMK ','360.00','Modelo Mini: Mesa Portátil para aplicação do teste PMK é leve e fácil de carregar. ',22,8,3000,'A Mesa Portátil para aplicação do teste PMK é prática, leve e fácil de carregar. Não tem os pés e nem anteparo, facilmente apoiada sobre a superfície lisa de outra mesa.\r\n\r\nEla dispõe de um travamento que impede que ela desloque sobre a superfície de apoio na hora da realização do teste.\r\n\r\nPresilha do papel: Sistema Super Imã\r\n\r\nNão tem o anteparo.\r\n\r\nDimensões do produto: 5,0 x 47,5 x 42cm (AxLxP)\r\nPeso líquido do produto: 3kg \r\nGarantia do fornecedor: 6 meses\r\n\r\n','~\\Graficos\\ImagemNaoDisponivel.jpg','',36000),
 (29,'Cadeira PMK','50.00','Cadeira indicada para o teste.',250,10,2000,'A cadeira PMK é a indicada pelo CRP para realização do teste por deixar o candidato na postura correta e indicada. Ela possui somente um leve encosto lombar, que leva o candidato a ficar com o tronco em equilibrio.','~\\Adm\\Produtos\\ImgsProdutos\\Cadeira PMK_1.jpg','',5000),
 (30,'Anteparo Anatômico','150.00','Anteparo com regulagem de altura. Fixo na mesa',50,7,500,'Com o anteparo anatômico o profissional pode regular sua altura conforme a estatura do candidato. Fixo na mesa\r\nPRODUTO PATENTIADO. Favor verificar antes se é possível adaptar o anteparo na sua mesa, ele foi projetado para nossos modelos de mesa.\r\nDimensões do produto: \r\nHaste = 47cm, prencha = 47cm x 30cm (AxLxP)\r\nPeso líquido do produto: 0,250kg \r\nItens: 2 Manípulos, 4 arruelas, 01 haste em alumínio, prancha do anteparo fixa em haste de alumínio.\r\nGarantia do fornecedor: 6 meses\r\n \r\nProduto patenteado','~\\Adm\\Produtos\\ImgsProdutos\\Anteparo Anatômico_1.jpg','',15000),
 (31,'Mesa PMK - DESMONTÁVEL','750.00','Modelo Viagem: Mesa para teste PMK totalmente desmontável com anteparo. Facilidade ao ser transporta',18,6,13000,'Característica:\r\nSua principal característica é a facilidade de transporte, uma vez que ela se divide em 4 partes é de fácil instalação e mantem todas as características e medidas determinadas pelo CRP. \r\n\r\nA mesa profissional deslizante para teste PMK, dispõe de inovações que facilitam bem a aplicação do teste como o sistema de deslizamento para o centro da mesa e o travamento rápido, fácil e seguro que a mantém na vertical, permitindo a correta realização dos testes, sem a necessidade de deslocar a mesa ou a cadeira.\r\n\r\nO sistema de presilha do papel utilizando o magnetismo é muito prático e seguro uma vez que o ímã magnético não perde a sua energia (força) com o passar dos anos.\r\n\r\nPresilha do papel em 2 modelos: Sistema Super Imã e prendedor tipo Prancheta\r\n\r\nDimensões do produto: 72,0 x 58,5 x 42,5cm (AxLxP)\r\nPeso líquido do produto: 13kg \r\nGarantia do fornecedor: 6 meses\r\nPRODUTO PATENTIADO','~\\Adm\\Produtos\\ImgsProdutos\\Mesa PMK - DESMONTÁVEL_1.jpg','',75000),
 (32,'Calculadora Eletrônica','6.50','Calculadora eletrônica - un',100,11,100,'Calculadora eletrônica com 8 digitos, display grande, porcentagem, raiz quadrada, memoria.','~\\Adm\\Produtos\\ImgsProdutos\\Calculadora Eletrônica_1.jpg','',650),
 (33,'Cronômetro MJ-2005','15.00','Cronômetro Progressivo MJ-2005 - un',50,11,100,'Cronômetro / Dia, Mês, Dia da Semana / Alarme / Horas / cordinha para segurar, removível.','~\\Adm\\Produtos\\ImgsProdutos\\Cronômetro MJ-2005_1.jpg','',1500),
 (34,'Grampeador Goller  ','7.00','Grampeador Goller, 26/6 - un',89,11,150,'Grampeador prático leve e fácil de usar, grampos no tamanho ideal 26/6. Duas posições para fixação.','~\\Adm\\Produtos\\ImgsProdutos\\Grampeador Goller  _1.jpg','',700),
 (35,'Extrator de Grampo','3.20','Extrator de grampo espátula inóx Central CX 1 UN ',50,11,50,'Extrator de grampo espátula inóx Central CX 1 UN ','~\\Adm\\Produtos\\ImgsProdutos\\Extrator de Grampo_1.jpg','',320),
 (36,'Clips decorativo','5.00','Clips grande decorado - un',300,11,50,'Clips grande decorado com formas diversas e divertidas, dando um charme maior aos seus negocios. tamanho 10cm.','~\\Adm\\Produtos\\ImgsProdutos\\Clips decorativo_1.jpg','',500),
 (37,'Caneta chaveiro','4.00','Caneta chaveiro. un',120,11,50,'A caneta chaveiro tem uma cordinha retratil que mantem a caneta sempre junta a você, diverças cores, Não perca mais tempo tentando lembrar onde você deixou a caneta','~\\Adm\\Produtos\\ImgsProdutos\\Caneta chaveiro_1.jpg','',400),
 (38,'Lápis Preto nº 2','0.60','Lápis preto nº 2 - un',144,11,10,'O Lápis preto nº 2 é para o dia a dia, pontas firmes e madeira de qualidade - LABRA','~\\Adm\\Produtos\\ImgsProdutos\\Lápis Preto nº 2_1.jpg','',60),
 (39,'Prancheta duratex oficio Marcari PT 1 UN','3.15','Prancheta duratex tamanho oficio - un',122,11,50,'Prancheta duratex oficio Marcari PT 1 UN','~\\Adm\\Produtos\\ImgsProdutos\\Prancheta duratex oficio Marcari PT 1 UN_1.jpg','',315),
 (40,'Cola em bastão 10g pritt ','3.50','Cola em bastão pritt - un',50,11,10,'Cola em bastão 10g pritt - unicade','~\\Adm\\Produtos\\ImgsProdutos\\Cola em bastão 10g pritt _1.jpg','',350),
 (41,'Porta Clips','8.40','Porta Clips magnético - un',50,11,50,'Porta clips magnético - unidade','~\\Adm\\Produtos\\ImgsProdutos\\porta Clips_1.jpg','',840),
 (42,'Régua em poliestireno 30 cm cristal ','1.50','Régua em poliestireno 30 cm cristal - un',200,11,2,'Régua em poliestireno 30 cm cristal - un','~\\Adm\\Produtos\\ImgsProdutos\\Régua em poliestireno 30 cm cristal _1.jpg','',150),
 (43,'Prancheta  oficio Acrílico PT 1 UN','5.00','Prancheta em plástico poliestireno no tamanho 1/2 oficio ',54,11,300,'Prancheta em plástico poliestireno no tamanho 1/2 oficio Cristal','~\\Adm\\Produtos\\ImgsProdutos\\Prancheta  oficio Acrílico PT 1 UN_1.jpg','',500),
 (44,'Bolsa para Mesa Desmontável','60.00','Bolsa para o transporte da mesa PMK desmontável',20,6,300,'A bolsa para mesa desmontável foi desenvolvida exclusivante para o transporte da Mesa Desmontável, cada parte da mesa fica em um compartimento protegido.','~\\Adm\\Produtos\\ImgsProdutos\\Bolsa para Mesa Desmontável_1.jpg','',6000);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `retorno`
--

DROP TABLE IF EXISTS `retorno`;
CREATE TABLE `retorno` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `TransacaoID` varchar(50) DEFAULT NULL,
  `DataUltimaAtualizacao` datetime DEFAULT NULL,
  `DataTransacao` datetime DEFAULT NULL,
  `CliNome` varchar(100) DEFAULT NULL,
  `Referencia` varchar(255) DEFAULT NULL,
  `TipoFrete` varchar(20) DEFAULT NULL,
  `Anotacao` varchar(250) DEFAULT NULL,
  `TipoPagamento` varchar(30) DEFAULT NULL,
  `StatusTransacao` varchar(30) DEFAULT NULL,
  `CliEmail` varchar(255) DEFAULT NULL,
  `CliEndereco` varchar(200) DEFAULT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) DEFAULT NULL,
  `CliCidade` varchar(100) DEFAULT NULL,
  `CliEstado` varchar(20) DEFAULT NULL,
  `CliCEP` varchar(10) DEFAULT NULL,
  `CliTelefone` varchar(16) DEFAULT NULL,
  `ValorFrete` float(10,2) DEFAULT NULL,
  `VendedorEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retorno`
--

/*!40000 ALTER TABLE `retorno` DISABLE KEYS */;
INSERT INTO `retorno` (`id`,`TransacaoID`,`DataUltimaAtualizacao`,`DataTransacao`,`CliNome`,`Referencia`,`TipoFrete`,`Anotacao`,`TipoPagamento`,`StatusTransacao`,`CliEmail`,`CliEndereco`,`CliNumero`,`CliComplemento`,`CliBairro`,`CliCidade`,`CliEstado`,`CliCEP`,`CliTelefone`,`ValorFrete`,`VendedorEmail`) VALUES 
 (28,'4C597589503B4B6E9A193DFAA58A9787','2011-02-18 01:45:26','2011-02-18 01:45:16','cristian candido de oliveira gomes','','PAC',NULL,'Boleto','AguardandoPagamento','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',13.40,'mesapmk@gmail.com'),
 (29,'CDC570A804534677A280E50DC399D61B','2011-02-22 02:23:47','2011-02-22 02:23:32','cristian candido de oliveira gomes','','Fixo',NULL,'Boleto','AguardandoPagamento','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',0.00,'mesapmk@gmail.com'),
 (30,'014711E4AD044475B556CC11D2591E34','2011-03-04 06:15:11','2011-02-18 00:01:42','cristian candido de oliveira gomes','','PAC',NULL,'Boleto','Cancelada','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',8.20,'mesapmk@gmail.com'),
 (31,'E9445063DAFF41BAA11D9AA460164402','2011-03-04 06:16:37','2011-02-18 01:17:26','cristian candido de oliveira gomes','','PAC',NULL,'Boleto','Cancelada','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',10.50,'mesapmk@gmail.com'),
 (32,'4C597589503B4B6E9A193DFAA58A9787','2011-03-04 06:16:56','2011-02-18 01:45:16','cristian candido de oliveira gomes','','PAC',NULL,'Boleto','Cancelada','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',13.40,'mesapmk@gmail.com'),
 (33,'CDC570A804534677A280E50DC399D61B','2011-03-08 06:17:05','2011-02-22 02:23:32','cristian candido de oliveira gomes','','Fixo',NULL,'Boleto','Cancelada','cristian@consuti.net','RUA PLANICIE','84','','Serrano','BELO HORIZONTE','MG','30882120','35643922',0.00,'mesapmk@gmail.com'),
 (34,'B594B0767B49460FACD73404C83E2A17','2011-03-26 16:59:33','2011-03-26 16:54:45','karoline Giele Martins de Aguiar','','Fixo',NULL,'CartaoCredito','EmAnalise','karol.giele@hotmail.com','RUA SERGIPE','81','','Três Poderes','IMPERATRIZ','MA','65903000','91665799',0.00,'mesapmk@gmail.com'),
 (35,'B594B0767B49460FACD73404C83E2A17','2011-03-27 12:20:12','2011-03-26 16:54:45','karoline Giele Martins de Aguiar','','Fixo',NULL,'CartaoCredito','Cancelada','karol.giele@hotmail.com','RUA SERGIPE','81','','Três Poderes','IMPERATRIZ','MA','65903000','91665799',0.00,'mesapmk@gmail.com'),
 (36,'2BD00A83999B4EFCA71FE7C7EABF5EB2','2011-03-31 14:50:02','2011-03-31 14:41:51','FABIANA PEREIRA MAIA','','Fixo',NULL,'CartaoCredito','EmAnalise','fabianapmaia@gmail.com','QUADRA C 3','lote 01','Apto 711','Taguatinga Centro','TAGUATINGA','DF','72010030','92683272',0.00,'mesapmk@gmail.com'),
 (37,'2BD00A83999B4EFCA71FE7C7EABF5EB2','2011-03-31 17:17:43','2011-03-31 14:41:51','FABIANA PEREIRA MAIA','','Fixo',NULL,'CartaoCredito','Aprovada','fabianapmaia@gmail.com','QUADRA C 3','lote 01','Apto 711','Taguatinga Centro','TAGUATINGA','DF','72010030','92683272',0.00,'mesapmk@gmail.com'),
 (38,'5D944DBD1E2A46B190DE031B72710216','2011-04-05 09:32:26','2011-04-05 09:12:29','Lisandra Pinho Gomes Campos','','Fixo',NULL,'CartaoCredito','EmAnalise','lisandrapg@hotmail.com','AVENIDA GENERAL FLORES DA CUNHA','1320','sala 811','Vila Imbui','CACHOEIRINHA','RS','94910002','84443883',0.00,'mesapmk@gmail.com'),
 (39,'5D944DBD1E2A46B190DE031B72710216','2011-04-05 11:25:50','2011-04-05 09:12:29','Lisandra Pinho Gomes Campos','','Fixo',NULL,'CartaoCredito','Aprovada','lisandrapg@hotmail.com','AVENIDA GENERAL FLORES DA CUNHA','1320','sala 811','Vila Imbui','CACHOEIRINHA','RS','94910002','84443883',0.00,'mesapmk@gmail.com'),
 (40,'47533CD298E2413BB8634DAB35EA2770','2011-04-06 10:21:26','2011-04-06 10:15:43','CICERA ELIZANGELA BESERRA CAVALCANTE','','Fixo',NULL,'CartaoCredito','EmAnalise','italoelizangela@hotmail.com','RUA DELMIRO DE FARIAS','96','','Jardim América','FORTALEZA','CE','60416030','30910862',0.00,'mesapmk@gmail.com'),
 (41,'47533CD298E2413BB8634DAB35EA2770','2011-04-06 13:09:52','2011-04-06 10:15:43','CICERA ELIZANGELA BESERRA CAVALCANTE','','Fixo',NULL,'CartaoCredito','Cancelada','italoelizangela@hotmail.com','RUA DELMIRO DE FARIAS','96','','Jardim América','FORTALEZA','CE','60416030','30910862',0.00,'mesapmk@gmail.com'),
 (42,'16059564238C4E538C67AC5A55881C9A','2011-04-06 18:07:09','2011-04-06 18:06:11','CICERA ELIZANGELA BESERRA CAVALCANTE','','Fixo',NULL,'CartaoCredito','EmAnalise','italoelizangela@hotmail.com','RUA DELMIRO DE FARIAS','596','','Jardim América','FORTALEZA','CE','60416030','30910862',0.00,'mesapmk@gmail.com'),
 (43,'16059564238C4E538C67AC5A55881C9A','2011-04-07 06:17:23','2011-04-06 18:06:11','CICERA ELIZANGELA BESERRA CAVALCANTE','','Fixo',NULL,'CartaoCredito','Aprovada','italoelizangela@hotmail.com','RUA DELMIRO DE FARIAS','596','','Jardim América','FORTALEZA','CE','60416030','30910862',0.00,'mesapmk@gmail.com'),
 (44,'7B9E8225E9E844A889B5033AAFADA94D','2011-04-13 17:54:51','2011-04-13 17:54:18','Andreia Cordeiro santana de Almeida','','Fixo',NULL,'Boleto','AguardandoPagamento','andreiacordeirofsa@hotmail.com','av. Getúlio Vargas sala 110','330','','centro','Feira de Santana','BA','44149999','81655290',0.00,'mesapmk@gmail.com'),
 (45,'6088AAF652A548C7AFD7B42307A9DA67','2011-04-13 18:06:16','2011-04-13 18:02:25','Andreia Cordeiro Santana de Almeida','','Fixo',NULL,'CartaoCredito','EmAnalise','andreiacordeirofsa@hotmail.com','av. getúlio vargas','330','sl 28','centro','Feira de Santana','BA','44149999','81655260',0.00,'mesapmk@gmail.com'),
 (46,'6088AAF652A548C7AFD7B42307A9DA67','2011-04-14 06:10:57','2011-04-13 18:02:25','Andreia Cordeiro Santana de Almeida','','Fixo',NULL,'CartaoCredito','Aprovada','andreiacordeirofsa@hotmail.com','av. getúlio vargas','330','sl 28','centro','Feira de Santana','BA','44149999','81655260',0.00,'mesapmk@gmail.com'),
 (47,'BAB5F4E869D940C6BE2F7B7A41DEF0AE','2011-04-14 08:58:25','2011-04-14 08:57:47','ROSANA RIGO DIAS','','Fixo',NULL,'Boleto','AguardandoPagamento','rosana.dias@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (48,'917E94F5DA744E02BEFD57D2A917B3BF','2011-04-14 09:31:08','2011-04-14 09:00:54','ATTILE GUSTAVO LOURETT ROSSETTO','','Fixo',NULL,'Boleto','AguardandoPagamento','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (49,'6CFE4F3DBB7A478D93D2BF6354A52F1D','2011-04-14 11:58:07','2011-04-14 11:57:29','MB COMERCIO IMPOR E EXP LTDA','','Fixo',NULL,'Boleto','AguardandoPagamento','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (50,'FF9490009E1042248C20BBDFBBCF6DAC','2011-04-14 12:05:21','2011-04-14 12:05:10','MB COMERCIO IMP EXP LTDA','','Fixo',NULL,'Boleto','AguardandoPagamento','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','MB5 COM. IMP. EXP. LTDA, KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (51,'2BD00A83999B4EFCA71FE7C7EABF5EB2','2011-04-14 17:27:17','2011-03-31 14:41:51','FABIANA PEREIRA MAIA','','Fixo',NULL,'CartaoCredito','Completa','fabianapmaia@gmail.com','QUADRA C 3','lote 01','Apto 711','Taguatinga Centro','TAGUATINGA','DF','72010030','92683272',0.00,'mesapmk@gmail.com'),
 (52,'FF9490009E1042248C20BBDFBBCF6DAC','2011-04-15 07:23:17','2011-04-14 12:05:10','MB COMERCIO IMP EXP LTDA','','Fixo',NULL,'Boleto','Aprovada','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','MB5 COM. IMP. EXP. LTDA, KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (53,'5D944DBD1E2A46B190DE031B72710216','2011-04-19 11:29:17','2011-04-05 09:12:29','Lisandra Pinho Gomes Campos','','Fixo',NULL,'CartaoCredito','Completa','lisandrapg@hotmail.com','AVENIDA GENERAL FLORES DA CUNHA','1320','sala 811','Vila Imbui','CACHOEIRINHA','RS','94910002','84443883',0.00,'mesapmk@gmail.com'),
 (54,'16059564238C4E538C67AC5A55881C9A','2011-04-21 06:27:11','2011-04-06 18:06:11','CICERA ELIZANGELA BESERRA CAVALCANTE','','Fixo',NULL,'CartaoCredito','Completa','italoelizangela@hotmail.com','RUA DELMIRO DE FARIAS','596','','Jardim América','FORTALEZA','CE','60416030','30910862',0.00,'mesapmk@gmail.com'),
 (55,'8ECC62081558459D96128A64CC4ACFDD','2011-04-24 14:30:19','2011-04-24 14:27:57','Karoline Giele Martins de Aguiar','','Fixo',NULL,'CartaoCredito','Aprovada','karol.giele@hotmail.com','RUA SERGIPE','81','','Três Poderes','IMPERATRIZ','MA','65903000','91665799',0.00,'mesapmk@gmail.com'),
 (56,'1FBDC9DC5C5540578581E8E6DE69B6FC','2011-04-24 14:37:43','2011-04-24 14:21:19','Aryanne Freitas','','Fixo',NULL,'CartaoCredito','Cancelada','aryannefrei@yahoo.com.br','RUA DOUTOR AGENOR DE CARVALHO','1745','','Agenor de Carvalho','PORTO VELHO','RO','76820377','32227244',0.00,'mesapmk@gmail.com'),
 (57,'0419DE9307504654864613EFE30632A7','2011-04-25 16:56:55','2011-04-25 16:52:52','Usciara Moreira Teles','','Fixo',NULL,'CartaoCredito','EmAnalise','usciara.teles@gmail.com','QUADRA QE 4','ap 302','bloco A5','Guará I','GUARA','DF','71010005','81752026',0.00,'mesapmk@gmail.com'),
 (58,'0419DE9307504654864613EFE30632A7','2011-04-26 02:12:56','2011-04-25 16:52:52','Usciara Moreira Teles','','Fixo',NULL,'CartaoCredito','Aprovada','usciara.teles@gmail.com','QUADRA QE 4','ap 302','bloco A5','Guará I','GUARA','DF','71010005','81752026',0.00,'mesapmk@gmail.com'),
 (59,'440EC985719646E0B77C619353ADF84D','2011-04-26 17:47:46','2011-04-26 17:43:19','S A SERVIÇOS TEMPORARIOS SA','','Fixo',NULL,'CartaoCredito','EmAnalise','isabelrosa@strategicadvanced.com.br','RUA C','263','','CIDADE NOVA','PARAUAPEBAS','PA','68515000','81378581',0.00,'mesapmk@gmail.com'),
 (60,'BF84E6768EFF4ABE968F5523985E21F8','2011-04-26 17:57:06','2011-04-26 17:56:26','S A SERVIÇOS TEMPORARIOS S A','','Fixo',NULL,'Boleto','AguardandoPagamento','isabelrosa@strategicadvanced.com.br','RODOVIA JOSE CARLOS DAUX','8600','Sala 04 bloco 04','Santo Antônio de Lisboa','FLORIANOPOLIS','SC','88050001','81378581',0.00,'mesapmk@gmail.com'),
 (61,'440EC985719646E0B77C619353ADF84D','2011-04-27 03:26:12','2011-04-26 17:43:19','S A SERVIÇOS TEMPORARIOS SA','','Fixo',NULL,'CartaoCredito','Aprovada','isabelrosa@strategicadvanced.com.br','RUA C','263','','CIDADE NOVA','PARAUAPEBAS','PA','68515000','81378581',0.00,'mesapmk@gmail.com'),
 (62,'7B9E8225E9E844A889B5033AAFADA94D','2011-04-27 06:45:35','2011-04-13 17:54:18','Andreia Cordeiro santana de Almeida','','Fixo',NULL,'Boleto','Cancelada','andreiacordeirofsa@hotmail.com','av. Getúlio Vargas sala 110','330','','centro','Feira de Santana','BA','44149999','81655290',0.00,'mesapmk@gmail.com'),
 (63,'BF84E6768EFF4ABE968F5523985E21F8','2011-04-28 04:38:46','2011-04-26 17:56:26','S A SERVIÇOS TEMPORARIOS S A','','Fixo',NULL,'Boleto','Aprovada','isabelrosa@strategicadvanced.com.br','RODOVIA JOSE CARLOS DAUX','8600','Sala 04 bloco 04','Santo Antônio de Lisboa','FLORIANOPOLIS','SC','88050001','81378581',0.00,'mesapmk@gmail.com'),
 (64,'6088AAF652A548C7AFD7B42307A9DA67','2011-04-28 06:17:08','2011-04-13 18:02:25','Andreia Cordeiro Santana de Almeida','','Fixo',NULL,'CartaoCredito','Completa','andreiacordeirofsa@hotmail.com','av. getúlio vargas','330','sl 28','centro','Feira de Santana','BA','44149999','81655260',0.00,'mesapmk@gmail.com'),
 (65,'BAB5F4E869D940C6BE2F7B7A41DEF0AE','2011-04-28 06:20:38','2011-04-14 08:57:47','ROSANA RIGO DIAS','','Fixo',NULL,'Boleto','Cancelada','rosana.dias@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (66,'917E94F5DA744E02BEFD57D2A917B3BF','2011-04-28 06:21:53','2011-04-14 09:00:54','ATTILE GUSTAVO LOURETT ROSSETTO','','Fixo',NULL,'Boleto','Cancelada','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (67,'6CFE4F3DBB7A478D93D2BF6354A52F1D','2011-04-28 06:29:30','2011-04-14 11:57:29','MB COMERCIO IMPOR E EXP LTDA','','Fixo',NULL,'Boleto','Cancelada','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (68,'33E966A539AD4C7487D1EDAC3D0650FC','2011-04-28 16:27:33','2011-04-28 16:25:41','Aryanne Freitas','','Fixo',NULL,'CartaoCredito','EmAnalise','aryannefrei@yahoo.com.br','RUA DOUTOR AGENOR DE CARVALHO','1745','','Agenor de Carvalho','PORTO VELHO','RO','76820377','32227244',0.00,'mesapmk@gmail.com'),
 (69,'33E966A539AD4C7487D1EDAC3D0650FC','2011-04-28 22:06:54','2011-04-28 16:25:41','Aryanne Freitas','','Fixo',NULL,'CartaoCredito','Aprovada','aryannefrei@yahoo.com.br','RUA DOUTOR AGENOR DE CARVALHO','1745','','Agenor de Carvalho','PORTO VELHO','RO','76820377','32227244',0.00,'mesapmk@gmail.com'),
 (70,'FF9490009E1042248C20BBDFBBCF6DAC','2011-04-29 07:29:45','2011-04-14 12:05:10','MB COMERCIO IMP EXP LTDA','','Fixo',NULL,'Boleto','Completa','attile.rossetto@gruposoares.com.br','AVENIDA TALMA RODRIGUES RIBEIRO','S/N','MB5 COM. IMP. EXP. LTDA, KM 1,5 BOX 17','CIVIT II','SERRA','ES','29168080','21219000',0.00,'mesapmk@gmail.com'),
 (71,'8ECC62081558459D96128A64CC4ACFDD','2011-05-08 14:37:19','2011-04-24 14:27:57','Karoline Giele Martins de Aguiar','','Fixo',NULL,'CartaoCredito','Completa','karol.giele@hotmail.com','RUA SERGIPE','81','','Três Poderes','IMPERATRIZ','MA','65903000','91665799',0.00,'mesapmk@gmail.com'),
 (72,'0419DE9307504654864613EFE30632A7','2011-05-10 02:17:16','2011-04-25 16:52:52','Usciara Moreira Teles','','Fixo',NULL,'CartaoCredito','Completa','usciara.teles@gmail.com','QUADRA QE 4','ap 302','bloco A5','Guará I','GUARA','DF','71010005','81752026',0.00,'mesapmk@gmail.com'),
 (73,'459B296C18654E91A7A0C17F2C5CF1DF','2011-05-10 18:38:19','2011-05-10 18:36:51','Roberta Calegari Fernandes','','Fixo',NULL,'Boleto','AguardandoPagamento','calegari.fernandes@gmail.com','RUA DALILA LOPES COSTA','108','b 6 ap 3','Uberaba','CURITIBA','PR','81550380','34342967',0.00,'mesapmk@gmail.com'),
 (74,'440EC985719646E0B77C619353ADF84D','2011-05-11 03:31:21','2011-04-26 17:43:19','S A SERVIÇOS TEMPORARIOS SA','','Fixo',NULL,'CartaoCredito','Completa','isabelrosa@strategicadvanced.com.br','RUA C','263','','CIDADE NOVA','PARAUAPEBAS','PA','68515000','81378581',0.00,'mesapmk@gmail.com'),
 (75,'BF84E6768EFF4ABE968F5523985E21F8','2011-05-12 04:48:43','2011-04-26 17:56:26','S A SERVIÇOS TEMPORARIOS S A','','Fixo',NULL,'Boleto','Completa','isabelrosa@strategicadvanced.com.br','RODOVIA JOSE CARLOS DAUX','8600','Sala 04 bloco 04','Santo Antônio de Lisboa','FLORIANOPOLIS','SC','88050001','81378581',0.00,'mesapmk@gmail.com'),
 (76,'33E966A539AD4C7487D1EDAC3D0650FC','2011-05-12 22:08:17','2011-04-28 16:25:41','Aryanne Freitas','','Fixo',NULL,'CartaoCredito','Completa','aryannefrei@yahoo.com.br','RUA DOUTOR AGENOR DE CARVALHO','1745','','Agenor de Carvalho','PORTO VELHO','RO','76820377','32227244',0.00,'mesapmk@gmail.com'),
 (77,'51734FF3CFD149E9B2EBD401F85AD745','2011-05-13 13:04:06','2011-05-13 12:59:09','Elienai Braga de Oliveira','','Fixo',NULL,'CartaoCredito','EmAnalise','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (78,'F2CB21696E0E43A8B7CD7D2979201746','2011-05-13 16:20:06','2011-05-13 16:16:39','Elienai Braga Oliveira Brandao','','Fixo',NULL,'CartaoCredito','EmAnalise','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (79,'F2CB21696E0E43A8B7CD7D2979201746','2011-05-13 17:11:27','2011-05-13 16:16:39','Elienai Braga Oliveira Brandao','','Fixo',NULL,'CartaoCredito','Aprovada','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (80,'51734FF3CFD149E9B2EBD401F85AD745','2011-05-13 18:21:23','2011-05-13 12:59:09','Elienai Braga de Oliveira','','Fixo',NULL,'CartaoCredito','Aprovada','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (81,'D5F59FF760DB4463ABC7768762D1CB61','2011-05-17 10:19:28','2011-05-17 10:02:13','Quallis Consultoria e Treinamento Ltda','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','migigliola@gmail.com','Rua da Conferência','16A','','Centro','CARBONITA','MG','39665000','35261287',0.00,'mesapmk@gmail.com'),
 (82,'D5F59FF760DB4463ABC7768762D1CB61','2011-05-17 18:19:26','2011-05-17 10:02:13','Quallis Consultoria e Treinamento Ltda','','Fixo',NULL,'TransferenciaOnline','Cancelada','migigliola@gmail.com','Rua da Conferência','16A','','Centro','CARBONITA','MG','39665000','35261287',0.00,'mesapmk@gmail.com'),
 (83,'459B296C18654E91A7A0C17F2C5CF1DF','2011-05-24 06:54:10','2011-05-10 18:36:51','Roberta Calegari Fernandes','','Fixo',NULL,'Boleto','Cancelada','calegari.fernandes@gmail.com','RUA DALILA LOPES COSTA','108','b 6 ap 3','Uberaba','CURITIBA','PR','81550380','34342967',0.00,'mesapmk@gmail.com'),
 (84,'BA068787F9E64342B84154DF786C89EE','2011-05-26 15:35:15','2011-05-26 15:34:02','Valeska Koch Moreira','','Fixo',NULL,'Boleto','AguardandoPagamento','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (85,'058D442522F2459B8121295CBAC50BA1','2011-05-26 15:40:10','2011-05-26 15:37:51','Valeska Koch Moreira','','Fixo',NULL,'CartaoCredito','Cancelada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (86,'EED222D3AF314E85A55A361EC71AAE7A','2011-05-26 15:42:52','2011-05-26 15:42:28','Valeska Koch Moreira','','Fixo',NULL,'Boleto','AguardandoPagamento','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (87,'ACD9CB754F604B0AA1ECA00E7E854293','2011-05-26 15:50:48','2011-05-26 15:45:46','Valeska Koch Moreira','','Fixo',NULL,'CartaoCredito','Cancelada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (88,'6011C62039C7492D87FD4C33DA55F14D','2011-05-26 15:56:04','2011-05-26 15:55:52','Valeska Koch Moreira','','Fixo',NULL,'Boleto','AguardandoPagamento','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (89,'D84EDC678F7443718243A8B706AE8F78','2011-05-26 15:58:17','2011-05-26 15:58:07','Valeskam Koch Moreira','','Fixo',NULL,'Boleto','AguardandoPagamento','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (90,'BA068787F9E64342B84154DF786C89EE','2011-05-26 23:42:06','2011-05-26 15:34:02','Valeska Koch Moreira','','Fixo',NULL,'Boleto','Cancelada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (91,'F2CB21696E0E43A8B7CD7D2979201746','2011-05-27 17:17:54','2011-05-13 16:16:39','Elienai Braga Oliveira Brandao','','Fixo',NULL,'CartaoCredito','Completa','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (92,'51734FF3CFD149E9B2EBD401F85AD745','2011-05-27 18:27:43','2011-05-13 12:59:09','Elienai Braga de Oliveira','','Fixo',NULL,'CartaoCredito','Completa','clinicacatarse@hotmail.com','TRAVESSA DA CONQUISTA','84','','Centro','VITORIA DA CONQUISTA','BA','45000680','34214872',0.00,'mesapmk@gmail.com'),
 (93,'EED222D3AF314E85A55A361EC71AAE7A','2011-05-31 06:09:42','2011-05-26 15:42:28','Valeska Koch Moreira','','Fixo',NULL,'Boleto','Aprovada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (94,'D84EDC678F7443718243A8B706AE8F78','2011-05-31 06:09:48','2011-05-26 15:58:07','Valeskam Koch Moreira','','Fixo',NULL,'Boleto','Aprovada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (95,'21561D7659C644F5940DBFD060B5CC35','2011-05-31 09:43:09','2011-05-31 09:37:02','instituto de psicologia medica de mato grosso ltda','','Fixo',NULL,'Boleto','AguardandoPagamento','ipmat@uol.com.br','AVENIDA MATO GROSSO','759','','Centro','CAMPO GRANDE','MS','79002231','33823631',0.00,'mesapmk@gmail.com'),
 (96,'D69494A8152C4DE8936A94EAB7C0BF65','2011-05-31 09:48:03','2011-05-31 09:47:39','instituto de psicologia medica de mato grosso ltda','','Fixo',NULL,'Boleto','AguardandoPagamento','ipmat@uol.com.br','AVENIDA MATO GROSSO','759','','Centro','CAMPO GRANDE','MS','79002231','33823631',0.00,'mesapmk@gmail.com'),
 (97,'AC8D3786F03A48B3AD3AA7E0C3FB808A','2011-06-03 13:03:33','2011-06-03 13:01:06','Luciola Modesto Rosa','','Fixo',NULL,'Boleto','AguardandoPagamento','luciola_rosa@ig.com.br','RUA EPINAL','33','','Conceição','ITABUNA','BA','45605335','81591996',0.00,'mesapmk@gmail.com'),
 (98,'D69494A8152C4DE8936A94EAB7C0BF65','2011-06-04 06:25:43','2011-05-31 09:47:39','instituto de psicologia medica de mato grosso ltda','','Fixo',NULL,'Boleto','Aprovada','ipmat@uol.com.br','AVENIDA MATO GROSSO','759','','Centro','CAMPO GRANDE','MS','79002231','33823631',0.00,'mesapmk@gmail.com'),
 (99,'AC8D3786F03A48B3AD3AA7E0C3FB808A','2011-06-07 07:13:08','2011-06-03 13:01:06','Luciola Modesto Rosa','','Fixo',NULL,'Boleto','Aprovada','luciola_rosa@ig.com.br','RUA EPINAL','33','','Conceição','ITABUNA','BA','45605335','81591996',0.00,'mesapmk@gmail.com'),
 (100,'6011C62039C7492D87FD4C33DA55F14D','2011-06-09 06:41:59','2011-05-26 15:55:52','Valeska Koch Moreira','','Fixo',NULL,'Boleto','Cancelada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (101,'EED222D3AF314E85A55A361EC71AAE7A','2011-06-14 06:20:02','2011-05-26 15:42:28','Valeska Koch Moreira','','Fixo',NULL,'Boleto','Completa','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (102,'D84EDC678F7443718243A8B706AE8F78','2011-06-14 06:20:06','2011-05-26 15:58:07','Valeskam Koch Moreira','','Fixo',NULL,'Boleto','Completa','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (103,'21561D7659C644F5940DBFD060B5CC35','2011-06-14 06:25:02','2011-05-31 09:37:02','instituto de psicologia medica de mato grosso ltda','','Fixo',NULL,'Boleto','Cancelada','ipmat@uol.com.br','AVENIDA MATO GROSSO','759','','Centro','CAMPO GRANDE','MS','79002231','33823631',0.00,'mesapmk@gmail.com'),
 (104,'6011C62039C7492D87FD4C33DA55F14D','2011-06-15 10:42:53','2011-05-26 15:55:52','Valeska Koch Moreira','','Fixo',NULL,'Boleto','Cancelada','vkochonline@gmail.com','RUA MANUEL ANTONIO DE ALMEIDA','61','','Canindé','SAO PAULO','SP','03033070','83511396',0.00,'mesapmk@gmail.com'),
 (105,'D69494A8152C4DE8936A94EAB7C0BF65','2011-06-18 06:31:22','2011-05-31 09:47:39','instituto de psicologia medica de mato grosso ltda','','Fixo',NULL,'Boleto','Completa','ipmat@uol.com.br','AVENIDA MATO GROSSO','759','','Centro','CAMPO GRANDE','MS','79002231','33823631',0.00,'mesapmk@gmail.com'),
 (106,'AC8D3786F03A48B3AD3AA7E0C3FB808A','2011-06-21 07:19:53','2011-06-03 13:01:06','Luciola Modesto Rosa','','Fixo',NULL,'Boleto','Completa','luciola_rosa@ig.com.br','RUA EPINAL','33','','Conceição','ITABUNA','BA','45605335','81591996',0.00,'mesapmk@gmail.com'),
 (107,'295E037636FB438FB864CC058AA9B2FF','2011-06-29 12:15:33','2011-06-29 12:12:57','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','EmAnalise','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','36431025',0.00,'mesapmk@gmail.com'),
 (108,'295E037636FB438FB864CC058AA9B2FF','2011-06-29 19:03:53','2011-06-29 12:12:57','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','Cancelada','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','36431025',0.00,'mesapmk@gmail.com'),
 (109,'9E80462053A040B3945665654CFA1E69','2011-06-30 11:49:29','2011-06-30 11:48:14','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','EmAnalise','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','35228406',0.00,'mesapmk@gmail.com'),
 (110,'9E80462053A040B3945665654CFA1E69','2011-06-30 19:41:17','2011-06-30 11:48:14','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','Cancelada','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','35228406',0.00,'mesapmk@gmail.com'),
 (111,'B8EA153836804644A839073D053BE95B','2011-07-03 12:37:57','2011-07-03 12:35:34','Marcia Cristina Santos','','Fixo',NULL,'Boleto','AguardandoPagamento','marciasantosp1@hotmail.com','Ladeira São francisco','120','','Boa Viagem','ITABIRITO','MG','35450000','35617950',0.00,'mesapmk@gmail.com'),
 (112,'21AB11E3F05C4C08B377FC2AA4BEF854','2011-07-05 14:47:31','2011-07-05 14:46:02','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','EmAnalise','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','35228406',0.00,'mesapmk@gmail.com'),
 (113,'21AB11E3F05C4C08B377FC2AA4BEF854','2011-07-05 19:24:04','2011-07-05 14:46:02','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','Aprovada','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','35228406',0.00,'mesapmk@gmail.com'),
 (114,'B8EA153836804644A839073D053BE95B','2011-07-17 06:24:07','2011-07-03 12:35:34','Marcia Cristina Santos','','Fixo',NULL,'Boleto','Cancelada','marciasantosp1@hotmail.com','Ladeira São francisco','120','','Boa Viagem','ITABIRITO','MG','35450000','35617950',0.00,'mesapmk@gmail.com'),
 (115,'148D9613D2C1441D814A7F66BC2A447E','2011-07-19 14:19:17','2011-07-19 14:16:50','Adriana Lemos.','','Fixo',NULL,'Boleto','AguardandoPagamento','adrianaoliveirapsilemos@gmail.com','PRACA MANTIQUEIRA 35 - AC XEREM','cx postal ','','Parque Xerém','DUQUE DE CAXIAS','RJ','25245970','21265449',0.00,'mesapmk@gmail.com'),
 (116,'21AB11E3F05C4C08B377FC2AA4BEF854','2011-07-19 19:28:29','2011-07-05 14:46:02','Maria Aparecida Ida Escóssio da Silva Borges','','Fixo',NULL,'CartaoCredito','Completa','bia083@msn.com','RUA DOUTOR JOAQUIM BELO DO AMORIM','141','casa','Jardim Cristina','PINDAMONHANGABA','SP','12412090','35228406',0.00,'mesapmk@gmail.com'),
 (117,'CE7C58B62D664D4AA3E094F2CEEDD848','2011-07-20 10:01:14','2011-07-20 09:57:24','Diogo Rivera','','Fixo',NULL,'Boleto','AguardandoPagamento','ayrtesmpr@uol.com.br','RUA LOS ANGELES','10','Quadra 17','Jardim Califórnia','CUIABA','MT','78070400','0',0.00,'mesapmk@gmail.com'),
 (118,'6F55E3F8A4E249338662D8543031D3D6','2011-07-20 17:26:38','2011-07-20 17:21:27','Isabela Bulgarelli Tonioli','','Fixo',NULL,'CartaoCredito','Aprovada','ibtonioli@hotmail.com','Rua Capitão Silva Borges','260','','Centro','AGUAI','SP','13860000','36522732',0.00,'mesapmk@gmail.com'),
 (119,'CE7C58B62D664D4AA3E094F2CEEDD848','2011-07-21 06:29:33','2011-07-20 09:57:24','Diogo Rivera','','Fixo',NULL,'Boleto','Aprovada','ayrtesmpr@uol.com.br','RUA LOS ANGELES','10','Quadra 17','Jardim Califórnia','CUIABA','MT','78070400','0',0.00,'mesapmk@gmail.com'),
 (120,'148D9613D2C1441D814A7F66BC2A447E','2011-07-23 05:46:53','2011-07-19 14:16:50','Adriana Lemos.','','Fixo',NULL,'Boleto','Aprovada','adrianaoliveirapsilemos@gmail.com','PRACA MANTIQUEIRA 35 - AC XEREM','cx postal ','','Parque Xerém','DUQUE DE CAXIAS','RJ','25245970','21265449',0.00,'mesapmk@gmail.com'),
 (121,'83911A5137AD4BEEABB84DF3634A573A','2011-07-26 19:57:52','2011-07-26 19:51:15','Antonio Edson Souza Meira Júnior','','Fixo',NULL,'CartaoCredito','EmAnalise','jrmeiramed@yahoo.com.br','RUA DA GRAVIOLA','332','apt 501','Caminho das Árvores','SALVADOR','BA','41820360','99776232',0.00,'mesapmk@gmail.com'),
 (122,'83911A5137AD4BEEABB84DF3634A573A','2011-07-27 19:59:45','2011-07-26 19:51:15','Antonio Edson Souza Meira Júnior','','Fixo',NULL,'CartaoCredito','Aprovada','jrmeiramed@yahoo.com.br','RUA DA GRAVIOLA','332','apt 501','Caminho das Árvores','SALVADOR','BA','41820360','99776232',0.00,'mesapmk@gmail.com'),
 (123,'6F55E3F8A4E249338662D8543031D3D6','2011-08-03 17:29:36','2011-07-20 17:21:27','Isabela Bulgarelli Tonioli','','Fixo',NULL,'CartaoCredito','Completa','ibtonioli@hotmail.com','Rua Capitão Silva Borges','260','','Centro','AGUAI','SP','13860000','36522732',0.00,'mesapmk@gmail.com'),
 (124,'CE7C58B62D664D4AA3E094F2CEEDD848','2011-08-04 06:38:11','2011-07-20 09:57:24','Diogo Rivera','','Fixo',NULL,'Boleto','Completa','ayrtesmpr@uol.com.br','RUA LOS ANGELES','10','Quadra 17','Jardim Califórnia','CUIABA','MT','78070400','0',0.00,'mesapmk@gmail.com'),
 (125,'148D9613D2C1441D814A7F66BC2A447E','2011-08-06 06:14:44','2011-07-19 14:16:50','Adriana Lemos.','','Fixo',NULL,'Boleto','Completa','adrianaoliveirapsilemos@gmail.com','PRACA MANTIQUEIRA 35 - AC XEREM','cx postal ','','Parque Xerém','DUQUE DE CAXIAS','RJ','25245970','21265449',0.00,'mesapmk@gmail.com'),
 (126,'D7AEC6D2EF634697864027C13872ABEE','2011-08-08 15:58:06','2011-08-08 15:57:18','alessandra azevedo de camargo','','Fixo',NULL,'Boleto','AguardandoPagamento','le.ale@uol.com.br','RUA 89-E','61','','Setor Sul','GOIANIA','GO','74093190','32422004',0.00,'mesapmk@gmail.com'),
 (127,'080200C527144B4F82E683EE79D45634','2011-08-09 21:38:44','2011-08-09 21:33:20','Nady Maria dos Santos','','Fixo',NULL,'CartaoCredito','EmAnalise','nadysantos@uol.com.br','Rua São Paulo','180','','Vila Godoy','ALFENAS','MG','37130000','88754126',0.00,'mesapmk@gmail.com'),
 (128,'0696D326C3AB416DA2C832A42EE49DE8','2011-08-10 13:09:14','2011-08-10 13:08:20','Luciana Valéria Garcia Leite','','Fixo',NULL,'Boleto','AguardandoPagamento','lucianagarcia45@yahoo.com.br','Fazenda São João Batista','s/n','Zona Rural','Dornelas','ORIZANIA','MG','36828000','84062469',0.00,'mesapmk@gmail.com'),
 (129,'080200C527144B4F82E683EE79D45634','2011-08-10 17:10:03','2011-08-09 21:33:20','Nady Maria dos Santos','','Fixo',NULL,'CartaoCredito','Aprovada','nadysantos@uol.com.br','Rua São Paulo','180','','Vila Godoy','ALFENAS','MG','37130000','88754126',0.00,'mesapmk@gmail.com'),
 (130,'83911A5137AD4BEEABB84DF3634A573A','2011-08-10 20:08:04','2011-07-26 19:51:15','Antonio Edson Souza Meira Júnior','','Fixo',NULL,'CartaoCredito','Completa','jrmeiramed@yahoo.com.br','RUA DA GRAVIOLA','332','apt 501','Caminho das Árvores','SALVADOR','BA','41820360','99776232',0.00,'mesapmk@gmail.com'),
 (131,'D7AEC6D2EF634697864027C13872ABEE','2011-08-12 04:34:34','2011-08-08 15:57:18','alessandra azevedo de camargo','','Fixo',NULL,'Boleto','Aprovada','le.ale@uol.com.br','RUA 89-E','61','','Setor Sul','GOIANIA','GO','74093190','32422004',0.00,'mesapmk@gmail.com'),
 (132,'0696D326C3AB416DA2C832A42EE49DE8','2011-08-12 07:31:43','2011-08-10 13:08:20','Luciana Valéria Garcia Leite','','Fixo',NULL,'Boleto','Aprovada','lucianagarcia45@yahoo.com.br','Fazenda São João Batista','s/n','Zona Rural','Dornelas','ORIZANIA','MG','36828000','84062469',0.00,'mesapmk@gmail.com'),
 (133,'080200C527144B4F82E683EE79D45634','2011-08-24 17:18:29','2011-08-09 21:33:20','Nady Maria dos Santos','','Fixo',NULL,'CartaoCredito','Completa','nadysantos@uol.com.br','Rua São Paulo','180','','Vila Godoy','ALFENAS','MG','37130000','88754126',0.00,'mesapmk@gmail.com'),
 (134,'D7AEC6D2EF634697864027C13872ABEE','2011-08-26 04:40:23','2011-08-08 15:57:18','alessandra azevedo de camargo','','Fixo',NULL,'Boleto','Completa','le.ale@uol.com.br','RUA 89-E','61','','Setor Sul','GOIANIA','GO','74093190','32422004',0.00,'mesapmk@gmail.com'),
 (135,'0696D326C3AB416DA2C832A42EE49DE8','2011-08-26 05:38:59','2011-08-10 13:08:20','Luciana Valéria Garcia Leite','','Fixo',NULL,'Boleto','Completa','lucianagarcia45@yahoo.com.br','Fazenda São João Batista','s/n','Zona Rural','Dornelas','ORIZANIA','MG','36828000','84062469',0.00,'mesapmk@gmail.com'),
 (136,'8E4B5A5C2F6B4E6484699191F2F16BC9','2011-08-29 20:42:18','2011-08-29 20:40:35','Angelina Ribeiro Troysi Maciel','','Fixo',NULL,'Boleto','AguardandoPagamento','angelinartm3@hotmail.com','R; SILVIANO BRANDÃO','378','CLINICA','CENTRO','OURO FINO','MG','37570000','34416414',0.00,'mesapmk@gmail.com'),
 (137,'8E4B5A5C2F6B4E6484699191F2F16BC9','2011-08-31 07:09:48','2011-08-29 20:40:35','Angelina Ribeiro Troysi Maciel','','Fixo',NULL,'Boleto','Aprovada','angelinartm3@hotmail.com','R; SILVIANO BRANDÃO','378','CLINICA','CENTRO','OURO FINO','MG','37570000','34416414',0.00,'mesapmk@gmail.com'),
 (138,'8E4B5A5C2F6B4E6484699191F2F16BC9','2011-09-14 05:23:13','2011-08-29 20:40:35','Angelina Ribeiro Troysi Maciel','','Fixo',NULL,'Boleto','Completa','angelinartm3@hotmail.com','R; SILVIANO BRANDÃO','378','CLINICA','CENTRO','OURO FINO','MG','37570000','34416414',0.00,'mesapmk@gmail.com'),
 (139,'A4944CEEAAA34B53B82612CFEC80C7B9','2011-09-19 10:53:18','2011-09-19 10:52:52','matermed serv med e hosp ltda','','Fixo',NULL,'Boleto','AguardandoPagamento','medtrans.fsa@terra.com.br','RUA BARAO DE COTEGIPE','635','','Centro','FEIRA DE SANTANA','BA','44001555','36149101',0.00,'mesapmk@gmail.com'),
 (140,'E810AB5F31B34E2CA537BE539266BC5D','2011-09-19 20:03:49','2011-09-19 20:02:47','CENTRO MÉDICO E PSICOLÓGICO DE BELÉM LTDA','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','cempbelpsi@gmail.com','RUA DOMINGOS MARREIROS','1735','','Umarizal','BELEM','PA','66060160','32360221',0.00,'mesapmk@gmail.com'),
 (141,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','2011-09-19 20:06:16','2011-09-19 20:06:04','CENTRO MÉDICO E PSICOLÓGICO DE BELÉM LTDA','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','cempbelpsi@gmail.com','RUA DOMINGOS MARREIROS','1735','','Umarizal','BELEM','PA','66060160','32360221',0.00,'mesapmk@gmail.com'),
 (142,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','2011-09-19 20:07:25','2011-09-19 20:06:04','CENTRO MÉDICO E PSICOLÓGICO DE BELÉM LTDA','','Fixo',NULL,'TransferenciaOnline','Aprovada','cempbelpsi@gmail.com','RUA DOMINGOS MARREIROS','1735','','Umarizal','BELEM','PA','66060160','32360221',0.00,'mesapmk@gmail.com'),
 (143,'977A750E4AA0445F9CE4E97B28CFE1DF','2011-09-19 21:27:43','2011-09-19 21:26:53','Aline Raquel Vasconcelos Alves','','Fixo',NULL,'Boleto','AguardandoPagamento','alinepmto@yahoo.com.br','RUA SADOC CORREIA','561','clinica','Setor Central','ARAGUAINA','TO','77803060','34153350',0.00,'mesapmk@gmail.com'),
 (144,'831C7D38ACC94D87A446300035B02198','2011-09-19 22:39:58','2011-09-19 22:39:21','ddd bh','','Fixo',NULL,'Boleto','AguardandoPagamento','333@gmail.com','sss','3','','ff','bh','MG','38700000','33333333',0.00,'mesapmk@gmail.com'),
 (145,'E810AB5F31B34E2CA537BE539266BC5D','2011-09-20 04:03:52','2011-09-19 20:02:47','CENTRO MÉDICO E PSICOLÓGICO DE BELÉM LTDA','','Fixo',NULL,'TransferenciaOnline','Cancelada','cempbelpsi@gmail.com','RUA DOMINGOS MARREIROS','1735','','Umarizal','BELEM','PA','66060160','32360221',0.00,'mesapmk@gmail.com'),
 (146,'A4944CEEAAA34B53B82612CFEC80C7B9','2011-09-20 07:06:33','2011-09-19 10:52:52','matermed serv med e hosp ltda','','Fixo',NULL,'Boleto','Aprovada','medtrans.fsa@terra.com.br','RUA BARAO DE COTEGIPE','635','','Centro','FEIRA DE SANTANA','BA','44001555','36149101',0.00,'mesapmk@gmail.com'),
 (147,'DD16AA817685454F8A9A8D232E67D4C3','2011-09-22 00:14:11','2011-09-22 00:13:43','Ana Maria Boza Martins','','Fixo',NULL,'Boleto','AguardandoPagamento','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','347','1','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (148,'05B6397EE12E49EB893A8C5CD850AF9D','2011-09-23 11:40:07','2011-09-23 11:39:47','Ana aria Boza Martins','','Fixo',NULL,'Boleto','AguardandoPagamento','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','345','1º andar','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (149,'3B8E0CCC115B4F228761D001B2A87DF0','2011-09-23 11:43:33','2011-09-23 11:43:17','Ana Maria Boza Martins','','Fixo',NULL,'Boleto','AguardandoPagamento','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','347','1º andar','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (150,'CA9B631071EF4F11AE338FFFE340B32C','2011-09-23 18:04:54','2011-09-23 18:02:49','Jorge Antonio Castellucci Ferreira Junior','','Fixo',NULL,'CartaoCredito','EmAnalise','jjcastellucci@ymail.com','RUA REINALDO DE MATOS','86','em frente à 28ª Delegacia de Pol. Civíl','Nordeste','SALVADOR','BA','41905365','87790057',0.00,'mesapmk@gmail.com'),
 (151,'154DB9B2396545DCA1CB7773FBB6E733','2011-09-23 19:38:45','2011-09-23 19:38:21','Aline Raquel Vasconcelos Alves','','Fixo',NULL,'Boleto','AguardandoPagamento','alinepmto@yahoo.com.br','RUA SADOC CORREIA','561','CIMO','Setor Central','ARAGUAINA','TO','77803060','34153350',0.00,'mesapmk@gmail.com'),
 (152,'3B8E0CCC115B4F228761D001B2A87DF0','2011-09-24 04:11:31','2011-09-23 11:43:17','Ana Maria Boza Martins','','Fixo',NULL,'Boleto','Aprovada','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','347','1º andar','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (153,'CA9B631071EF4F11AE338FFFE340B32C','2011-09-24 18:06:49','2011-09-23 18:02:49','Jorge Antonio Castellucci Ferreira Junior','','Fixo',NULL,'CartaoCredito','Cancelada','jjcastellucci@ymail.com','RUA REINALDO DE MATOS','86','em frente à 28ª Delegacia de Pol. Civíl','Nordeste','SALVADOR','BA','41905365','87790057',0.00,'mesapmk@gmail.com'),
 (154,'154DB9B2396545DCA1CB7773FBB6E733','2011-09-27 06:37:03','2011-09-23 19:38:21','Aline Raquel Vasconcelos Alves','','Fixo',NULL,'Boleto','Aprovada','alinepmto@yahoo.com.br','RUA SADOC CORREIA','561','CIMO','Setor Central','ARAGUAINA','TO','77803060','34153350',0.00,'mesapmk@gmail.com'),
 (155,'977A750E4AA0445F9CE4E97B28CFE1DF','2011-10-03 07:21:22','2011-09-19 21:26:53','Aline Raquel Vasconcelos Alves','','Fixo',NULL,'Boleto','Cancelada','alinepmto@yahoo.com.br','RUA SADOC CORREIA','561','clinica','Setor Central','ARAGUAINA','TO','77803060','34153350',0.00,'mesapmk@gmail.com'),
 (156,'831C7D38ACC94D87A446300035B02198','2011-10-03 07:25:20','2011-09-19 22:39:21','ddd bh','','Fixo',NULL,'Boleto','Cancelada','333@gmail.com','sss','3','','ff','bh','MG','38700000','33333333',0.00,'mesapmk@gmail.com'),
 (157,'14F3670EAC724F8BB5B3DD0EBF3D4D3D','2011-10-03 20:17:10','2011-09-19 20:06:04','CENTRO MÉDICO E PSICOLÓGICO DE BELÉM LTDA','','Fixo',NULL,'TransferenciaOnline','Completa','cempbelpsi@gmail.com','RUA DOMINGOS MARREIROS','1735','','Umarizal','BELEM','PA','66060160','32360221',0.00,'mesapmk@gmail.com'),
 (158,'A4944CEEAAA34B53B82612CFEC80C7B9','2011-10-04 07:14:56','2011-09-19 10:52:52','matermed serv med e hosp ltda','','Fixo',NULL,'Boleto','Completa','medtrans.fsa@terra.com.br','RUA BARAO DE COTEGIPE','635','','Centro','FEIRA DE SANTANA','BA','44001555','36149101',0.00,'mesapmk@gmail.com'),
 (159,'DD16AA817685454F8A9A8D232E67D4C3','2011-10-06 06:15:33','2011-09-22 00:13:43','Ana Maria Boza Martins','','Fixo',NULL,'Boleto','Cancelada','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','347','1','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (160,'05B6397EE12E49EB893A8C5CD850AF9D','2011-10-07 06:33:46','2011-09-23 11:39:47','Ana aria Boza Martins','','Fixo',NULL,'Boleto','Cancelada','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','345','1º andar','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (161,'3B8E0CCC115B4F228761D001B2A87DF0','2011-10-08 04:19:53','2011-09-23 11:43:17','Ana Maria Boza Martins','','Fixo',NULL,'Boleto','Completa','anamaria@personalclinica.com.br','AVENIDA SILVA JARDIM','347','1º andar','Rebouças','CURITIBA','PR','80230000','32230468',0.00,'mesapmk@gmail.com'),
 (162,'154DB9B2396545DCA1CB7773FBB6E733','2011-10-11 06:40:12','2011-09-23 19:38:21','Aline Raquel Vasconcelos Alves','','Fixo',NULL,'Boleto','Completa','alinepmto@yahoo.com.br','RUA SADOC CORREIA','561','CIMO','Setor Central','ARAGUAINA','TO','77803060','34153350',0.00,'mesapmk@gmail.com'),
 (163,'0B1CE94F6DBE475C8BB7FA808192B517','2011-10-16 15:00:26','2011-10-16 14:58:48','Jorge Antonio Castellucci Ferreira Junior','','Fixo',NULL,'CartaoCredito','Aprovada','jjcastellucci@ymail.com','RUA REINALDO DE MATOS','86','em frente à 28ª Delegacia de Pol. Civíl','Nordeste','SALVADOR','BA','41905365','33587551',0.00,'mesapmk@gmail.com'),
 (164,'1A55EDEE2D734A60A7E3016FC5D4684B','2011-10-20 11:58:59','2011-10-20 11:55:14','Raimunda Goreth dos Santos Lima','','Fixo',NULL,'Boleto','AguardandoPagamento','goreth@cidep.com.br','AVENIDA DOS FRANCESES','38','altos','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (165,'1A55EDEE2D734A60A7E3016FC5D4684B','2011-10-25 05:32:49','2011-10-20 11:55:14','Raimunda Goreth dos Santos Lima','','Fixo',NULL,'Boleto','Aprovada','goreth@cidep.com.br','AVENIDA DOS FRANCESES','38','altos','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (166,'0B1CE94F6DBE475C8BB7FA808192B517','2011-10-30 15:07:36','2011-10-16 14:58:48','Jorge Antonio Castellucci Ferreira Junior','','Fixo',NULL,'CartaoCredito','Completa','jjcastellucci@ymail.com','RUA REINALDO DE MATOS','86','em frente à 28ª Delegacia de Pol. Civíl','Nordeste','SALVADOR','BA','41905365','33587551',0.00,'mesapmk@gmail.com'),
 (167,'E84897173386464FA007FBABB49329D4','2011-11-01 17:40:29','2011-11-01 17:36:22','Evolução Clinica','','Fixo',NULL,'CartaoCredito','Cancelada','marcia@evolucaovida.com.br','RUA BARAO DO FLAMENGO','22','701','Flamengo','RIO DE JANEIRO','RJ','22220080','22057223',0.00,'mesapmk@gmail.com'),
 (168,'CC08DA03E5BD45C79A6ED25A38F13D90','2011-11-01 17:44:46','2011-11-01 17:44:26','Evolução Clinica','','Fixo',NULL,'Boleto','AguardandoPagamento','marcia@evolucaovida.com.br','RUA BARAO DO FLAMENGO','22','701','Flamengo','RIO DE JANEIRO','RJ','22220080','22057223',0.00,'mesapmk@gmail.com'),
 (169,'CC08DA03E5BD45C79A6ED25A38F13D90','2011-11-05 05:29:32','2011-11-01 17:44:26','Evolução Clinica','','Fixo',NULL,'Boleto','Aprovada','marcia@evolucaovida.com.br','RUA BARAO DO FLAMENGO','22','701','Flamengo','RIO DE JANEIRO','RJ','22220080','22057223',0.00,'mesapmk@gmail.com'),
 (170,'1A55EDEE2D734A60A7E3016FC5D4684B','2011-11-08 05:53:23','2011-10-20 11:55:14','Raimunda Goreth dos Santos Lima','','Fixo',NULL,'Boleto','Completa','goreth@cidep.com.br','AVENIDA DOS FRANCESES','38','altos','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (171,'CC08DA03E5BD45C79A6ED25A38F13D90','2011-11-19 05:49:20','2011-11-01 17:44:26','Evolução Clinica','','Fixo',NULL,'Boleto','Completa','marcia@evolucaovida.com.br','RUA BARAO DO FLAMENGO','22','701','Flamengo','RIO DE JANEIRO','RJ','22220080','22057223',0.00,'mesapmk@gmail.com'),
 (172,'0B55FEBC9C02445781A9936E27A36185','2011-11-21 14:50:33','2011-11-21 14:50:08','psico store soluções em rh ltda','','Fixo',NULL,'Boleto','AguardandoPagamento','financeiro@psicostore.com.br','AVENIDA DOS HOLANDESES','05','sala 10','Ponta DAreia','SAO LUIS','MA','65075650','32052995',0.00,'mesapmk@gmail.com'),
 (173,'82834F08D6C7497DB4F6531A7062EC50','2011-11-29 10:40:03','2011-11-29 10:37:58','Alissandra Coutinho Grego D Andrea','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','aligrego2@hotmail.com','RUA JAU','25','apt.702 B','Olho D','SAO LUIS','MA','65065200','88994055',0.00,'mesapmk@gmail.com'),
 (174,'82834F08D6C7497DB4F6531A7062EC50','2011-11-29 18:40:02','2011-11-29 10:37:58','Alissandra Coutinho Grego D Andrea','','Fixo',NULL,'TransferenciaOnline','Cancelada','aligrego2@hotmail.com','RUA JAU','25','apt.702 B','Olho D','SAO LUIS','MA','65065200','88994055',0.00,'mesapmk@gmail.com'),
 (175,'93A77C0C2EA344B281E6337EEDF715AE','2011-12-01 10:06:02','2011-12-01 10:03:36','Alissandra Coutinho Grego D Andrea','','Fixo',NULL,'CartaoCredito','EmAnalise','aligrego2@hotmail.com','RUA JAU','25','apt.702 B','Olho D','SAO LUIS','MA','65065200','32262306',0.00,'mesapmk@gmail.com'),
 (176,'93A77C0C2EA344B281E6337EEDF715AE','2011-12-01 16:44:22','2011-12-01 10:03:36','Alissandra Coutinho Grego D Andrea','','Fixo',NULL,'CartaoCredito','Aprovada','aligrego2@hotmail.com','RUA JAU','25','apt.702 B','Olho D','SAO LUIS','MA','65065200','32262306',0.00,'mesapmk@gmail.com'),
 (177,'0B55FEBC9C02445781A9936E27A36185','2011-12-05 06:50:31','2011-11-21 14:50:08','psico store soluções em rh ltda','','Fixo',NULL,'Boleto','Cancelada','financeiro@psicostore.com.br','AVENIDA DOS HOLANDESES','05','sala 10','Ponta DAreia','SAO LUIS','MA','65075650','32052995',0.00,'mesapmk@gmail.com'),
 (178,'E6AEA68219D048C0939CD3EF98F9230D','2011-12-12 19:03:31','2011-12-12 19:00:57','Carolina Maschio Semim','','Fixo',NULL,'CartaoCredito','EmAnalise','carolinasemim@hotmail.com','Rua Floriano Peixoto','283','','Vila Braga','AGUAI','SP','13860000','36521693',0.00,'mesapmk@gmail.com'),
 (179,'E6AEA68219D048C0939CD3EF98F9230D','2011-12-13 02:33:30','2011-12-12 19:00:57','Carolina Maschio Semim','','Fixo',NULL,'CartaoCredito','Aprovada','carolinasemim@hotmail.com','Rua Floriano Peixoto','283','','Vila Braga','AGUAI','SP','13860000','36521693',0.00,'mesapmk@gmail.com'),
 (180,'93A77C0C2EA344B281E6337EEDF715AE','2011-12-15 16:48:51','2011-12-01 10:03:36','Alissandra Coutinho Grego D Andrea','','Fixo',NULL,'CartaoCredito','Completa','aligrego2@hotmail.com','RUA JAU','25','apt.702 B','Olho D','SAO LUIS','MA','65065200','32262306',0.00,'mesapmk@gmail.com'),
 (181,'BDCEFF91DEBA4245B9DDBC445DE55280','2011-12-26 20:26:19','2011-12-26 20:25:38','Priscila Talevi','','Fixo',NULL,'Boleto','AguardandoPagamento','priscila_talevi@hotmail.com','RUA RAIMUNDO MERCES','4673','','Agenor de Carvalho','PORTO VELHO','RO','76820276','84566300',0.00,'mesapmk@gmail.com'),
 (182,'E6AEA68219D048C0939CD3EF98F9230D','2011-12-27 02:37:23','2011-12-12 19:00:57','Carolina Maschio Semim','','Fixo',NULL,'CartaoCredito','Completa','carolinasemim@hotmail.com','Rua Floriano Peixoto','283','','Vila Braga','AGUAI','SP','13860000','36521693',0.00,'mesapmk@gmail.com'),
 (183,'BDCEFF91DEBA4245B9DDBC445DE55280','2012-01-09 07:06:46','2011-12-26 20:25:38','Priscila Talevi','','Fixo',NULL,'Boleto','Cancelada','priscila_talevi@hotmail.com','RUA RAIMUNDO MERCES','4673','','Agenor de Carvalho','PORTO VELHO','RO','76820276','84566300',0.00,'mesapmk@gmail.com'),
 (184,'BEB222F905414B8E87683F3CF4D8E94E','2012-01-12 13:25:59','2012-01-12 13:23:45','CS Recursos Humanos','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','cguedes@csrh.srv.br','Rua Itabaiana','226','1003','Grajau','Rio de Janeiro','RJ','20561056','30210817',0.00,'mesapmk@gmail.com'),
 (185,'BEB222F905414B8E87683F3CF4D8E94E','2012-01-12 13:32:28','2012-01-12 13:23:45','CS Recursos Humanos','','Fixo',NULL,'TransferenciaOnline','Aprovada','cguedes@csrh.srv.br','Rua Itabaiana','226','1003','Grajau','Rio de Janeiro','RJ','20561056','30210817',0.00,'mesapmk@gmail.com'),
 (186,'3701E5D116574349B1AFCDF1A332BC62','2012-01-18 15:26:16','2012-01-18 15:25:48','E F Fontes','','Fixo',NULL,'Boleto','AguardandoPagamento','recursoshumanos@cidep.com.br','AVENIDA DOS FRANCESES','38','','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (187,'3701E5D116574349B1AFCDF1A332BC62','2012-01-19 03:43:58','2012-01-18 15:25:48','E F Fontes','','Fixo',NULL,'Boleto','Aprovada','recursoshumanos@cidep.com.br','AVENIDA DOS FRANCESES','38','','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (188,'BEB222F905414B8E87683F3CF4D8E94E','2012-01-26 13:38:41','2012-01-12 13:23:45','CS Recursos Humanos','','Fixo',NULL,'TransferenciaOnline','Completa','cguedes@csrh.srv.br','Rua Itabaiana','226','1003','Grajau','Rio de Janeiro','RJ','20561056','30210817',0.00,'mesapmk@gmail.com'),
 (189,'8709E07B1F834618ACDCE59FCE48ED9D','2012-01-26 21:09:46','2012-01-26 21:08:13','Sue Hellen Fonseca Viana','','Fixo',NULL,'Boleto','AguardandoPagamento','suehellenviana@hotmail.com','RUA SANTO IGNACIO','09','Casa','Recanto','CACHOEIRO DE ITAPEMIRIM','ES','29303125','99454629',0.00,'mesapmk@gmail.com'),
 (190,'8709E07B1F834618ACDCE59FCE48ED9D','2012-01-31 06:53:22','2012-01-26 21:08:13','Sue Hellen Fonseca Viana','','Fixo',NULL,'Boleto','Aprovada','suehellenviana@hotmail.com','RUA SANTO IGNACIO','09','Casa','Recanto','CACHOEIRO DE ITAPEMIRIM','ES','29303125','99454629',0.00,'mesapmk@gmail.com'),
 (191,'EE50A28A9CFD47849E7916D55F64E665','2012-01-31 18:19:53','2012-01-31 18:19:24','Fernanda Souza Machado','','Fixo',NULL,'Boleto','AguardandoPagamento','nandapsi15@gmail.com','QUADRA SMPW QUADRA 13 CONJUNTO 6','lote 06','casa C','Setor de Mansões Park Way','BRASILIA','DF','71741306','33866723',0.00,'mesapmk@gmail.com'),
 (192,'EF218A7A585E40A395CA3FF4E6D33183','2012-01-31 22:02:03','2012-01-31 22:01:32','Vanessa Vasconcelos Carvalho','','Fixo',NULL,'Boleto','AguardandoPagamento','vanessavcpsic@gmail.com','QUADRA SHIN QI 9 CONJUNTO 3','Casa 1','Lago Norte','Setor de Habitações Individuais Norte','BRASILIA','DF','71515230','33687883',0.00,'mesapmk@gmail.com'),
 (193,'A5396088181C434DA505D3DAB598ADBD','2012-02-01 08:43:40','2012-02-01 08:42:00','AG Clinica de Exames Médicos e Psicológicos LTDA','','Fixo',NULL,'CartaoCredito','Aprovada','ag.clinica@hotmail.com','AVENIDA AMAZONAS','507','13º andar','Centro','BELO HORIZONTE','MG','30180000','32012931',0.00,'mesapmk@gmail.com'),
 (194,'3701E5D116574349B1AFCDF1A332BC62','2012-02-02 04:02:06','2012-01-18 15:25:48','E F Fontes','','Fixo',NULL,'Boleto','Completa','recursoshumanos@cidep.com.br','AVENIDA DOS FRANCESES','38','','Vila Palmeira','SAO LUIS','MA','65036283','32232135',0.00,'mesapmk@gmail.com'),
 (195,'EF218A7A585E40A395CA3FF4E6D33183','2012-02-02 06:54:52','2012-01-31 22:01:32','Vanessa Vasconcelos Carvalho','','Fixo',NULL,'Boleto','Aprovada','vanessavcpsic@gmail.com','QUADRA SHIN QI 9 CONJUNTO 3','Casa 1','Lago Norte','Setor de Habitações Individuais Norte','BRASILIA','DF','71515230','33687883',0.00,'mesapmk@gmail.com'),
 (196,'8709E07B1F834618ACDCE59FCE48ED9D','2012-02-14 07:24:30','2012-01-26 21:08:13','Sue Hellen Fonseca Viana','','Fixo',NULL,'Boleto','Completa','suehellenviana@hotmail.com','RUA SANTO IGNACIO','09','Casa','Recanto','CACHOEIRO DE ITAPEMIRIM','ES','29303125','99454629',0.00,'mesapmk@gmail.com'),
 (197,'EE50A28A9CFD47849E7916D55F64E665','2012-02-14 07:26:35','2012-01-31 18:19:24','Fernanda Souza Machado','','Fixo',NULL,'Boleto','Cancelada','nandapsi15@gmail.com','QUADRA SMPW QUADRA 13 CONJUNTO 6','lote 06','casa C','Setor de Mansões Park Way','BRASILIA','DF','71741306','33866723',0.00,'mesapmk@gmail.com'),
 (198,'A5396088181C434DA505D3DAB598ADBD','2012-02-15 08:48:16','2012-02-01 08:42:00','AG Clinica de Exames Médicos e Psicológicos LTDA','','Fixo',NULL,'CartaoCredito','Completa','ag.clinica@hotmail.com','AVENIDA AMAZONAS','507','13º andar','Centro','BELO HORIZONTE','MG','30180000','32012931',0.00,'mesapmk@gmail.com'),
 (199,'EF218A7A585E40A395CA3FF4E6D33183','2012-02-16 05:18:19','2012-01-31 22:01:32','Vanessa Vasconcelos Carvalho','','Fixo',NULL,'Boleto','Completa','vanessavcpsic@gmail.com','QUADRA SHIN QI 9 CONJUNTO 3','Casa 1','Lago Norte','Setor de Habitações Individuais Norte','BRASILIA','DF','71515230','33687883',0.00,'mesapmk@gmail.com'),
 (200,'56D8F1AEA22B43B4959857FEED7A813F','2012-02-22 15:40:43','2012-02-22 15:38:09','Silvia Helena Vetoni Homsi','','Fixo',NULL,'CartaoCredito','Aprovada','silviahomsi@hotmail.com','RUA SALDANHA MARINHO','3954','','Vila Santo Antônio','SAO JOSE DO RIO PRETO','SP','15014300','33531720',0.00,'mesapmk@gmail.com'),
 (201,'72510F9744B54218A8FCA7829F07A7E3','2012-02-29 21:19:13','2012-02-29 21:15:35','Manuela Bello Marques Pereira','','Fixo',NULL,'CartaoCredito','EmAnalise','manubello05@yahoo.com.br','AVENIDA PRESIDENTE KENNEDY','2622','apt703','Banco Raso','ITABUNA','BA','45607300','88076070',0.00,'mesapmk@gmail.com'),
 (202,'72510F9744B54218A8FCA7829F07A7E3','2012-03-01 17:10:34','2012-02-29 21:15:35','Manuela Bello Marques Pereira','','Fixo',NULL,'CartaoCredito','Aprovada','manubello05@yahoo.com.br','AVENIDA PRESIDENTE KENNEDY','2622','apt703','Banco Raso','ITABUNA','BA','45607300','88076070',0.00,'mesapmk@gmail.com'),
 (203,'56D8F1AEA22B43B4959857FEED7A813F','2012-03-07 15:48:35','2012-02-22 15:38:09','Silvia Helena Vetoni Homsi','','Fixo',NULL,'CartaoCredito','Completa','silviahomsi@hotmail.com','RUA SALDANHA MARINHO','3954','','Vila Santo Antônio','SAO JOSE DO RIO PRETO','SP','15014300','33531720',0.00,'mesapmk@gmail.com'),
 (204,'AEA4E67D5F684C8992B00F453D732EF1','2012-03-08 09:26:55','2012-03-08 09:25:52','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','AguardandoPagamento','adm.ortocli@yahoo.com.br','RUA 19 DE MAIO','192','ORTOCLÍNICA SETOR DE HABILITAÇÃO','CENTRO','BARREIRAS','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (205,'75A16469C05142BFA2B69DC74FC3F9A0','2012-03-08 09:40:21','2012-03-08 09:40:07','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','AguardandoPagamento','adm.ortocli@yahoo.com.br','Rua 19 de Maio','192','ortoclínica Setor de Habilitação','Centro','Barreiras','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (206,'1473743FD3C44C0BA34E21D889FF69C7','2012-03-08 09:46:16','2012-03-08 09:45:43','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','AguardandoPagamento','adm.ortocli@yahoo.com.br','Rua 19 de Maio','192','Ortoclínica Setor de Habilitação','Centro','Barreiras','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (207,'72510F9744B54218A8FCA7829F07A7E3','2012-03-15 17:17:54','2012-02-29 21:15:35','Manuela Bello Marques Pereira','','Fixo',NULL,'CartaoCredito','Completa','manubello05@yahoo.com.br','AVENIDA PRESIDENTE KENNEDY','2622','apt703','Banco Raso','ITABUNA','BA','45607300','88076070',0.00,'mesapmk@gmail.com'),
 (208,'DD0318091403492CA78B30017628E613','2012-03-20 17:59:01','2012-03-20 17:51:35','Graziele Santos','','Fixo',NULL,'Boleto','AguardandoPagamento','luna_grazi@hotmail.com','ALAMEDA DEPUTADO DILSON BATISTA','225','Cond:Victória Garden Edf:Canafístula 501','Grageru','ARACAJU','SE','49027390','88047834',0.00,'mesapmk@gmail.com'),
 (209,'AEA4E67D5F684C8992B00F453D732EF1','2012-03-22 06:26:41','2012-03-08 09:25:52','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','Cancelada','adm.ortocli@yahoo.com.br','RUA 19 DE MAIO','192','ORTOCLÍNICA SETOR DE HABILITAÇÃO','CENTRO','BARREIRAS','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (210,'75A16469C05142BFA2B69DC74FC3F9A0','2012-03-22 06:29:16','2012-03-08 09:40:07','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','Cancelada','adm.ortocli@yahoo.com.br','Rua 19 de Maio','192','ortoclínica Setor de Habilitação','Centro','Barreiras','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (211,'1473743FD3C44C0BA34E21D889FF69C7','2012-03-22 06:29:56','2012-03-08 09:45:43','Ortoclínica Setor de Habilitação','','Fixo',NULL,'Boleto','Cancelada','adm.ortocli@yahoo.com.br','Rua 19 de Maio','192','Ortoclínica Setor de Habilitação','Centro','Barreiras','BA','47800000','36122999',0.00,'mesapmk@gmail.com'),
 (212,'217F5EB13713425B8426E3715E0ADBB5','2012-03-23 14:35:55','2012-03-23 14:35:35','alessandra paello camarao','','Fixo',NULL,'Boleto','AguardandoPagamento','alessandra_paello@hotmail.com','RUA CARACAS','351','','Jardim das Américas','CUIABA','MT','78060597','30256046',0.00,'mesapmk@gmail.com'),
 (213,'F5387C6278BE4F20B8BDE179320358EC','2012-03-23 16:03:40','2012-03-23 16:02:33','leiliane oliveira santos','','Fixo',NULL,'Boleto','AguardandoPagamento','cmptransito@hotmail.com','RUA PERNAMBUCO','293','apt 202','Jardim Vitória','ITABUNA','BA','45605510','96642444',0.00,'mesapmk@gmail.com'),
 (214,'CB468CD588B9473FBB956BBAD2235C38','2012-03-23 18:09:55','2012-03-23 18:09:31','Ricardo Ubiratan dos Santos','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','ricardo_us@msn.com','RUA ANTONIETA ALTENFELDER','152','','Jardim Guapira','SAO PAULO','SP','02317170','84267303',0.00,'mesapmk@gmail.com'),
 (215,'CB468CD588B9473FBB956BBAD2235C38','2012-03-23 18:14:03','2012-03-23 18:09:31','Ricardo Ubiratan dos Santos','','Fixo',NULL,'TransferenciaOnline','Aprovada','ricardo_us@msn.com','RUA ANTONIETA ALTENFELDER','152','','Jardim Guapira','SAO PAULO','SP','02317170','84267303',0.00,'mesapmk@gmail.com'),
 (216,'F5387C6278BE4F20B8BDE179320358EC','2012-03-27 05:41:34','2012-03-23 16:02:33','leiliane oliveira santos','','Fixo',NULL,'Boleto','Aprovada','cmptransito@hotmail.com','RUA PERNAMBUCO','293','apt 202','Jardim Vitória','ITABUNA','BA','45605510','96642444',0.00,'mesapmk@gmail.com'),
 (217,'AD2F51AA1AE740F09649BAAF56962706','2012-03-29 21:17:06','2012-03-29 21:11:48','marcia helena de castro lima','','Fixo',NULL,'CartaoCredito','Aprovada','marciahclima@yahoo.com.br','RUA FELIPE ACHE','73','12','Jardim São Luiz','RIBEIRAO PRETO','SP','14020420','38774608',0.00,'mesapmk@gmail.com'),
 (218,'26BD90B60CCF4A8184461FC078B03353','2012-04-02 11:53:04','2012-04-02 11:52:45','alessandra Paello','','Fixo',NULL,'Boleto','AguardandoPagamento','alessandra_paello@hotmail.com','RUA CARACAS','351','','Jardim das Américas','CUIABA','MT','78060597','30256046',0.00,'mesapmk@gmail.com'),
 (219,'DD0318091403492CA78B30017628E613','2012-04-03 07:01:31','2012-03-20 17:51:35','Graziele Santos','','Fixo',NULL,'Boleto','Cancelada','luna_grazi@hotmail.com','ALAMEDA DEPUTADO DILSON BATISTA','225','Cond:Victória Garden Edf:Canafístula 501','Grageru','ARACAJU','SE','49027390','88047834',0.00,'mesapmk@gmail.com'),
 (220,'26BD90B60CCF4A8184461FC078B03353','2012-04-03 07:24:31','2012-04-02 11:52:45','alessandra Paello','','Fixo',NULL,'Boleto','Aprovada','alessandra_paello@hotmail.com','RUA CARACAS','351','','Jardim das Américas','CUIABA','MT','78060597','30256046',0.00,'mesapmk@gmail.com'),
 (221,'217F5EB13713425B8426E3715E0ADBB5','2012-04-06 06:41:33','2012-03-23 14:35:35','alessandra paello camarao','','Fixo',NULL,'Boleto','Cancelada','alessandra_paello@hotmail.com','RUA CARACAS','351','','Jardim das Américas','CUIABA','MT','78060597','30256046',0.00,'mesapmk@gmail.com'),
 (222,'CB468CD588B9473FBB956BBAD2235C38','2012-04-06 18:18:00','2012-03-23 18:09:31','Ricardo Ubiratan dos Santos','','Fixo',NULL,'TransferenciaOnline','Completa','ricardo_us@msn.com','RUA ANTONIETA ALTENFELDER','152','','Jardim Guapira','SAO PAULO','SP','02317170','84267303',0.00,'mesapmk@gmail.com'),
 (223,'F5387C6278BE4F20B8BDE179320358EC','2012-04-10 06:25:23','2012-03-23 16:02:33','leiliane oliveira santos','','Fixo',NULL,'Boleto','Completa','cmptransito@hotmail.com','RUA PERNAMBUCO','293','apt 202','Jardim Vitória','ITABUNA','BA','45605510','96642444',0.00,'mesapmk@gmail.com'),
 (224,'AD2F51AA1AE740F09649BAAF56962706','2012-04-12 21:18:28','2012-03-29 21:11:48','marcia helena de castro lima','','Fixo',NULL,'CartaoCredito','Completa','marciahclima@yahoo.com.br','RUA FELIPE ACHE','73','12','Jardim São Luiz','RIBEIRAO PRETO','SP','14020420','38774608',0.00,'mesapmk@gmail.com'),
 (225,'5757E10B8CCE447A8A96E1FE42FF68E8','2012-04-13 10:52:41','2012-04-13 10:42:20','Juliana Teixeira Barros','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','julianatbarros@yahoo.com.br','RUA PADRE AGOBAR VALENCA','371','','Severiano Moraes Filho','GARANHUNS','PE','55299390','37612615',0.00,'mesapmk@gmail.com'),
 (226,'BF791F4D6EDE439EA855D4BB8149CC94','2012-04-13 18:12:40','2012-04-13 18:12:01','Personal Centro Int de Saúde e Consult RH SC Ltda','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','atendimento@personalclinica.com.br','RUA ROCKEFELLER','152','Sobreloja','Prado Velho','CURITIBA','PR','80230130','32230468',0.00,'mesapmk@gmail.com'),
 (227,'5757E10B8CCE447A8A96E1FE42FF68E8','2012-04-13 20:52:38','2012-04-13 10:42:20','Juliana Teixeira Barros','','Fixo',NULL,'TransferenciaOnline','Cancelada','julianatbarros@yahoo.com.br','RUA PADRE AGOBAR VALENCA','371','','Severiano Moraes Filho','GARANHUNS','PE','55299390','37612615',0.00,'mesapmk@gmail.com'),
 (228,'BF791F4D6EDE439EA855D4BB8149CC94','2012-04-14 04:12:40','2012-04-13 18:12:01','Personal Centro Int de Saúde e Consult RH SC Ltda','','Fixo',NULL,'TransferenciaOnline','Cancelada','atendimento@personalclinica.com.br','RUA ROCKEFELLER','152','Sobreloja','Prado Velho','CURITIBA','PR','80230130','32230468',0.00,'mesapmk@gmail.com'),
 (229,'B8031BC7EBC3432BB5A7654C43FE315E','2012-04-14 12:49:30','2012-04-14 12:49:02','Personal Centro Intde Saúde e Cons RH SC Ltda','','Fixo',NULL,'TransferenciaOnline','AguardandoPagamento','atendimento@personalclinica.com.br','RUA ROCKEFELLER','152','Sobreloja','Prado Velho','CURITIBA','PR','80230130','32230468',0.00,'mesapmk@gmail.com'),
 (230,'B8031BC7EBC3432BB5A7654C43FE315E','2012-04-14 12:51:16','2012-04-14 12:49:02','Personal Centro Intde Saúde e Cons RH SC Ltda','','Fixo',NULL,'TransferenciaOnline','Aprovada','atendimento@personalclinica.com.br','RUA ROCKEFELLER','152','Sobreloja','Prado Velho','CURITIBA','PR','80230130','32230468',0.00,'mesapmk@gmail.com'),
 (231,'26BD90B60CCF4A8184461FC078B03353','2012-04-17 07:56:42','2012-04-02 11:52:45','alessandra Paello','','Fixo',NULL,'Boleto','Completa','alessandra_paello@hotmail.com','RUA CARACAS','351','','Jardim das Américas','CUIABA','MT','78060597','30256046',0.00,'mesapmk@gmail.com'),
 (232,'A274F36CB85E492AB78457C62B2FDC0A','2012-04-18 12:59:18','2012-04-18 12:58:10','Raquel Toscano de Freitas','','Fixo',NULL,'Boleto','AguardandoPagamento','raquel.psicosaude@gmail.com','Rua Jose Farias','160','SL 104/105','Sta Luiza','Vitória','ES','29045430','32154796',0.00,'mesapmk@gmail.com'),
 (233,'A274F36CB85E492AB78457C62B2FDC0A','2012-04-24 13:08:06','2012-04-18 12:58:10','Raquel Toscano de Freitas','','Fixo',NULL,'Boleto','Aprovada','raquel.psicosaude@gmail.com','Rua Jose Farias','160','SL 104/105','Sta Luiza','Vitória','ES','29045430','32154796',0.00,'mesapmk@gmail.com'),
 (234,'317C03E3A29849608C6FE15ED22BFC73','2012-04-28 12:34:42','2012-04-28 12:33:54','Luis Carlos Bassi','','Fixo',NULL,'Boleto','AguardandoPagamento','rhterra@uol.com.br','RUA EVARISTO SEVERINO DE ALMEIDA','2','210','Vila Cremonesi','ITATIBA','SP','13255481','99897454',0.00,'mesapmk@gmail.com'),
 (235,'B8031BC7EBC3432BB5A7654C43FE315E','2012-04-28 12:57:32','2012-04-14 12:49:02','Personal Centro Intde Saúde e Cons RH SC Ltda','','Fixo',NULL,'TransferenciaOnline','Completa','atendimento@personalclinica.com.br','RUA ROCKEFELLER','152','Sobreloja','Prado Velho','CURITIBA','PR','80230130','32230468',0.00,'mesapmk@gmail.com'),
 (236,'317C03E3A29849608C6FE15ED22BFC73','2012-05-01 06:22:44','2012-04-28 12:33:54','Luis Carlos Bassi','','Fixo',NULL,'Boleto','Aprovada','rhterra@uol.com.br','RUA EVARISTO SEVERINO DE ALMEIDA','2','210','Vila Cremonesi','ITATIBA','SP','13255481','99897454',0.00,'mesapmk@gmail.com'),
 (237,'902E30163DE24A6DAD61CC66258DC879','2012-05-04 00:06:21','2012-05-04 00:03:13','Ana Rita Aguiar da Silva','','Fixo',NULL,'CartaoCredito','EmAnalise','aguiar.anarita@gmail.com','TRAVESSA RENATO PACHECO MARQUES','86','AP.102B','Fonseca','NITEROI','RJ','24120200','87558049',0.00,'mesapmk@gmail.com'),
 (238,'902E30163DE24A6DAD61CC66258DC879','2012-05-04 09:26:37','2012-05-04 00:03:13','Ana Rita Aguiar da Silva','','Fixo',NULL,'CartaoCredito','Aprovada','aguiar.anarita@gmail.com','TRAVESSA RENATO PACHECO MARQUES','86','AP.102B','Fonseca','NITEROI','RJ','24120200','87558049',0.00,'mesapmk@gmail.com');
INSERT INTO `retorno` (`id`,`TransacaoID`,`DataUltimaAtualizacao`,`DataTransacao`,`CliNome`,`Referencia`,`TipoFrete`,`Anotacao`,`TipoPagamento`,`StatusTransacao`,`CliEmail`,`CliEndereco`,`CliNumero`,`CliComplemento`,`CliBairro`,`CliCidade`,`CliEstado`,`CliCEP`,`CliTelefone`,`ValorFrete`,`VendedorEmail`) VALUES 
 (239,'A274F36CB85E492AB78457C62B2FDC0A','2012-05-08 13:29:05','2012-04-18 12:58:10','Raquel Toscano de Freitas','','Fixo',NULL,'Boleto','Completa','raquel.psicosaude@gmail.com','Rua Jose Farias','160','SL 104/105','Sta Luiza','Vitória','ES','29045430','32154796',0.00,'mesapmk@gmail.com'),
 (240,'2BE3FD0DA4C34D13AFDB7BBAAF4A8AAB','2012-05-08 20:36:35','2012-05-08 20:34:43','Francisco Dutra Sobrinho','','Fixo',NULL,'Boleto','AguardandoPagamento','napsic@uol.com.br','TRAVESSA ALMIRANTE WANDENKOLK','811','Entre J Balbi e Gov J Malcher - Sala 503','Nazaré','BELEM','PA','66055030','32303815',0.00,'mesapmk@gmail.com'),
 (241,'64D0B767F6EF4557A0D8E760B5CAA8A2','2012-05-10 11:20:15','2012-05-10 11:19:43','ICN Assessoria','','Fixo',NULL,'Boleto','AguardandoPagamento','icn@icn.srv.br','AVENIDA RUI BARBOSA','2000','sala 301','Alto Cajueiros','MACAE','RJ','27915012','27967121',0.00,'mesapmk@gmail.com'),
 (242,'64D0B767F6EF4557A0D8E760B5CAA8A2','2012-05-11 05:19:10','2012-05-10 11:19:43','ICN Assessoria','','Fixo',NULL,'Boleto','Aprovada','icn@icn.srv.br','AVENIDA RUI BARBOSA','2000','sala 301','Alto Cajueiros','MACAE','RJ','27915012','27967121',0.00,'mesapmk@gmail.com'),
 (243,'23649BDB39E84795AD2443F670F856D1','2012-05-11 08:30:10','2012-05-11 08:24:08','Núcleo de Ativid Psicoped Ltda','','Fixo',NULL,'Boleto','AguardandoPagamento','napsico@napsico.com.br','TRAVESSA ALMIRANTE WANDENKOLK','811','Ed. Vil. Millenium Sala 503','Nazaré','BELEM','PA','66055030','32303815',0.00,'mesapmk@gmail.com'),
 (244,'23649BDB39E84795AD2443F670F856D1','2012-05-12 04:24:14','2012-05-11 08:24:08','Núcleo de Ativid Psicoped Ltda','','Fixo',NULL,'Boleto','Aprovada','napsico@napsico.com.br','TRAVESSA ALMIRANTE WANDENKOLK','811','Ed. Vil. Millenium Sala 503','Nazaré','BELEM','PA','66055030','32303815',0.00,'mesapmk@gmail.com'),
 (245,'317C03E3A29849608C6FE15ED22BFC73','2012-05-15 06:50:08','2012-04-28 12:33:54','Luis Carlos Bassi','','Fixo',NULL,'Boleto','Completa','rhterra@uol.com.br','RUA EVARISTO SEVERINO DE ALMEIDA','2','210','Vila Cremonesi','ITATIBA','SP','13255481','99897454',0.00,'mesapmk@gmail.com'),
 (246,'902E30163DE24A6DAD61CC66258DC879','2012-05-18 09:28:13','2012-05-04 00:03:13','Ana Rita Aguiar da Silva','','Fixo',NULL,'CartaoCredito','Completa','aguiar.anarita@gmail.com','TRAVESSA RENATO PACHECO MARQUES','86','AP.102B','Fonseca','NITEROI','RJ','24120200','87558049',0.00,'mesapmk@gmail.com'),
 (247,'2BE3FD0DA4C34D13AFDB7BBAAF4A8AAB','2012-05-22 07:19:17','2012-05-08 20:34:43','Francisco Dutra Sobrinho','','Fixo',NULL,'Boleto','Cancelada','napsic@uol.com.br','TRAVESSA ALMIRANTE WANDENKOLK','811','Entre J Balbi e Gov J Malcher - Sala 503','Nazaré','BELEM','PA','66055030','32303815',0.00,'mesapmk@gmail.com'),
 (248,'8EA2C631C4A44A3785BD223E5C833D69','2012-05-23 21:27:56','2012-05-23 21:27:26','SANDRO FERRI GIUSTI','','Fixo',NULL,'CartaoCredito','Aprovada','sandrowestaa@hotmail.com','RUA CAIO PRADO','30','113','Consolação','SAO PAULO','SP','01303000','35623463',0.00,'mesapmk@gmail.com'),
 (249,'64D0B767F6EF4557A0D8E760B5CAA8A2','2012-05-25 05:47:10','2012-05-10 11:19:43','ICN Assessoria','','Fixo',NULL,'Boleto','Completa','icn@icn.srv.br','AVENIDA RUI BARBOSA','2000','sala 301','Alto Cajueiros','MACAE','RJ','27915012','27967121',0.00,'mesapmk@gmail.com'),
 (250,'23649BDB39E84795AD2443F670F856D1','2012-05-26 05:36:29','2012-05-11 08:24:08','Núcleo de Ativid Psicoped Ltda','','Fixo',NULL,'Boleto','Completa','napsico@napsico.com.br','TRAVESSA ALMIRANTE WANDENKOLK','811','Ed. Vil. Millenium Sala 503','Nazaré','BELEM','PA','66055030','32303815',0.00,'mesapmk@gmail.com'),
 (251,'8EA2C631C4A44A3785BD223E5C833D69','2012-06-06 21:37:16','2012-05-23 21:27:26','SANDRO FERRI GIUSTI','','Fixo',NULL,'CartaoCredito','Completa','sandrowestaa@hotmail.com','RUA CAIO PRADO','30','113','Consolação','SAO PAULO','SP','01303000','35623463',0.00,'mesapmk@gmail.com'),
 (252,'6848FDE5AD87461EA3A61B5E42E34C9E','2012-08-16 14:08:09','2012-08-16 14:04:52','Pamela Portes','','Fixo',NULL,'Boleto','AguardandoPagamento','panty_pantynha@yahoo.com.br','RUA MOREIRA CESAR','2100','','Pio X','CAXIAS DO SUL','RS','95034000','99129940',0.00,'mesapmk@gmail.com'),
 (253,'6848FDE5AD87461EA3A61B5E42E34C9E','2012-08-30 09:43:35','2012-08-16 14:04:52','Pamela Portes','','Fixo',NULL,'Boleto','Cancelada','panty_pantynha@yahoo.com.br','RUA MOREIRA CESAR','2100','','Pio X','CAXIAS DO SUL','RS','95034000','99129940',0.00,'mesapmk@gmail.com'),
 (254,'64FAF842AD9246CC863AA0312D1D69FF','2012-12-03 09:42:21','2012-12-03 09:41:00','rosangela dos santos carvalho','','Fixo',NULL,'Boleto','AguardandoPagamento','cmptransito@hotmail.com','RUA PERNAMBUCO','293','Apto 202','Jardim Vitória','ITABUNA','BA','45605510','99655561',0.00,'mesapmk@gmail.com'),
 (255,'32ABDB7FD7514A5DBD34A6FD319D5473','2012-12-03 09:48:08','2012-12-03 09:46:27','Kassia Possato','','Fixo',NULL,'Boleto','AguardandoPagamento','ctransito@hotmail.com','Rua Dorival Caimi','Casa n 660','Lote 06','Centro','LUIS EDUARDO MAGALHAES','BA','47850000','99655561',0.00,'mesapmk@gmail.com'),
 (256,'32ABDB7FD7514A5DBD34A6FD319D5473','2012-12-04 07:50:35','2012-12-03 09:46:27','Kassia Possato','','Fixo',NULL,'Boleto','Aprovada','ctransito@hotmail.com','Rua Dorival Caimi','Casa n 660','Lote 06','Centro','LUIS EDUARDO MAGALHAES','BA','47850000','99655561',0.00,'mesapmk@gmail.com'),
 (257,'64FAF842AD9246CC863AA0312D1D69FF','2012-12-04 08:08:24','2012-12-03 09:41:00','rosangela dos santos carvalho','','Fixo',NULL,'Boleto','Aprovada','cmptransito@hotmail.com','RUA PERNAMBUCO','293','Apto 202','Jardim Vitória','ITABUNA','BA','45605510','99655561',0.00,'mesapmk@gmail.com'),
 (258,'32ABDB7FD7514A5DBD34A6FD319D5473','2012-12-18 07:57:47','2012-12-03 09:46:27','Kassia Possato','','Fixo',NULL,'Boleto','Completa','ctransito@hotmail.com','Rua Dorival Caimi','Casa n 660','Lote 06','Centro','LUIS EDUARDO MAGALHAES','BA','47850000','99655561',0.00,'mesapmk@gmail.com'),
 (259,'64FAF842AD9246CC863AA0312D1D69FF','2012-12-18 08:36:16','2012-12-03 09:41:00','rosangela dos santos carvalho','','Fixo',NULL,'Boleto','Completa','cmptransito@hotmail.com','RUA PERNAMBUCO','293','Apto 202','Jardim Vitória','ITABUNA','BA','45605510','99655561',0.00,'mesapmk@gmail.com'),
 (260,'3BA9109E2F8842BDB5A2F291358517F1','2013-09-02 17:48:32','2013-09-01 23:01:46','Divo Batista De Paivajunior','','Fixo',NULL,'CartaoCredito','Aprovada','divojunior@hotmail.com','RUA DAS PITANGUEIRAS','lt 5','loja 08','Sul Águas Claras','BRASILIA','DF','71938540','81125697',0.00,'mesapmk@gmail.com'),
 (261,'3BA9109E2F8842BDB5A2F291358517F1','2013-09-16 17:57:38','2013-09-01 23:01:46','Divo Batista De Paivajunior','','Fixo',NULL,'CartaoCredito','Completa','divojunior@hotmail.com','RUA DAS PITANGUEIRAS','lt 5','loja 08','Sul Águas Claras','BRASILIA','DF','71938540','81125697',0.00,'mesapmk@gmail.com');
/*!40000 ALTER TABLE `retorno` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

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
 (21,'65.842.779000138','TESTERAZ','0001-01-01 00:00:00','a','','','9999999999','rua','9999','','999','RR','','9q@9.com','65.842.779000138','TESTERAZ',9,'99999-999','ISENTO',''),
 (22,'015.673.256-45','CRISTIAN GOMES','1988-09-28  00:00:00','1','Masculino','','9999999999','999999999','99999999999999','','999999999999999','MG','','cristian7@consuti.net','015.673.256-45','CRISTIAN GOMES',999999,'99999-999','mg12835428','mg12835428'),
 (23,'015.673.256-45','CRISTIAN GOMES','1988-09-28  00:00:00','1','Masculino','','9999999999','999999999','99999999999999','','999999999999999','MG','','cristian.gomes@cpmbraxis.com','015.673.256-45','CRISTIAN GOMES',999999,'99999-999','mg12835428','mg12835428'),
 (24,'034.720.536-40','KÁTIA CHRISTINA DA SILVA ROCHA ARAÚJO ÉLER','1977-09-26  00:00:00','kcsrocha','Feminino','','3134610910','Rua Santa Marta','Sagrada Familia','apto 403','Belo Horizonte','MG','','katiachristina@hotmail.com','034.720.536-40','KÁTIA CHRISTINA DA SILVA ROCHA ARAÚJO ÉLER',600,'31030-090','MG 8997048','MG 8997048'),
 (25,'11.107.625000173','EBER MOVEIS PROFISSIONAIS','0001-01-01  00:00:00','kitpmk','','','3133276879','Sergipe','Funcionários','606','Belo horizonte','MG','','ebereler@gmail.com','11.107.625000173','EBER MOVEIS PROFISSIONAIS',625,'30130-170','ISENTO',''),
 (26,'308.158.398-55','TATIANA DOS SANTOS SIMOES','1983-01-15  00:00:00','154216','Feminino','1496333268','1437622121','ataliba leonel ','CENTRO','','TAQUARITUBA','SP','psicóloga','thathy_santos@yahoo.com.br','308.158.398-55','TATIANA DOS SANTOS SIMOES',769,'18740-000','432567446','432567446'),
 (27,'013.690.046-13','FABIANA PEREIRA MAIA','1981-10-06  00:00:00','oppm20','Feminino','6192683272','6135637192','C 3 LOTE 01 ','TAGUATINGA CENTRO','APTO','TAGUATINGA','DF','PSICÓLOGA','fabianapmaia@gmail.com','013.690.046-13','FABIANA PEREIRA MAIA',711,'72010-030','10256013','10256013'),
 (28,'005.705.683-82','NELY SIQUEIRA CAMPOS NETA','1985-07-05  00:00:00','amandoeuele2','Feminino','','9832454695','RUA 04, QUADRA 14','IPEM SÃO CRISTOVÃO','','SÃO LUÍS','MA','PSICÓLOGA','nelyneta@yahoo.com.br','005.705.683-82','NELY SIQUEIRA CAMPOS NETA',13,'65055-000','126596319990','126596319990'),
 (29,'723.621.030-72','KIDIA SUZANA LEITE DA ROSA','1974-04-13  00:00:00','990534kk','Feminino','5381420700','5332713098','Av.Pinheiro Machado','Fragata','','Pelotas','RS','Psicólogo','kidarosa@hotmail.com','723.621.030-72','KIDIA SUZANA LEITE DA ROSA',1161,'96040-500','4052940048','4052940048'),
 (30,'006.935.330-13','CANDICE LIBRELOTTO DA ROSA','1984-09-19  00:00:00','psi1909','Feminino','5193116100','5133790200','Atanásio Belmonte','Boa Vista','804','Porto Alegre','RS','Psicóloga','candilibrelotto@bol.com.br','006.935.330-13','CANDICE LIBRELOTTO DA ROSA',71,'90520-550','5083795939','5083795939'),
 (31,'509.749.712-00','ARYANNE PEREIRA DE FREITAS','1980-01-10  00:00:00','100180','Feminino','6992736681','6932227244','Dr. Agenor Martins de Carvalho','Agenor de Carvalho','','Porto Velho','RO','psicóloga','aryannefrei@yahoo.com.br','509.749.712-00','ARYANNE PEREIRA DE FREITAS',1745,'76820-377','536947','536947'),
 (32,'022.686.899-05','ROBERTA CALEGARI FERNANDES','1971-08-29  00:00:00','luiza2005','Feminino','4196591996','4134342967','dalila Lopes costa','Uberaba','bl 06 Ap 03','Curitiba','PR','Psicóloga','calegari.fernandes@gmail.com','022.686.899-05','ROBERTA CALEGARI FERNANDES',108,'_____-___','4534048-5','4534048-5'),
 (33,'12.477.819000123','QUALLIS CONSULTORIA E TREINAMENTO LTDA','0001-01-01  00:00:00','300380','','3899038202','3835261287','Rua da Conferência','Centro','Casa A','Carbonita','MG','','migigliola@gmail.com','12.477.819000123','QUALLIS CONSULTORIA E TREINAMENTO LTDA',16,'39665-000','ISENTO',''),
 (34,'10.850.898000140','CLINICA DO VALE LTDA','0001-01-01  00:00:00','clinivale','','','7436121916','rua do paraiso','santo antonio','','juazeiro','BA','','clinivalejuazeiro@gmail.com.br','10.850.898000140','CLINICA DO VALE LTDA',97,'48903-050','ISENTO',''),
 (35,'03.225.174000140','INSTITUTO DE PSICOLOGIA MEDICA DE MATO GROSSO LTDA','0001-01-01  00:00:00','ipmat','','6781211081','6733823631','avenida mato grosso','centro','','campo grande','MS','','ipmat@uol.com.br','03.225.174000140','INSTITUTO DE PSICOLOGIA MEDICA DE MATO GROSSO LTDA',759,'79002-231','280995555','280995555'),
 (36,'293.764.908-43','AMA LÚCIA RAMALHO LIMA DA CRUZ','1981-05-08  00:00:00','caio25','Feminino','','1330137260','Dom Pedro II','Vila Nova','','Cubatão','SP','psicóloga','psicolucia@gmail.com','293.764.908-43','AMA LÚCIA RAMALHO LIMA DA CRUZ',509,'11520-040','33.877.772-6','33.877.772-6'),
 (37,'926.578.508-04','CLARICE APARECIDA FREDO','1955-11-24  00:00:00','Fredo*2011','Feminino','6699673063','6635751929','Ze do Ford','Aeroporto','casa','Peixoto de Azevedo','MT','Psicologa','clarpsico@gmail.com','926.578.508-04','CLARICE APARECIDA FREDO',117,'78530-000','6756374','6756374'),
 (38,'892.851.401-06','DIOGO RIVERA','1979-12-21  00:00:00','vida2010','Masculino','','6530230003','Los Angeles Qd.17','Jd.Califórnia','','Cuiabá','MT','','ayrtesmpr@uol.com.br','892.851.401-06','DIOGO RIVERA',10,'78070-400','1301025-5','1301025-5'),
 (39,'064.456.638-85','ISABELA BULGARELLI TONIOLI','1960-04-02  00:00:00','1935bela','Feminino','1991092449','1936522732','Capitão Silva Borges','Centro','','Aguaí','SP','psicóloga','ibtonioli@hotmail.com','064.456.638-85','ISABELA BULGARELLI TONIOLI',260,'13860-000','12466475','12466475'),
 (40,'083.443.816-06','LUCIANA VALÉRIA GARCIA LEITE','1986-12-02  00:00:00','84018028','Feminino','3384062469','3237437247','Fazenda São João Batista','Dornelas','Zona Rural','Orizânia','MG','Psicologa','lucianagarcia45@yahoo.com.br','083.443.816-06','LUCIANA VALÉRIA GARCIA LEITE',0,'36828-000','MG-14399250','MG-14399250'),
 (41,'442.432.431-15','MARIA DE JESUS SIQUEIRA DE ALMEIDA','1962-06-02  00:00:00','020662','Feminino','6584754077','6530252149','são bento ','Bau','apart 151','Cuiaba','MT','psicolga','siqueiramj62@hotmail.com','442.432.431-15','MARIA DE JESUS SIQUEIRA DE ALMEIDA',306,'78008-120','213151','213151'),
 (42,'000.113.577-54','LUCIANA MARIA TEIXEIRA RIBEIRO','1970-05-30  00:00:00','carmetran','Feminino','2178584865','2124271363','Estrada do Tindiba','jacarepaguá','bloco 01  apto 101','rj','RJ','Psicóloga','lucianamariapsi@yahoo.com.br','000.113.577-54','LUCIANA MARIA TEIXEIRA RIBEIRO',979,'22740-360','0519205','0519205'),
 (43,'14.118.275000139','C&S RECURSOS HUMANOS ','0001-01-01  00:00:00','hyzaar','','','2130210817','Rua Conde de Bonfim','Tijuca','sala 708','Rio de Janeiro','RJ','','cguedes@csrh.srv.br','14.118.275000139','C&S RECURSOS HUMANOS ',422,'20520-054','isento','isento'),
 (44,'13.280.776000154','APRIMORE CONSULTORIA LTDA','0001-01-01  00:00:00','bono19641987','','9881040708','9832362706','Rua da Geografia','Cohafuma','','Sao Luis','MA','','erivamjunior@gmail.com','13.280.776000154','APRIMORE CONSULTORIA LTDA',10,'65074-800','ISENTO',''),
 (45,'016.870.945-78','SILVANA VALVERDE RIBEIRO','1983-06-19  00:00:00','231200','Feminino','','7132461357','rua dos maristas ','dom avelar','e','salvador','BA','psicologa','silvanavribeiro@ig.com.br','016.870.945-78','SILVANA VALVERDE RIBEIRO',7,'41315-180','0721341004','0721341004'),
 (46,'045.836.004-02','CLÁUDIA ANDRADE STROBEL','1982-11-29  00:00:00','220827','Feminino','','8130346912','Abraham Lincoln','Parnamirim','Apt. 901','Recife','PE','Psicóloga','clastrobel@hotmail.com','045.836.004-02','CLÁUDIA ANDRADE STROBEL',137,'52060-190','5366863','5366863'),
 (47,'084.983.136-94','KAROLINE STÉFANE SARAIVA PERDIGÃO','1987-04-13  00:00:00','enilorak13','Feminino','3193330505','3138515128','BICAS','LOURDES','','JOAO MONLEVADE','MG','PSICOLOGA','karolinestefane@yahoo.com.br','084.983.136-94','KAROLINE STÉFANE SARAIVA PERDIGÃO',112,'35930-061','MG11028002','MG11028002'),
 (48,'12.873.126000150','PIRES BADARÓ LTDA','0001-01-01  00:00:00','6948','','','7736122999','19 de maio','Centro','Ortoclínica','Barreiras','BA','','adm.ortocli@yahoo.com.br','12.873.126000150','PIRES BADARÓ LTDA',192,'_____-___','ISENTO',''),
 (49,'07.376.336000100','INSTITUTO DE PSICOLOGIA ROCHA BRASIL LTDA.','0001-01-01  00:00:00','230263','','','1138980070','Araguari','Moema','Conj. 122  -  12º andar','São Paulo','SP','','rochabrasil@rochabrasil.com.br','07.376.336000100','INSTITUTO DE PSICOLOGIA ROCHA BRASIL LTDA.',817,'04514-041','ISENTO',''),
 (50,'827.557.103-06','RITA DE FÁTIMA ARAÚJO ALBERTO','1979-05-30  00:00:00','psicodoida123','Feminino','9888086591','9832444138','Rua 27 Qd. 56','Tirirical','Conj. Jd. São Cristovão II','São Luis ','MA','Psicologa','ritinha_prin@hotmail.com','827.557.103-06','RITA DE FÁTIMA ARAÚJO ALBERTO',3,'65055-346','209732946','209732946'),
 (51,'000.423.361-12','DAIENI MARLA SOARES DIAS','1982-03-28  00:00:00','204362','Feminino','','6641410560','Av Cuiaba','centro','','rondonopolis','MT','Psicóloga','daienidias@hotmail.com','000.423.361-12','DAIENI MARLA SOARES DIAS',1433,'78700-900','13454110','13454110'),
 (52,'489.737.936-91','RENATO SILVA DOS SANTOS','1964-12-26  00:00:00','ldp1igp2','Masculino','3188686641','314','Fernando Pereira Magalhães','Candelária','Casa 02','Belo Horizonte','MG','Psicólogo','renato@elipsy.com.br','489.737.936-91','RENATO SILVA DOS SANTOS',265,'31510-230','3003984','3003984'),
 (53,'033.772.528-43','DENISE FERNANDES VASCONCELOS','1957-03-11  00:00:00','1957','Masculino','6799817121','6730254995','BRASIL','MONTE CASTELO','','CAMPO GRANDE','MS','Psicóloga','denisefv@uol.com.br','033.772.528-43','DENISE FERNANDES VASCONCELOS',948,'79010-230','95578493','95578493'),
 (54,'029.676.199-06','VANESSA DE SOUZA MADEIRO','1979-12-27  00:00:00','esqueci','Feminino','4499363386','4436631437','Rua Getulio Vargas ','Centro','','Douradina ','PR','Psicóloga','nessamadeiro@hotmail.com','029.676.199-06','VANESSA DE SOUZA MADEIRO',420,'87485-000','29686383X','29686383X'),
 (55,'828.089.705-44','ROSANGELA DOS SANTOS CARVALHO','1981-03-20  00:00:00','rosangela','Feminino','7599655561','7336127275','Pernambuco','Jardim Vitória','Apt° 202','Itabuna','BA','Empresária','cmptransito@hotmail.com','828.089.705-44','ROSANGELA DOS SANTOS CARVALHO',293,'45605-510','0865379467','0865379467');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
