CREATE TABLE Usuarios_Autorizados
(
	Email VARCHAR(100) NOT NULL,
	PRIMARY KEY (Email),
	UNIQUE UQ_Usuarios_Autorizados_Email(Email)
) 
;


CREATE TABLE Log_Eventos
(
	ID INTEGER NOT NULL,
	ID_Usuario INTEGER,
	Data_Hora_Evento DATETIME NOT NULL,
	Evento TEXT NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Log_Eventos_ID(ID)
) 
;


CREATE TABLE Contato_SIT_PLAN
(
	ID INTEGER NOT NULL,
	ID_Contato INTEGER NOT NULL,
	ID_SIT_PLAN INTEGER NOT NULL,
	ID_Status_Pre_TA INTEGER NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Contato_SIT_PLAN_ID(ID),
	KEY (ID_Contato),
	KEY (ID_SIT_PLAN),
	KEY (ID_Status_Pre_TA)
) 
;


CREATE TABLE SIT_PLAN
(
	ID INTEGER NOT NULL,
	ID_Usuario INTEGER NOT NULL,
	Inicio DATETIME,
	Status VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_SIT_PLAN_ID(ID),
	KEY (ID_Usuario)
) 
;


CREATE TABLE Compromissos
(
	ID INTEGER NOT NULL,
	ID_Contato INTEGER NOT NULL,
	ID_Usuario INTEGER NOT NULL,
	Criar_Google_Agenda BOOL NOT NULL,
	Data DATE NOT NULL,
	Hora_Início TIME NOT NULL,
	Hora_Fim TIME NOT NULL,
	Mais_Informacoes TEXT,
	Preferencia_Contato VARCHAR(4),
	PRIMARY KEY (ID),
	UNIQUE UQ_Compromissos_ID(ID),
	KEY (ID_Contato),
	KEY (ID_Usuario)
) 
;


CREATE TABLE Tipo_Contato
(
	ID INTEGER NOT NULL,
	Tipo VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Tipo_Contato_ID(ID),
	UNIQUE UQ_Tipo_Contato_Tipo(Tipo)
) 
;


CREATE TABLE Usuario_Contato
(
	ID INTEGER NOT NULL,
	ID_Contato INTEGER NOT NULL,
	ID_Usuario INTEGER NOT NULL,
	Data_Cadastro DATETIME NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Usuario_Contato_ID(ID),
	KEY (ID_Contato),
	KEY (ID_Usuario)
) 
;


CREATE TABLE Status_Contato
(
	ID INTEGER NOT NULL,
	Status VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Status_Contato_ID(ID),
	UNIQUE UQ_Status_Contato_Status(Status)
) 
;


CREATE TABLE Usuario
(
	ID INTEGER NOT NULL AUTO_INCREMENT,
	AgendaGoogleEmail VARCHAR(100),
	AgendaGoogleSenha VARCHAR(100),
	Email VARCHAR(100) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Telefone VARCHAR(20),
	PRIMARY KEY (ID),
	UNIQUE UQ_Usuario_Email(Email),
	UNIQUE UQ_Usuario_ID(ID)
) 
;


CREATE TABLE Contato
(
	ID INTEGER NOT NULL AUTO_INCREMENT,
	ID_Contato_Recomendante INTEGER NOT NULL,
	ID_Status_Contato INTEGER NOT NULL,
	ID_Tipo_Contato INTEGER NOT NULL,
	Cidade VARCHAR(100),
	Email VARCHAR(100),
	Estado_Civil VARCHAR(50),
	Filhos INTEGER,
	Idade INTEGER,
	Nome VARCHAR(100) NOT NULL,
	Outras_Informacoes TEXT,
	Profissao VARCHAR(100),
	Sexo CHAR(1) NOT NULL,
	Telefone_Alternativo_1 VARCHAR(20),
	Telefone_Alternativo_2 VARCHAR(20),
	Telefone_Principal VARCHAR(20),
	UF VARCHAR(2),
	PRIMARY KEY (ID),
	UNIQUE UQ_Contato_ID(ID),
	KEY (ID_Contato_Recomendante),
	KEY (ID_Tipo_Contato)
) 
;
