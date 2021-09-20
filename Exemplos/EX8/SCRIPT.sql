create database dbexercicio008;

use dbexercicio008;

create table veiculo_computador(
	idveiculo int not null,
    iddocumento int not null,
    marca varchar(50),
    modelo varchar(50),
    ano_fabricacao int,
    placa varchar(10),
    renavam int,
    data date,
    cidade varchar(100),
    estado char(2),
    
    primary key (idveiculo, iddocumento)
);