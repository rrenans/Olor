SET SQL_SAFE_UPDATES = 0;

DROP DATABASE IF EXISTS DBCANTINA;
CREATE DATABASE DBCANTINA;

USE DBCANTINA;

CREATE TABLE CLIENTE (
	IDCLIENTE INT NOT NULL AUTO_INCREMENT
	, NOME VARCHAR(100)
	, SEXO CHAR(1)
	, PRIMARY KEY (IDCLIENTE)
);

CREATE TABLE PRODUTO (
	IDPRODUTO INT NOT NULL AUTO_INCREMENT
	, NOME VARCHAR(100)
	, PRECO NUMERIC(8,2)
	, CATEGORIA VARCHAR(50)
	, PRIMARY KEY (IDPRODUTO)
);

CREATE TABLE PEDIDO (
	IDPEDIDO INT NOT NULL AUTO_INCREMENT
	, IDCLIENTE INT NOT NULL
	, DTPEDIDO DATE
	, PRIMARY KEY(IDPEDIDO)
	, FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE)
);

CREATE TABLE ITEM_PEDIDO (
	IDPEDIDO INT NOT NULL 
	, IDPRODUTO INT NOT NULL
	, QTDE INT
	, PRECO_UNITARIO NUMERIC(8,2)
	, PRIMARY KEY (IDPEDIDO, IDPRODUTO)
	, FOREIGN KEY (IDPEDIDO) REFERENCES PEDIDO (IDPEDIDO)
	, FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO (IDPRODUTO)
);

INSERT INTO CLIENTE (NOME, SEXO)VALUES('JOAO', 'M');
INSERT INTO CLIENTE (NOME, SEXO)VALUES('MARIA', 'F');
INSERT INTO CLIENTE (NOME, SEXO)VALUES('ANA', 'F');
INSERT INTO CLIENTE (NOME, SEXO)VALUES('CARLOS', 'M');
INSERT INTO CLIENTE (NOME, SEXO)VALUES('ANTONIO', 'M');

INSERT INTO PRODUTO (NOME, PRECO, CATEGORIA)VALUES('BOLO DE CHOCOLATE', 2.5, 'DOCE');
INSERT INTO PRODUTO (NOME, PRECO, CATEGORIA)VALUES('BOLO DE CENOURA', 2.5, 'DOCE');
INSERT INTO PRODUTO (NOME, PRECO, CATEGORIA)VALUES('SUCO DE LARANJA', 3.0, 'SUCO');
INSERT INTO PRODUTO (NOME, PRECO, CATEGORIA)VALUES('SUCO DE MORANGO', 4.0, 'SUCO');
INSERT INTO PRODUTO (NOME, PRECO, CATEGORIA)VALUES('MISTO QUENTE', 1.5, 'SALGADO');

INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(1, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(1, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(3, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(1, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(1, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(5, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(3, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(5, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(1, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));
INSERT INTO PEDIDO (IDCLIENTE, DTPEDIDO)VALUES(2, DATE_ADD(NOW(), INTERVAL RAND() * - 100 DAY));

INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (01, 1, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (02, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (03, 3, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (01, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (02, 1, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (04, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (05, 5, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (06, 1, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (05, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (07, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (08, 3, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (11, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (12, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (10, 3, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (11, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (09, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (09, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (10, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (11, 5, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (12, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (10, 5, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (11, 1, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (14, 2, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (15, 5, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (13, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (14, 4, RAND() * 10);
INSERT INTO ITEM_PEDIDO (IDPEDIDO, IDPRODUTO, QTDE)VALUES (15, 3, RAND() * 10);

UPDATE ITEM_PEDIDO AS PED
SET PRECO_UNITARIO = (SELECT PRECO FROM PRODUTO WHERE IDPRODUTO = PED.IDPRODUTO);

-- Questão 01
select *
from
	cliente
    inner join pedido on
    pedido.idcliente = cliente.idcliente
;

-- Questão 02
select *
from
	produto
    inner join item_pedido on
    item_pedido.idproduto = produto.idproduto
;

-- Questão 03
select *
from
	pedido
    inner join item_pedido on
    item_pedido.idpedido = pedido.idpedido
;

-- Questão 04
select *
from
	pedido
    inner join item_pedido on
    item_pedido.idpedido = pedido.idpedido
    inner join produto on
    item_pedido.idproduto = produto.idproduto
;

-- Questão 05
select *
from
	cliente
    inner join pedido on
    pedido.idcliente = cliente.idcliente
    inner join item_pedido on
    pedido.idpedido = item_pedido.idpedido
;
	
-- Questão 06
select *
from
	cliente
    inner join pedido on
    pedido.idcliente = cliente.idcliente
    inner join item_pedido on
    pedido.idpedido = item_pedido.idpedido
    inner join produto on
    item_pedido.idproduto = produto.idproduto
;

-- Questão 07
select
	cliente.sexo,
    count(cliente.idcliente)
from
	cliente
group by
	cliente.sexo
;

-- Questão 08
select
    produto.nome,
    produto.preco
from
	produto
group by
	produto.nome,
    produto.preco
;

-- Questão 09
select 
	produto.categoria, 
    count(produto.idproduto), 
    avg(produto.preco)
from 
	produto
group by 
	produto.categoria
order by 
	3
;

-- Questão 10
select 
	item_pedido.idproduto, 
	sum(item_pedido.qtde), 
	item_pedido.preco_unitario
from 
	item_pedido
group by 
	item_pedido.idproduto, 
	item_pedido.preco_unitario
order by
	3 desc
;

-- Questão 11
select 
	item_pedido.idpedido, 
	item_pedido.idproduto, 
    item_pedido.preco_unitario, 
    item_pedido.qtde, 
    (item_pedido.preco_unitario * item_pedido.qtde) as valor_total
from 
	item_pedido
order by 
	item_pedido.idpedido, 
    item_pedido.idproduto
;

-- Questão 12
select 
	count(distinct item_pedido.idpedido),
    avg(item_pedido.qtde),
    avg(item_pedido.qtde * item_pedido.preco_unitario) as valor_medio
from 
	item_pedido
;
	
-- Questão 13
select 
	*
from 
	pedido
where
	pedido.idcliente = 3
;

-- Questão 14
select
	cliente.idcliente,
    cliente.nome,
    count(pedido.idpedido)
from
	pedido
    inner join cliente on
    pedido.idcliente = cliente.idcliente
group by
	cliente.idcliente,
    cliente.nome
;

-- Questão 15
select
	cliente.idcliente,
    cliente.nome,
    count(pedido.idpedido)
from
	cliente
    left join pedido on
    pedido.idcliente = cliente.idcliente
group by
	cliente.idcliente,
    cliente.nome
;

-- Questão 16
select
	produto.idproduto,
    produto.nome,
    count(distinct item_pedido.idpedido) as qtde_pedido,
    sum(item_pedido.qtde) as qtde_vendida,
    avg(item_pedido.qtde)
from
	produto 
    inner join item_pedido on
    produto.idproduto = item_pedido.idproduto
group by
	produto.idproduto,
    produto.nome
order by
	sum(item_pedido.qtde) desc
;
    
-- Questão 17
select
	produto.nome,
    sum(item_pedido.qtde) as qtde_vendida
from
	produto
    left join item_pedido on
    item_pedido.idproduto = produto.idproduto
group by
	produto.nome
;

-- Questão 18
select
	cliente.idcliente,
    cliente.nome,
    count(pedido.idpedido) as qtde_pedido
from 
	cliente
    inner join pedido on
    pedido.idcliente = cliente.idpedido
group by
	cliente.idcliente,
    cliente.nome
having
	count(pedido.idpedido) > 5
;

-- Questão 19
select
	pedido.idpedido,
    pedido.dtpedido,
    cliente.idcliente,
    cliente.nome,
    produto.idproduto,
    produto.nome,
    item_pedido.qtde,
    item_pedido.preco_unitario,
    (item_pedido.qtde * item_pedido.preco_unitario) as total
from
	pedido
    inner join cliente on
    pedido.idcliente = cliente.idcliente
    inner join item_pedido on
    item_pedido.idpedido = pedido.idpedido
    inner join produto on
    produto.idproduto = item_pedido.idproduto	
;

-- Questão 20
select
	cliente.sexo,
    produto.categoria,
    sum(item_pedido.qtde) as qtde_vendido
from
	cliente 
    inner join pedido on 
    pedido.idcliente = cliente.idcliente
    inner join item_pedido on
    item_pedido.idpedido = idpedido.idpedido
    inner join produto on
    item_pedido.idproduto = produto.idproduto
group by
	cliente.sexo,
    produto.categoria
order by 
	3 desc
;