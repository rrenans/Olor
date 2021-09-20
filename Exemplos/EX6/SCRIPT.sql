create database dbexercicio006;

use dbexercicio006;

create table cliente(
	idcliente int not null auto_increment,
    nome varchar(100),
    data_nascimento date,
    residencial_ddd int,
    residencial_numero int,
    celular_ddd int,
    celular_numero int,
    contato_ddd int,
    contato_numero int,
    contato_nome varchar(100),
    
    primary key (idcliente)

);