drop database if exists dbexercicio14;

create database dbexercicio14;

use dbexercicio14;

create table cliente(
	idcliente int not null auto_increment,
    primary key (idcliente)
);

create table filial(
	idfilial int not null auto_increment,
    primary key (idfilial)
);

create table funcionario(
	idfuncionario int not null auto_increment,
    primary key (idfuncionario)
);

create table projeto(
	idprojeto int not null auto_increment,
    primary key (idprojeto)
);

create table projeto_funcionario(
	idprojeto int not null,
    idfuncionario int not null,
    primary key (idprojeto, idfuncionario),
    foreign key (idprojeto) references projeto (idprojeto),
    foreign key (idfuncionario) references funcionario (idfuncionario)
);