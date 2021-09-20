-- criando o banco de dados
set sql_safe_updates = 0;

drop database if exists dbserie;
create database dbserie;
use dbserie;

-- criação das tabelas
create table usuario(
	idusuario int not null auto_increment,
    nome varchar(45),
    email varchar(45),
    primary key(idusuario)
);

create table episodio(
	idepisodio int not null auto_increment,
    nome varchar(45),
    temporada int,
    numero int,
    duracao time,
    primary key(idepisodio)
);

create table acesso(
	idacesso int not null auto_increment,
    idusuario int,
    idepisodio int,
    data date,
    hora time,
    tempo time,
    primary key(idacesso),
    foreign key(idusuario) references usuario(idusuario),
    foreign key(idepisodio) references episodio(idepisodio)
);

-- inserindo dados
insert into usuario(nome, email) values ('Maria Helena', 'maria@internet.com');
insert into usuario(nome, email) values ('Carlos Alberto', 'calor@internet.com');
insert into usuario(nome, email) values ('João da Silva', 'joao@internet.com');

select * from usuario;

insert into episodio(nome, temporada, numero, duracao) values ('Piloto', 1, 1, '55');
insert into episodio(nome, temporada, numero, duracao) values ('o Encontro', 1, 2, '50');
insert into episodio(nome, temporada, numero, duracao) values ('Desaparecido', 1, 3, '47');
insert into episodio(nome, temporada, numero, duracao) values ('Investigados', 2, 4, '58');
insert into episodio(nome, temporada, numero, duracao) values ('Revelação', 2, 5, '49');
insert into episodio(nome, temporada, numero, duracao) values ('Justiça', 2, 6, '59');

select * from episodio;

insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 1, '2016-06-18', '20:00', '00:50');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 2, '2016-06-20', '19:30', '00:49');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (2, 1, '2016-06-20', '21:00', '00:32');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (3, 1, '2016-07-01', '21:45', '00:50');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (2, 5, '2016-06-20', '21:09', '00:49');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 3, '2016-06-20', '19:23', '00:46');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (3, 2, '2016-07-01', '21:41', '00:49');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 4, '2016-06-20', '20:25', '00:58');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 6, '2016-06-20', '21:30', '00:55');
insert into acesso(idusuario, idepisodio, data, hora, tempo) values (1, 5, '2016-06-21', '19:02', '00:49');

select * from acesso;

-- Questão 01, consulta
select
	usuario.idusuario,
    usuario.nome,
    acesso.idacesso,
    acesso.data,
    acesso.hora,
    episodio.idepisodio,
    episodio.nome,
    episodio.numero,
    episodio.temporada
from
	usuario
    inner join acesso on
    usuario.idusuario = acesso.idusuario
    inner join episodio on
    episodio.idepisodio = acesso.idepisodio
where
	acesso.data between 2016-07-01 and 2016-07-31
order by
	usuario.nome,
    idepisodio;
    
-- Questão 02, consulta
select
	usuario.idusuario,
    usuario.nome,
    usuario.email,
    idepisodio
from
	usuario
    inner join acesso on
    usuario.idusuario = acesso.idusuario;

-- Questão 03, consulta
select
	episodio.temporada,
    sum(episodio.duracao) soma_episodio
from
	episodio
group by
	episodio.temporada;
        
-- Questão 04, consulta
select
	usuario.nome,
    usuario.email,
    count(episodio.numero) qtde_episodio,
    episodio.numero
from 
	usuario
    inner join acesso on
    usuario.idusuario = acesso.idusuario    
	inner join episodio on
    episodio.idepisodio = acesso.idepisodio
where
	episodio.numero > 5
group by
	usuario.nome,
    usuario.email
order by
	episodio.numero;
    
-- Questão 05, consulta
select
	episodio.temporada,
    count(episodio.idepisodio) qtde_episodio,
    count(acesso.idacesso) qtde_acesso,
    count(usuario.idusuario) qtde_usuario
from
	usuario
    inner join acesso on
    usuario.idusuario = acesso.idusuario
    inner join episodio on
    episodio.idepisodio = acesso.idepisodio
group by
	episodio.temporada;
-- Minha consulta não está certa, tentei fazer subquery, mas não deu