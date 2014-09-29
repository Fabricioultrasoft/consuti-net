CREATE TABLE `usuarios_autorizados` (
  `Email` varchar(100) NOT NULL,
  `Admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Email`),
  UNIQUE KEY `UQ_Usuarios_Autorizados_Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `log_eventos` (
  `ID` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Data_Hora_Evento` datetime NOT NULL,
  `Evento` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Log_Eventos_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `status_contato` (
  `ID` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Status_Contato_ID` (`ID`),
  UNIQUE KEY `UQ_Status_Contato_Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tipo_contato` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Tipo_Contato_ID` (`ID`),
  UNIQUE KEY `UQ_Tipo_Contato_Tipo` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

CREATE TABLE `contato` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Contato_Recomendante` int(11) NOT NULL,
  `ID_Status_Contato` int(11) NOT NULL,
  `ID_Tipo_Contato` int(11) NOT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Estado_Civil` varchar(50) DEFAULT NULL,
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
  KEY `Status_Contato` (`ID_Status_Contato`),
  CONSTRAINT `Recomendante_Contato` FOREIGN KEY (`ID_Contato_Recomendante`) REFERENCES `contato` (`ID`),
  CONSTRAINT `Status_Contato` FOREIGN KEY (`ID_Status_Contato`) REFERENCES `status_contato` (`ID`),
  CONSTRAINT `Tipo_Contato` FOREIGN KEY (`ID_Tipo_Contato`) REFERENCES `tipo_contato` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Contato_Compromisso` FOREIGN KEY (`ID_Contato`) REFERENCES `contato` (`ID`),
  CONSTRAINT `Usuario_Compromisso` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sit_plan` (
  `ID` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Inicio` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_SIT_PLAN_ID` (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Usuario_Sit_plan` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `contato_sit_plan` (
  `ID` int(11) NOT NULL,
  `ID_Contato` int(11) NOT NULL,
  `ID_SIT_PLAN` int(11) NOT NULL,
  `ID_Status_Pre_TA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Contato_SIT_PLAN_ID` (`ID`),
  KEY `ID_Contato` (`ID_Contato`),
  KEY `ID_SIT_PLAN` (`ID_SIT_PLAN`),
  KEY `ID_Status_Pre_TA` (`ID_Status_Pre_TA`),
  CONSTRAINT `Contato_SitPLAN` FOREIGN KEY (`ID_Contato`) REFERENCES `contato` (`ID`),
  CONSTRAINT `SitPlan_TA` FOREIGN KEY (`ID_SIT_PLAN`) REFERENCES `sit_plan` (`ID`),
  CONSTRAINT `Status_Contato_pre_ta` FOREIGN KEY (`ID_Status_Pre_TA`) REFERENCES `status_contato` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario_contato` (
  `ID` int(11) NOT NULL,
  `ID_Contato` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Data_Cadastro` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Usuario_Contato_ID` (`ID`),
  KEY `ID_Contato` (`ID_Contato`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Contato_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `Usuario_Contato` FOREIGN KEY (`ID_Contato`) REFERENCES `contato` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

