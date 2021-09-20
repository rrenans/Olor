drop database if exists dbcervejaria;

create database dbcervejaria;

use dbcervejaria;

create table cerveja(
	idcerveja int not null auto_increment,
    nome varchar(15),
    tipo varchar(15),
    primary key(idcerveja)
);

create table producao(
	idproducao int not null auto_increment,
    regiao_fabricada varchar(40),
    primary key(idproducao),
    idcerveja int,
    foreign key(idcerveja) references cerveja(idcerveja)
);

insert into cerveja(idcerveja, nome, tipo) values (1, 'Skol', 'Puro Malte');
insert into cerveja(idcerveja, nome, tipo) values (2, "Beck's", 'Lager');

insert into producao(idproducao, regiao_fabricada, idcerveja) values (1, 'Dinamarca', 1);
insert into producao(idproducao, regiao_fabricada, idcerveja) values (2, 'Alemanha', 2);

select * from cerveja;
select * from producao;
