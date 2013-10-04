CREATE TABLE `emailsbloqueados` (
  `Email` varchar(100) NOT NULL,
  `CodDesbloqueio` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `contadoracesso` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `IP` varchar(20) DEFAULT NULL,
  `Data` datetime NOT NULL,
  `Tela` varchar(20) NOT NULL,
  `BrowsertName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `anonimail` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `EmailDestinatario` varchar(100) NOT NULL,
  `Texto` text NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `CodEnvio` varchar(50) NOT NULL,
  `DataEnvio` datetime NOT NULL,
  `EmailResposta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


