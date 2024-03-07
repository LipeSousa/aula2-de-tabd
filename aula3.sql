-- Criação da DATABASE -- 

DROP DATABASE subconsultas;
CREATE SCHEMA IF NOT EXISTS `subconsultas` DEFAULT CHARACTER SET utf8;
USE `subconsultas`;

-- Criação da TABELA ALUNOS + SELECT --

CREATE TABLE IF NOT EXISTS `subconsultas`.`alunos` (
id INTEGER NOT NULL,
nome VARCHAR(255),
email VARCHAR(255),
dataNascimento DATETIME,
PRIMARY KEY(id)
) ENGINE = InnoDB;

SELECT * FROM alunos;

-- Criação da TABELA TURMAS + SELECT --

CREATE TABLE IF NOT EXISTS `subconsultas`.`Turmas` (
id INTEGER NOT NULL, 
inicio DATETIME,
fim	DATETIME,
observacoes LONGTEXT,
PRIMARY KEY(id)
) ENGINE = InnoDB;

SELECT * FROM `Turmas`;

-- Criação da TABELA ALUNOTURMA + SELECT --

CREATE TABLE IF NOT EXISTS `subconsultas`.`AlunoTurma` (
aluno_id INTEGER NOT NULL,
turma_id INTEGER NOT NULL,
PRIMARY KEY (aluno_id, turma_id),
FOREIGN KEY (aluno_id) REFERENCES alunos(id),
FOREIGN KEY (turma_id) REFERENCES Turmas(id)
) ENGINE = InnoDB;

SELECT * FROM AlunoTurma;

-- Inserindo valores na TABELA ALUNOS + SELECT --

INSERT INTO alunos VALUES (1,'João Paulo','jp@gmail.com','1978-08-19');
INSERT INTO alunos VALUES (2,'João Gabriel','jg@gmail.com','1988-07-12');
INSERT INTO alunos VALUES (3,'João Lindosvaldo','jl@gmail.com','1968-12-14');
INSERT INTO alunos VALUES (4,'João Felix','jf@gmail.com','1978-09-09');

SELECT * FROM alunos;

-- Inserindo valores na TABELA TURMAS + SELECT -- 

INSERT INTO Turmas VALUES (1,'2019-03-01','2019-07-15','Turma de Banco de Dados 1');
INSERT INTO Turmas VALUES (2,'2019-04-01','2019-07-22','Turma de Banco de Dados 2');

SELECT * FROM Turmas;

-- Inserindo valores na TABELA ALUNOTURMA + SELECT --

INSERT INTO AlunoTurma VALUES (1,1);
INSERT INTO AlunoTurma VALUES (2,1);
INSERT INTO AlunoTurma VALUES (3,2);

SELECT * FROM AlunoTurma;

-- Criação da TABELA NOTA + SELECT --

CREATE TABLE IF NOT EXISTS `subconsultas`.`Nota`(
id INT NOT NULL,
aluno_id INT NOT NULL,
turma_id INT NOT NULL,
nota DECIMAL (4,2),
PRIMARY KEY (id),
FOREIGN KEY (aluno_id) REFERENCES alunos(id),
FOREIGN KEY (turma_id) REFERENCES Turmas(id)
) ENGINE = InnoDB;

SELECT * FROM Nota;

-- Inserindo na TABELA NOTA + SELECT --

INSERT INTO Nota VALUES (1, 1, 1, 10);
INSERT INTO Nota VALUES (2, 2, 2, 6);
INSERT INTO Nota VALUES (3, 3, 2, 8);
INSERT INTO Nota VALUES (4, 4, 1, 9);

SELECT * FROM Nota; 

-- Select para selecionar a maior NOTA -- 

SELECT * FROM Nota AS n1
WHERE n1.nota > ( 
SELECT AVG(n2.nota)
FROM Nota AS n2
WHERE n2.turma_id = n1.turma_id);

-- Selecionar a maior nota de uma determinada turma -- 

SELECT n1.*, (
	SELECT MAX(n2.nota)
    FROM Nota AS n2
    WHERE n2.turma_id = 1
) AS maior_nota
FROM Nota AS n1
WHERE n1.turma_id;
