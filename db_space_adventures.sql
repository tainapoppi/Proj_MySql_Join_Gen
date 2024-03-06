CREATE DATABASE db_space_adventures;

USE db_space_adventures;

CREATE TABLE tb_naves (
    id_nave INT PRIMARY KEY,
    nome_nave VARCHAR(50) NOT NULL,
    tipo_nave VARCHAR(50) NOT NULL,
    capacidade_carga INT
);

INSERT INTO tb_naves (id_nave, nome_nave, tipo_nave, capacidade_carga) VALUES
(1, 'Interceptor', 'Caça', 500),
(2, 'Cargueiro', 'Transporte', 2000),
(3, 'Explorador', 'Exploração', NULL),
(4, 'Bombardeiro', 'Ataque', 1000),
(5, 'Destruidor', 'Ataque', 1500);

CREATE TABLE tb_personagens (
    id_personagem INT PRIMARY KEY,
    nome_personagem VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    id_nave INT,
    FOREIGN KEY (id_nave) REFERENCES tb_naves(id_nave)
);


INSERT INTO tb_personagens (id_personagem, nome_personagem, nivel, id_nave) VALUES
(1, 'Capitã Stella', 5, 1),
(2, 'Tenente Astro', 3, 3),
(3, 'Comandante Nova', 6, 2),
(4, 'Sargento Eclipse', 4, 4),
(5, 'Almirante Galáxia', 7, 5),
(6, 'Piloto Nebula', 2, 1),
(7, 'Engenheira Estelar', 4, 2),
(8, 'Médica Cosmo', 5, NULL);

SELECT * FROM tb_personagens

INNER JOIN tb_naves ON tb_personagens.id_nave = tb_naves.id_nave
WHERE tb_naves.tipo_nave = 'Ataque';

SELECT * FROM tb_naves WHERE capacidade_carga > 1000;

SELECT * FROM tb_personagens WHERE id_nave IS NULL;
