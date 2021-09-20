create database DBEXERCICIOS007;

use DBEXERCICIOS007;

create table computador(
	idcomputador int not null auto_increment,
    marca varchar(45),
    modelo varchar(45),
    
    primary key (idcomputador)
);

create table chamado(
	idchamado int not null auto_increment,
    descricao varchar(100),
    data date,
    hora time,
    solicitante varchar(30),
    idcomputador int not null,
    primary key (idchamado),
    foreign key (idcomputador) references computador (idcomputador)
);