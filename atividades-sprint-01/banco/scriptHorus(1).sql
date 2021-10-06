DROP DATABASE Horus;

CREATE DATABASE Horus;

USE  Horus;

-- -----------------------------------------------------
-- Table `Empresa`
-- -----------------------------------------------------
CREATE TABLE Empresa (
  idEmpresa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CNPJ CHAR(14) NULL,
  razaoSocial VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  cep CHAR(9) NULL,
  uf CHAR(2) NULL,
  cidade VARCHAR(100) NULL,
  bairro VARCHAR(100) NULL,
  lougadouro VARCHAR(100) NULL,
  numero INT NULL,
  complemento VARCHAR(100) NULL
  );
  
  insert into Empresa values(
  
  );
  
  -- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE Telefone (
  idtelefone INT NOT NULL PRIMARY KEY,
  Telefone VARCHAR(13) NULL,
  tipo VARCHAR(50),
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
  );


-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
CREATE TABLE Funcionario (
  idFuncionario INT NOT NULL PRIMARY KEY,
  nomeFuncionario VARCHAR(200) NULL,
  email VARCHAR(200) NULL,
  senha VARCHAR(200) BINARY NULL,
  pausa1Hora TIME,
  pausa2Hora TIME,
  almocoHora TIME,
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
  fkSupervisor INT NOT NULL,
  FOREIGN KEY (fkSupervisor) REFERENCES Funcionario (idFuncionario)
  );
  

-- -----------------------------------------------------
-- Table `Maquina`
-- -----------------------------------------------------
CREATE TABLE Maquina (
  idMaquina INT NOT NULL PRIMARY KEY,
  hostname VARCHAR(30) NULL,
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
  );

   
-- -----------------------------------------------------
-- Table `Acessos`
-- -----------------------------------------------------  
CREATE TABLE Acessos (
fkFuncionario INT NOT NULL,
FOREIGN KEY (fkFuncionario) REFERENCES Funcionario (idFuncionario),
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
PRIMARY KEY (fkFuncionario, fkMAquina),
url VARCHAR (200),
dataHora DATETIME 
);


-- -----------------------------------------------------
-- Table `mydb`.`Monitoramento`
-- -----------------------------------------------------
CREATE TABLE Monitoramento (
  idOcorrencia INT NOT NULL PRIMARY KEY,
  fkMaquina INT NOT NULL,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
  dataHora DATETIME,
  processador FLOAT(2,1),
  disco FLOAT(2,1),
  ram FLOAT(2,1),
  timeLogi TIME
);

