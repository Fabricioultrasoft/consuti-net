DROP TABLE IF EXISTS `institucional`;
CREATE TABLE `institucional` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(20000) NOT NULL,
  `data` datetime NOT NULL,
  `autor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(20000) NOT NULL,
  `autor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `servicos`;
CREATE TABLE `servicos` (
  `id` int(4) NOT NULL,
  `data` datetime NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(20000) NOT NULL,
  `autor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;