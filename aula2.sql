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
