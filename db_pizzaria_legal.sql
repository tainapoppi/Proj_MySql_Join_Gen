CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

INSERT INTO tb_categorias (id_categoria, nome_categoria, descricao_categoria) VALUES
(1, 'Salgada', 'Pizzas com recheios salgados'),
(2, 'Doce', 'Pizzas com recheios doces'),
(3, 'Vegetariana', 'Pizzas com ingredientes vegetarianos'),
(4, 'Especial', 'Pizzas especiais da casa'),
(5, 'Calzone', 'Calzones recheados');

CREATE TABLE tb_pizzas (
    id_pizza INT PRIMARY KEY,
    nome_pizza VARCHAR(50) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL,
    ingredientes TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_pizzas (id_pizza, nome_pizza, valor, ingredientes, id_categoria) VALUES
(1, 'Margarita', 40.00, 'Molho de tomate, queijo, manjericão', 1),
(2, 'Quatro Queijos', 55.00, 'Molho de tomate, muçarela, parmesão, provolone, gorgonzola', 1),
(3, 'Chocolate Lover', 70.00, 'Chocolate ao leite, chocolate branco, morangos', 2),
(4, 'Vegetariana Supreme', 60.00, 'Molho de tomate, muçarela, tomate, cogumelos, pimentão, cebola, azeitonas', 3),
(5, 'Frango com Catupiry', 48.00, 'Molho de tomate, frango desfiado, catupiry', 1),
(6, 'Calabresa Especial', 50.00, 'Molho de tomate, calabresa, cebola, pimentão, azeitonas', 1),
(7, 'Banana Caramelizada', 45.00, 'Banana, açúcar caramelizado, canela', 2),
(8, 'Calzone de Presunto e Queijo', 52.00, 'Molho de tomate, presunto, queijo, ovo cozido', 5);

-- Consultas
-- Retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- Retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- Retorna a junção dos dados das tabelas tb_pizzas e tb_categorias
SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

-- Retorna a junção dos dados das tabelas tb_pizzas e tb_categorias apenas para a categoria 'Doce'
SELECT * FROM tb_pizzas

INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Doce';
