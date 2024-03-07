DROP DATABASE `ExeAula3`;
CREATE SCHEMA IF NOT EXISTS `ExeAula3` DEFAULT CHARACTER SET utf8;
USE `ExeAula3`;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`projetos`(
`id` INT NOT NULL,
`titulo` VARCHAR(45) NOT NULL,
`data` DATE NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

SELECT * FROM projetos;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`usuario`(
id INT NOT NULL,
nome VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

SELECT * FROM usuario;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`comentario`( 
id INT NOT NULL,
comentario TEXT NOT NULL,
`data` DATE NOT NULL,
id_projeto INT,
id_usuario INT,
PRIMARY KEY (id),
FOREIGN KEY(id_usuario) REFERENCES usuario(id),
FOREIGN KEY(id_projeto) REFERENCES projetos(id)
) ENGINE = InnoDB;

SELECT * FROM usuario;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`likes_por_projeto`(
id_projeto INT NOT NULL,
id_usuario INT NOT NULL,
PRIMARY KEY (id_projeto, id_usuario),
FOREIGN KEY (id_projeto) REFERENCES projetos(id),
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
) ENGINE = InnoDB;

SELECT * FROM likes_por_projeto;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`likes_por_comentario`(
id_usuario INT NOT NULL, 
id_comentario INT NOT NULL,
PRIMARY KEY (id_usuario, id_comentario),
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_comentario) REFERENCES comentario(id)
) ENGINE = InnoDB;

SELECT * FROM likes_por_comentario;

INSERT INTO projetos VALUES (1,'Aplicação C#','2018-04-01','www.aplicacaocsharp.com.br');
INSERT INTO projetos VALUES (2,'Aplicação Ionic','2018-05-07','www.aplicacaoionic.com.br');
INSERT INTO projetos VALUES (3,'Aplicação Python','2018-08-05','www.aplicacaopython.com.br');

INSERT INTO usuario VALUES (1,'Bruna Luiza','bruninha@gmail.com','abc123.');
INSERT INTO usuario VALUES (2,'Thiago Braga','thiagobraga@gmail.com','pnd123.');
INSERT INTO usuario VALUES (3,'Osvaldo Justino','osvaldojustino@gmail.com','sad123.');
INSERT INTO usuario VALUES (4,'Gabriel Fernando','gabrielfernando@gmail.com','4356aa.');

