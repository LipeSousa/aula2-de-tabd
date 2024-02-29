DROP DATABASE livraria;

CREATE SCHEMA IF NOT EXISTS livraria DEFAULT CHARACTER SET utf8;

USE livraria;

CREATE TABLE IF NOT EXISTS Aluno(
id INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL,
telefone VARCHAR (14),
altura DECIMAL(3,2),
PRIMARY KEY (id)
)ENGINE=InnoDB;

INSERT INTO Aluno (id, nome, email, telefone, altura)
VALUES 
(NULL, 'João Pimentel', 'jpapim@gmail.com', '(61) 98787-9987', 1.74),
(NULL, 'João da Silva', 'joao.silva@gmail.com', '(61) 98787-0087', 1.74),
(NULL, 'João Paulo', 'joao.paulo@gmail.com', '(61) 98787-9955', 1.94),
(NULL, 'João Brito', 'joao.brito@gmail.com', '(61) 98799-9999', 1.94),
(NULL, 'José Brito', 'jose.brito@gmail.com', '(61) 98787-9987', 1.94);

CREATE TABLE IF NOT EXISTS Professor(
id INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL,
telefone VARCHAR (14),
altura DECIMAL(3,2),
PRIMARY KEY (id)
)ENGINE=InnoDB;

INSERT INTO Professor (id, nome, email, telefone, altura)
VALUES 
(NULL, 'Maria da Silval', 'maria.silva@gmail.com', '(61) 98787-9654', 1.54),
(NULL, 'Florisvaldo Pereira', 'florisvaldo@gmail.com', '(61) 98787-8007', 1.70);

SELECT a.nome AS 'Nome do Aluno',
p.nome AS 'Nome do Professor'
FROM Aluno a, Professor p;

-- FILTRAR -- 
SELECT * FROM Aluno WHERE altura = 1.8;
SELECT * FROM Aluno WHERE altura <> 1.8;
SELECT * FROM Aluno WHERE altura != 1.8;
SELECT * FROM Aluno WHERE altura <= 1.8;
SELECT * FROM Aluno WHERE altura < 1.8;
SELECT * FROM Aluno WHERE altura >= 1.8;
SELECT * FROM Aluno WHERE altura > 1.8;

SELECT * FROM Aluno WHERE Altura  BETWEEN 1.5 AND 1.8;
SELECT * FROM Aluno WHERE Altura  NOT BETWEEN 1.5 AND 1.8;
SELECT * FROM Aluno WHERE nome LIKE 'Rafael%';
SELECT * FROM Aluno WHERE nome NOT LIKE 'Rafael%';
SELECT * FROM Aluno WHERE altura IN (1.5, 1.6, 1.7, 1.8);
SELECT * FROM Aluno WHERE altura NOT IN (1.5, 1.6, 1.7, 1.8);

SELECT * FROM Aluno WHERE altura < 1.8 AND nome LIKE 'Rafael%';
SELECT * FROM Aluno WHERE altura < 1.8 && nome LIKE 'Rafael%';
SELECT * FROM Aluno WHERE altura < 1.8 OR nome LIKE 'Rafael%';
SELECT * FROM Aluno WHERE altura < 1.8 || nome LIKE 'Rafael%';
SELECT * FROM Aluno WHERE altura < 1.8 XOR nome LIKE 'Rafael%';

SELECT * FROM Aluno WHERE NOT altura = 1.80;
SELECT * FROM Aluno WHERE ! ( altura = 1.80 );

SELECT * FROM Aluno ORDER BY altura;
SELECT * FROM Aluno ORDER BY altura, nome;

SELECT * FROM Aluno ORDER BY altura DESC, nome ASC;

SELECT * FROM Aluno;
SELECT * FROM Professor;
SELECT * FROM Aluno, Professor;


-- AULA 2 -- 

CREATE SCHEMA IF NOT EXISTS `redesocial` DEFAULT CHARACTER SET utf8;
USE `redesocial`;

CREATE TABLE Usuario(
id INT NOT NULL,
nome_usuario VARCHAR(10),
senha VARCHAR(10),
email VARCHAR(100),
PRIMARY KEY (id)
)
ENGINE = InnoDB;

CREATE TABLE Perfil(
id INT NOT NULL,
nome VARCHAR(255),
sexo TINYINT(1),
profissao VARCHAR(255),
onde_estudou VARCHAR(255),
hobbies VARCHAR(255),
gosto_musical VARCHAR(255),
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES Usuario(id)
)
ENGINE = InnoDB;

SELECT * FROM Usuario;

SELECT * FROM Perfil;

DROP TABLE Perfil;

TRUNCATE TABLE Usuario;

INSERT INTO Usuario (id, nome_usuario, senha, email)
VALUES(1, 'Josefino Alves', 'flamengoogrande', 'josefinoalves@gmail,com');
INSERT INTO Usuario (id, nome_usuario, senha, email)
VALUES(2, 'Lionel Messi', 'fluminensepiada', 'lionelmessi@gmail,com');
INSERT INTO Usuario (id, nome_usuario, senha, email)
VALUES(3, 'Neymar JR', 'barcelona123', 'neymarjr@gmail,com');

INSERT INTO Perfil(id, nome, sexo, profissao, onde_estudou, hobbies, gosto_musical)
VALUES(1, 'Josefino Alves', 0, 'GANDULA', 'CEM 05', 'Andar de BIKE', 'METAL PURO'),
      (2, 'Lionel Messi', 0, 'JOGADOR DE BOLA', 'CEF 12', 'Jogar BASQUETE', 'Arrocha pra coçar o chifre'),
      (3, 'Neymar JR', 0, 'Atacante do Vasco', 'BASE DO SANTOS', 'Perder pro FLAMENGO', 'Musicas de quem trai.');


SELECT *
FROM Usuario AS u
JOIN Perfil AS p;

SELECT *
FROM Usuario AS u
JOIN Perfil AS p
ON u.iD = p.iD;

SELECT u.id, u.nome_usuario, u.senha, u.email, p.sexo, p.profissao, p.onde_estudou, p_hobbies, p.gosto_musical
FROM Usuario AS u
JOIN Perfil AS p
ON u.iD = p.iD;

-- Exercicio -- 
CREATE DATABASE Escola;

USE Escola;

CREATE TABLE Estudantes (
nome VARCHAR(255),
email VARCHAR(255),
altura DECIMAL(3,2),
aprovado TINYINT(1)
);

DROP TABLE Estudantes; 

INSERT INTO Estudantes 
(nome, email, altura, aprovado)
VALUES 
('Neymar Jr Silva', 'neymarjr@gmail.com', '1.75', 1),
('Lionel Messi', 'lmessi@gmail.com', '1.65', 1),
('Luis Suarez', 'lsuarez@gmail.com', '1.74', 1),
('Xavi', 'xavi@gmail.com', '1.80', 0),
('Andreas Iniesta', 'iniesta@gmail.com', '1.82', 0);

SELECT * FROM Estudantes; 

SELECT * FROM Estudantes WHERE altura < 1.70;

SELECT * FROM Estudantes WHERE aprovado = 1;

SELECT * FROM Estudantes WHERE  nome NOT LIKE 'Lionel%';

SELECT * FROM Estudantes WHERE email LIKE 'neymar%';
