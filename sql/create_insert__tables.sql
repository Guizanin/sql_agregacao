-- Criação das tabelas
CREATE TABLE clientes (
    ID SERIAL PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    ID SERIAL PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL
);

CREATE TABLE pedidos (
    ID SERIAL PRIMARY KEY,
    NOME_PEDIDO VARCHAR(100) NOT NULL,
    FK_CLIENTES INTEGER NOT NULL,
    FOREIGN KEY (FK_CLIENTES) REFERENCES clientes(ID)
);

CREATE TABLE meio_pedido_produto (
    ID_PEDIDO INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    PRIMARY KEY (ID_PEDIDO, ID_PRODUTO),
    FOREIGN KEY (ID_PEDIDO) REFERENCES pedidos(ID),
    FOREIGN KEY (ID_PRODUTO) REFERENCES produtos(ID)
);

-- Inserção de dados nas tabelas
INSERT INTO clientes (ID, NOME) VALUES
(1, 'Guilherme'),
(2, 'Sebah'),
(3, 'Klaus');

INSERT INTO produtos (ID, NOME) VALUES
(1, 'Refri'),
(2, 'Feijoada'),
(3, 'Cerveja'),
(4, 'Água');

INSERT INTO pedidos (ID, NOME_PEDIDO, FK_CLIENTES) VALUES
(1, 'encomenda Feijoada', 1),
(2, 'Refrigerantes', 3),
(3, 'Águas', 2);

INSERT INTO meio_pedido_produto (ID_PEDIDO, ID_PRODUTO) VALUES
(1, 2),
(1, 1),
(1, 3),
(2, 1),
(3, 4),
(3, 3);