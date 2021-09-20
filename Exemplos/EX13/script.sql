create database dbexercicio013;

use dbexercicio013;

create table vitima(
	idvitimida int not null auto_increment,
    nome varchar(100),
    cpf char(11),
    primary key(idvitima)
);

create table criminoso(
	idcriminoso int not null auto_increment,
    nome varchar(100),
    cpf char(11),
    primary key(idcriminoso)
);

create table crime(
	idcrime int not null auto_increment,
    tipo varchar(100),
    dtcrime date,
    primary key(idcrime)
);

create table arma(
	idarma int not null auto_increment,
    tipo varchar(100),
    identificacao int,
    primary key(idarma)
);

create table atacar(
	idcriminoso int not null,
    idvitima int not null,
    primary key(idcriminoso, idvitima),
    foreign key(idcriminoso) references criminoso (idcriminoso),
    foreign key(idvitimia) references vitima (idvitima)
);

create table sofrer(
	idcrime int not null,
    idvitima int not null,
    primary key(idcrime, idvitima),
    foreign key(idcrime) references crime(idcrime),
    foreign key(idvitimia) references vitima(idvitima)
);

create table cometer(
	idcrime int not null,
    idcriminoso int not null,
    primary key(idcrime, idcriminoso),
    foreign key(idcrime) references crime(idcrime),
    foreign key(idcriminoso) references criminoso(idcriminoso)
);

create table usar(
	idcrime int not null,
    idarma int not null,
    primary key(idcrime, idarma),
    foreign key(idcrime) references crime(idcrime),
    foreign key(idarma) references arma(idarma)
);
