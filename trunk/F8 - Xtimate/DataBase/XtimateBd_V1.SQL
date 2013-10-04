CREATE TABLE Usuario
(
	ID INT NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Senha VARCHAR(20) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Usuario_Email(Email),
	UNIQUE UQ_Usuario_ID(ID)
) 
;

CREATE TABLE Complexidade
(
	ID INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	FatorPeso DOUBLE(10,2) NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Complexidade_Nome(Nome),
	UNIQUE UQ_Complexidade_ID(ID)
) 
;


CREATE TABLE ItemTrabalho
(
	ID INT NOT NULL,
	Nome VARCHAR(100),
	Descricao VARCHAR(300),
	ValorEsforcoEstimado DOUBLE(10,2),
	ValorEsforcoReal DOUBLE(10,2),
	ComplexidadeID INT NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_ItemDeTrabalho_ID(ID),
	KEY (ComplexidadeID)
) 
;


CREATE TABLE ItemTrabalho_SubItemTrabalho
(
	ID INT NOT NULL,
	SubItemTrabalhoID INT NOT NULL,
	ItemTrabalhoID INT NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_ItemTrabalho_SubItemTrabalho_ID(ID),
	KEY (ItemTrabalhoID),
	KEY (SubItemTrabalhoID)
) 
;


CREATE TABLE Projeto
(
	ID INT NOT NULL,
	UsuarioID INT NOT NULL,
	DataInicioEstimado DATETIME,
	Nome VARCHAR(100) NOT NULL,
	TipoEstimativaID INT NOT NULL,
	ComplexidadeID INT NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Projetos_ID(ID),
	KEY (ComplexidadeID),
	KEY (TipoEstimativaID),
	KEY (UsuarioID)
) 
;


CREATE TABLE Projeto_ItemTrabalho
(
	ID INT NOT NULL,
	ItemTrabalhoID INT NOT NULL,
	ProjetoID INT NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE UQ_Projeto_ItemTrabalho_ID(ID),
	KEY (ItemTrabalhoID),
	KEY (ProjetoID)
) 
;


CREATE TABLE SubItemTrabalho
(
	ID INT NOT NULL,
	Nome VARCHAR(100),
	ValorEsforcoEstimado DOUBLE(10,2) NOT NULL,
	ValorEsforcoReal DOUBLE(10,2),
	Descricao VARCHAR(300),
	PRIMARY KEY (ID),
	UNIQUE UQ_SubItemTrabalho_ID(ID)
) 
;


CREATE TABLE TipoEstimativa
(
	ID INT NOT NULL,
	Nome VARCHAR(100),
	PRIMARY KEY (ID),
	UNIQUE UQ_TipoEstimativa_ID(ID),
	UNIQUE UQ_TipoEstimativa_Nome(Nome)
) 
;
