SET SQL_SAFE_UPDATES = 0;

-- Apagar o dbdaily caso exista
DROP DATABASE IF EXISTS DBDAILY;

-- Cria dbdaily
CREATE DATABASE DBDAILY;

-- Usa dbdaily
USE DBDAILY;

-- Criando uma tabela
CREATE TABLE PESSOA (
  IDPESSOA INT NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(100),
  IDADE INT,
  PRIMARY KEY (IDPESSOA) -- Definindo chave primaria da tabela aqui
);

CREATE TABLE FUNCIONARIO (
  IDFUNCIONARIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Definindo chave primaria da tabela aqui
  IDPESSOA INT NOT NULL,
  LOGIN VARCHAR(15),
  SENHA VARCHAR(15),
  FOREIGN KEY (IDPESSOA) REFERENCES PESSOA(IDPESSOA) -- Definindo chave estrangeira aqui
);

-- Inserindo uma pessoa no banco de dados
INSERT INTO PESSOA (NOME, IDADE) VALUES ("Renan", 17);
INSERT INTO PESSOA (NOME, IDADE) VALUES ("Joao", 18);

-- Inserindo um funcionário
INSERT INTO FUNCIONARIO (IDPESSOA, LOGIN, SENHA) VALUES (1, "Renan@mail", "321");
INSERT INTO FUNCIONARIO (IDPESSOA, LOGIN, SENHA) VALUES (2, "Joao@mail", "123");

-- Consulta com inner join
SELECT 
	*
FROM
	PESSOA 
    INNER JOIN FUNCIONARIO ON
    FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA
WHERE
	PESSOA.IDADE > 10 
ORDER BY
	NOME DESC;
    
-- Mudando senha do banco de dados
-- ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysql';

-- Esse delimiter está dizendo que só vai parar depois do $$
DELIMITER $$

/*aqui está criando um código de validação
CREATE TRIGGER FUNCIONARIO BEFORE INSERT ON PESSOA FOR EACH ROW
BEGIN
	SELECT * FROM PESSOA;
END $$
*/
DELIMITER ;
