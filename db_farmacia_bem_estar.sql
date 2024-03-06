CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

INSERT INTO tb_produtos (id_categoria, nome_categoria, descricao_categoria) VALUES
(1, 'Medicamentos', 'Produtos farmacêuticos para tratamento de doenças'),
(2, 'Cosméticos', 'Produtos de beleza e cuidados com a pele'),
(3, 'Higiene Pessoal', 'Produtos para higiene e cuidados pessoais'),
(4, 'Vitaminas e Suplementos', 'Suplementos nutricionais e vitaminas'),
(5, 'Cuidados Infantis', 'Produtos para cuidados com bebês e crianças');

CREATE TABLE tb_categoria (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    valor DECIMAL(5, 2) NOT NULL,
    descricao TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categoria (id_produto, nome_produto, valor, descricao, id_categoria) VALUES
(1, 'Paracetamol 500mg', 12.50, 'Analgésico e antitérmico', 1),
(2, 'Shampoo Hidratante', 25.00, 'Limpa e hidrata os cabelos', 3),
(3, 'Protetor Solar FPS 30', 35.00, 'Protege contra raios UVA e UVB', 2),
(4, 'Vitamina C 1000mg', 55.00, 'Suplemento antioxidante', 4),
(5, 'Creme Hidratante Infantil', 15.00, 'Para pele delicada do bebê', 5),
(6, 'Sabonete Antibacteriano', 8.50, 'Proteção contra bactérias', 3),
(7, 'Máscara Facial de Argila', 20.00, 'Limpeza profunda e revitalização', 2),
(8, 'Soro Fisiológico 0,9%', 5.50, 'Para limpeza nasal e ocular', 1);

-- Consultas
-- Retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_categoria WHERE valor > 50.00;

-- Retorna todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_categoria WHERE valor BETWEEN 5.00 AND 60.00;

-- Retorna todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_categoria WHERE nome_produto LIKE '%C%';

-- Retorna a junção dos dados das tabelas tb_produtos e tb_categorias
SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.id_categoria;

-- Retorna a junção dos dados das tabelas tb_produtos e tb_categorias apenas para a categoria 'Cosméticos'
SELECT * FROM tb_produtos

INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Cosméticos';
