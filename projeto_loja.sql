CREATE DATABASE loja_virtual;
USE loja_virtual;
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,

    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id)
);
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    cliente_id INT,

    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id)
);
CREATE TABLE itens_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,

    PRIMARY KEY (pedido_id, produto_id),

    FOREIGN KEY (pedido_id)
    REFERENCES pedidos(id),

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id)
);
INSERT INTO categorias (nome)
VALUES
('Eletrônicos'),
('Roupas'),
('Informática');
INSERT INTO clientes (nome, email, telefone)
VALUES
('Carlos Silva', 'carlos@gmail.com', '229999999'),
('Ana Souza', 'ana@gmail.com', '228888888'),
('Pedro Lima', 'pedro@gmail.com', '227777777'),
('Mariana Costa', 'mariana@gmail.com', '226666666'),
('Lucas Alves', 'lucas@gmail.com', '225555555');
INSERT INTO produtos (nome, preco, estoque, categoria_id)
VALUES
('Notebook', 3500.00, 10, 3),
('Mouse Gamer', 120.00, 20, 3),
('Teclado Mecânico', 250.00, 15, 3),
('Camisa', 80.00, 30, 2),
('Celular', 2500.00, 12, 1),
('Monitor', 900.00, 8, 3),
('Fone Bluetooth', 300.00, 25, 1),
('Calça Jeans', 150.00, 18, 2),
('Impressora', 700.00, 5, 3),
('Smartwatch', 450.00, 9, 1);
INSERT INTO pedidos (data_pedido, cliente_id)
VALUES
('2026-05-01', 1),
('2026-05-02', 2),
('2026-05-03', 3),
('2026-05-04', 4),
('2026-05-05', 5);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade)
VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(2,4,3),
(3,5,1),
(3,6,1),
(4,7,2),
(4,8,1),
(5,9,1),
(5,10,2);

SELECT * FROM clientes;

SELECT * FROM produtos
WHERE preco > 100;

SELECT * FROM produtos
ORDER BY preco DESC;

SELECT pedidos.id, clientes.nome
FROM pedidos
JOIN clientes
ON pedidos.cliente_id = clientes.id;

SELECT produtos.nome, categorias.nome
FROM produtos
JOIN categorias
ON produtos.categoria_id = categorias.id;

ALTER TABLE clientes
ADD cpf VARCHAR(14);

ALTER TABLE produtos
MODIFY preco DECIMAL(12,2);

ALTER TABLE clientes
RENAME COLUMN telefone TO celular;


UPDATE produtos
SET preco = 4000
WHERE id = 1;

UPDATE produtos
SET estoque = 15
WHERE id = 2;


DELETE FROM produtos
WHERE id = 5;
