drop database if exists dbexercicio018;

create database dbexercicio018;

use dbexercicio018;

create table departamento(
	iddepartamento int not null auto_increment,
    nome varchar(45),
    iddepartamento_pertence int,
    primary key (iddepartamento),
    foreign key (iddepartamento_pertence) references departamento (iddepartamento)
);

create table funcionario (
	idfuncionario int not null auto_increment,
    nome varchar(45),
    dt_admissao date,
    telefone int,
    iddepartamento int not null,
    primary key (idfuncionario),
    foreign key (iddepartamento) references departamento (iddepartamento)
);