DROP DATABASE IF EXISTS DBELEICAO;

CREATE DATABASE DBELEICAO;

USE DBELEICAO;

CREATE TABLE PARTIDO(
	IDPARTIDO INT PRIMARY KEY,
	NOME VARCHAR(255),
	SIGLA VARCHAR(10)
);

CREATE TABLE CANDIDATO(
	IDCANDIDADTO INT NOT NULL,
	IDPARTIDO INT, 
	NOME VARCHAR(255),
	RUA VARCHAR(100),
	CEP VARCHAR(8),
	CIDADE VARCHAR(100),
	ESTADO CHAR(2),
	FOREIGN KEY (IDPARTIDO) REFERENCES PARTIDO(IDPARTIDO)
);

drop table candidato;
drop table partido;

CREATE TABLE FUNCIONARIO (
	FUNCIONARIO INT PRIMARY KEY,
	IDPARTIDO INT NOT NULL,
	DESCRICAO VARCHAR (100)
);

alter table funcionario drop column funcionario,
add idfuncionario int not null auto_increment,
add nome varchar(100),
add cpf char(11),
add senha varchar(45),
drop idpartido,
drop descricao,
add primary key(idfuncionario),
add iddepartamento int;

CREATE TABLE USUARIO (
  LOGIN VARCHAR(100),
  SENHA VARCHAR(255),
  EMAIL VARCHAR(100)
);

drop table usuario;

CREATE TABLE SETOR(
	IDSETOR INT NOT NULL,
	NOME VARCHAR(100)
);

rename table setor to departamento;
alter table departamento add iddepartamento int not null auto_increment,
drop idsetor,
add primary key(iddepartamento);

alter table funcionario add foreign key(iddepartamento) references departamento(iddepartamento);

CREATE TABLE FUNCAO(
	DESCRICAO VARCHAR(100)
);

rename table funcao to cargo;
alter table cargo add idcargo int not null auto_increment,
add primary key(idcargo);

CREATE TABLE PARTICIPA(
	IDFUNCAO INT,
	IDUSUARIO INT
);

CREATE TABLE VOTAR(
	IDELEICAO INT PRIMARY KEY,
	IDUSUARIO INT,
	IDCANDIDATO INT,
	DT_VOTO DATETIME
);

alter table votar drop ideleicao,
drop idusuario,
drop idcandidato; 

CREATE TABLE ELEICAO (
	IDELEICAO INT NOT NULL,
	TITULO VARCHAR(100),
	DT_INICIO DATETIME,
	DT_FIM DATETIME,
	PRIMARY KEY (IDELEICAO)
);

alter table eleicao change column ideleicao ideleicao int not null auto_increment;

create table chapa(
	idchapa int not null auto_increment,
    ideleicao int,
    nome varchar(100),
    primary key (idchapa),
    foreign key (ideleicao) references eleicao(ideleicao)
);

alter table participa drop idfuncao,
add idfuncionario int not null,
drop idusuario,
add  idchapa int not null,
add idcargo int not null,
add primary key(idfuncionario, idchapa),
add foreign key(idcargo) references cargo (idcargo),
add foreign key (idchapa) references chapa (idchapa),
add foreign key (idfuncionario) references funcionario (idfuncionario);

alter table votar add ideleicao int not null,
add idfuncionario int not null,
add idchapa int not null,
add primary key(ideleicao, idfuncionario),
add foreign key (ideleicao) references eleicao (ideleicao),
add foreign key (idfuncionario) references funcionario (idfuncionario),
add foreign key (idchapa) references chapa(idchapa);