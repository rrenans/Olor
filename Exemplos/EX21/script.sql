SET SQL_SAFE_UPDATES = 0;

DROP DATABASE IF EXISTS DBALUNO;
CREATE DATABASE DBALUNO;
USE DBALUNO;

CREATE TABLE ALUNO (
	IDALUNO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(20) NOT NULL,
	SEXO ENUM ('M', 'F'),
	IDADE int,
	CIDADE VARCHAR(20)
);


INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('ANDERSON', 17, 'M','PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('CESAR', 21, 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('DANIEL', 19, 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('DIEGO', 19, 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('EDUARDO', 20, 'M', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('GABRIEL', 19, 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOAO', 18, 'M', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('LEONARDO', 19, 'M', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('LUCAS', 20, 'M', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('PRISCILA', 19, 'F', 'PALHOÇA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('RENATA', 21, 'F', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('MARIA', 22, 'F', 'BLUMENAU');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('TANIA', 19, 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('CARLOS', 22, 'M', 'TUBARAO');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOSE', 19, 'M', 'PALHOCA');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('MARISA', 19, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('AMANDA', 20, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('JOANA', 19, 'F', NULL);
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('ALICE', 21, 'F', 'SAO JOSE');
INSERT INTO ALUNO (NOME, IDADE, SEXO, CIDADE)VALUES('TADEU', 18, 'M', 'TUBARAO');

select * from aluno where sexo = 'm';
select * from aluno where idade = 19;
select * from aluno where nome like 'd%';
select * from aluno where (idade >= 20 and idade <= 22);
/*
	Ex 4, 5 exemplos, o que funciona está na linha 38;
select * from aluno where idade = 20 or idade = 21 or idade = 22;
select idade from aluno where (idade >= 20) or (idade <= 22);
select * from aluno where (idade = 20, 21, 22);
select idade from aluno where (idade = 20) and (idade = 21) and (idade = 22);  
*/
select * from aluno where cidade is null;
select * from aluno where cidade like '%blumenau%';
select * from aluno where idade <> 18;
select * from aluno where nome like '%ri%';
select * from aluno where (cidade = 'sao jose' and sexo = 'm' and idade > 20);
select * from aluno where (sexo = 'f' and idade > 20) or (sexo = 'm' and idade > 17);
select * from aluno where (nome like '%a%' and nome like '%r%');
select nome, idade from aluno where sexo = 'f';
select idaluno, nome from aluno where cidade = 'blumenau';
select nome, cidade from aluno where (idade > 18);
select nome, cidade from aluno where (idade >= 15 and idade <= 18) and cidade = 'palhoca';
select cidade from aluno where cidade is not null;
select nome from aluno where (idade = 18 and cidade = 'palhoca') and (idade = 17 and cidade = 'sao jose');
select nome from aluno where (sexo = 'm' and cidade = 'tubarao' and idade >= 18 or idade <= 25);
select nome, idade from aluno order by idade asc;
select idaluno, nome from aluno order by nome desc;
select * from aluno order by idade desc, nome asc;
select * from aluno order by sexo desc, nome asc;
update aluno set idade = 20 where nome = 'Jose';
update aluno set idade = 21 where nome = 'Tadeu' and nome = 'Cesar' and nome = 'Marisa';
update aluno set nome = 'Luiz', idade = 22, sexo = 'm', cidade = 'tijucas' where idaluno = 12;
update aluno set cidade = null where idade > 24;
delete from aluno where cidade is null;
delete from aluno where (cidade = 'tubarao' and idade > 15 and sexo = 'm');
delete from aluno where (nome = 'tadeu' and nome = 'alice' and nome = 'maria' and idade = 19);
delete from aluno where (idade < 18 and sexo = 'm') or (idade < 21 and sexo = 'f')