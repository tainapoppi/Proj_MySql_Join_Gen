CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id_classe INT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_atributo VARCHAR(50) NOT NULL
);

INSERT INTO tb_classes (id_classe, nome_classe, tipo_atributo) VALUES
(1, 'Guerreiro', 'Força'),
(2, 'Mago', 'Inteligência'),
(3, 'Arqueiro', 'Destreza'),
(4, 'Lutador', 'Agilidade'),
(5, 'Curandeiro', 'Cura');

CREATE TABLE tb_personagens (
    id_personagem INT PRIMARY KEY,
    nome_personagem VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

INSERT INTO tb_personagens (id_personagem, nome_personagem, poder_ataque, poder_defesa, id_classe) VALUES
(1, 'Herói1', 2500, 1500, 1),
(2, 'Mago1', 1800, 1200, 2),
(3, 'Arqueiro1', 2100, 1800, 3),
(4, 'Lutador1', 1900, 1600, 4),
(5, 'Curandeiro1', 1600, 2000, 5),
(6, 'Herói2', 2200, 1700, 1),
(7, 'Arqueiro2', 2400, 1900, 3),
(8, 'Guerreiro2', 2000, 1300, 1);

-- Consultas
-- Retorna todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Retorna todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Retorna todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

-- Retorna a junção dos dados das tabelas tb_personagens e tb_classes
SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe;

-- Retorna a junção dos dados das tabelas tb_personagens e tb_classes apenas para a classe dos arqueiros
SELECT * FROM tb_personagens

INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_classes.nome_classe = 'Arqueiro';

