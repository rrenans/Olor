drop database if exists dbexercicio005;

create database dbexercicio005;

use dbexercicio005;

create table aluno(
	idaluno int not null auto_increment,
    nome varchar(100),
    idade varchar(3),
    endereco_tipo varchar(15),
    rua varchar(100),
    numero int,
    bairro varchar(100),
    cidade varchar(100),
    estado char(2),
    cep varchar(30),
    logradouro varchar(100),
	
    primary key (idaluno)
);