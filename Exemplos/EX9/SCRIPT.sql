create database dbexercicios009;

use dbexercicios009;

create table pedido(
	idpedido int not null auto_increment,
    data date,
    hora time,
    nome_cliente varchar(60),
    
    primary key(idpedido)
);

create table produto(
	idproduto int not null auto_increment,
    nome_produto varchar(60),
    preco decimal(8,2),
    
    primary key(idproduto)
);

create table vender(
	idpedido int not null,
    idproduto int not null,
    
    primary key (idpedido, idproduto),
    foreign key (idpedido) references pedido (idpedido),
    foreign key (idproduto) references produto (idproduto)
);