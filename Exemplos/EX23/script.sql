DROP DATABASE IF EXISTS DBCOMERCIO;

CREATE DATABASE DBCOMERCIO;
USE DBCOMERCIO;

CREATE TABLE VENDAS (
	IDVENDA INT NOT NULL AUTO_INCREMENT,
	DT_VENDA DATE ,
	IDCLIENTE INT NOT NULL,
	NOME VARCHAR(45) ,
	TELEFONE VARCHAR(50) ,
	DTNASCIMENTO DATE ,
	IDPRODUTO INT NOT NULL,
	DESCRICAO VARCHAR(45) ,
	PRECO DECIMAL(8,2) ,
	QTDE INT ,
	TOTAL DECIMAL(8,2), 
	PRIMARY KEY (IDVENDA)
);

INSERT INTO VENDAS (DT_VENDA, IDCLIENTE, NOME, TELEFONE, DTNASCIMENTO, IDPRODUTO, DESCRICAO, PRECO, QTDE, TOTAL)
SELECT     
	DT_VENDA,
	IDCLIENTE,
	NOME,
	TELEFONE,
	DTNASCIMENTO,
    IDPRODUTO,
	DESCRICAO,
	PRECO,
	QTDE,
	PRECO * QTDE AS TOTAL 
FROM (
    
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA UNION 
SELECT DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 DAY) AS DT_VENDA ) AS VENDA,  
(
SELECT 01 AS IDCLIENTE, 'JOÃO' AS NOME, '1111-1111' AS TELEFONE, DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 YEAR) DTNASCIMENTO UNION 
SELECT 02 AS IDCLIENTE, 'MARIA' AS NOME, '2222-2222' AS TELEFONE, DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 YEAR) DTNASCIMENTO UNION 
SELECT 03 AS IDCLIENTE, 'ANTONIO' AS NOME, '3333-3333' AS TELEFONE, DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 YEAR) DTNASCIMENTO UNION 
SELECT 04 AS IDCLIENTE, 'ANA' AS NOME, '4444-4444' AS TELEFONE, DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 YEAR) DTNASCIMENTO UNION 
SELECT 05 AS IDCLIENTE, 'JOAQUINA' AS NOME, '5555-5555' AS TELEFONE, DATE_ADD(DATE(NOW()), INTERVAL RAND() * -100 YEAR) DTNASCIMENTO) AS CLIENTE,
(
SELECT 1 AS IDPRODUTO, 'TELEFONE' AS DESCRICAO, RAND() * 1000 AS PRECO UNION 
SELECT 2 AS IDPRODUTO, 'CALCULADORA' AS DESCRICAO, RAND() * 1000 AS PRECO UNION 
SELECT 3 AS IDPRODUTO, 'COMPUTADOR' AS DESCRICAO, RAND() * 1000 AS PRECO UNION 
SELECT 4 AS IDPRODUTO, 'FONE' AS DESCRICAO, RAND() * 1000 AS PRECO UNION 
SELECT 5 AS IDPRODUTO, 'BATERIA' AS DESCRICAO, RAND() * 1000 AS PRECO UNION 
SELECT 6 AS IDPRODUTO, 'TV' AS DESCRICAO, RAND() * 1000 AS PRECO) AS PRODUTO,

(SELECT ROUND(RAND() * 10, 0) + 1 AS QTDE UNION
SELECT ROUND(RAND() * 10, 0) + 1 AS QTDE UNION
SELECT ROUND(RAND() * 10, 0) + 1 AS QTDE UNION
SELECT ROUND(RAND() * 10, 0) + 1 AS QTDE UNION
SELECT ROUND(RAND() * 10, 0) + 1 AS QTDE ) AS QTDE
ORDER BY
	RAND();


SELECT * FROM VENDAS;

create table cliente(
	idcliente int not null,
    nome varchar(45),
    telefone varchar(15),
    dtnascimento date,
    primary key(idcliente)
);

insert into cliente(idcliente, nome, telefone, dtnascimento)
select distinct idcliente, nome, telefone, dtnascimento from vendas;

select * from cliente;

create table venda(
	idvenda int not null,
	dt_venda date,
    idcliente int,
    primary key(idvenda),
    foreign key(idcliente) references cliente(idcliente)
);

insert into venda(idvenda, dt_venda, idcliente)
select distinct idvenda, dt_venda, idcliente from vendas;

select * from venda;

create table produto(
	idproduto int not null,
    descricao varchar(45),
    preco numeric(8,2),
    primary key(idproduto)
);

insert into produto(idproduto, descricao, preco)
select distinct idproduto, descricao, preco from vendas;

select * from produto;	

create table venda_produto(
	idvenda int not null,
    idproduto int not null,
    qtde int,
    primary key(idvenda, idproduto),
    foreign key(idvenda) references venda(idvenda),
    foreign key(idproduto) references produto(idproduto)
);

insert into venda_produto(idvenda, idproduto, qtde)
select distinct idvenda, idproduto, qtde from vendas;

select * from venda_produto;