CREATE TABLE `produto` (
  `ID` int(4) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `PRECO_UNIDADE` int(12) NOT NULL,
  `DESCRICAO` varchar(200) NOT NULL,
  `QTD_ESTOQUE` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `ID` int(4) NOT NULL,
  `CPF` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `DATA_NASC` datetime NOT NULL,
  `SENHA` varchar(20) NOT NULL,
  `SEXO` char(1) DEFAULT NULL,
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `pedido` (
  `ID` int(4) NOT NULL,
  `ID_USUARIO` int(4) NOT NULL,
  `DATA_PEDIDO` datetime NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `pedido_ibfk_1` (`ID_USUARIO`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `item_pedido` (
  `ID_PEDIDO` int(4) NOT NULL,
  `ID_PRODUTO` int(4) NOT NULL,
  `QTD_PEDIDO` int(11) NOT NULL,
  KEY `item_pedido_ibfk_1` (`ID_PEDIDO`),
  KEY `item_pedido_ibfk_2` (`ID_PRODUTO`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedido` (`ID`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`ID_PRODUTO`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `banner` (
  `ID` int(4) NOT NULL,
  `DESCRICAO` varchar(200) NOT NULL,
  `DATA` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
