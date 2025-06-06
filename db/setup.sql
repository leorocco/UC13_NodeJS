-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce_pc
    DEFAULT CHARACTER SET = 'utf8mb4';

USE ecommerce_pc;

-- Tabela de clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(100) NOT NULL,
  endereco TEXT,
  criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de categorias
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL UNIQUE,
  descricao TEXT
);

-- Tabela de produtos
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT DEFAULT 0,
  categoria_id INT,
  criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabela de pedidos
CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  data DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'Em andamento',
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de itens do pedido
CREATE TABLE itens_pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT,
  produto_id INT,
  quantidade INT DEFAULT 1,
  preco_unitario DECIMAL(10,2),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserções iniciais
INSERT INTO clientes (nome, email, senha, endereco) VALUES
('João Silva', 'joao@email.com', '123456', 'Rua A, 123'),
('Maria Oliveira', 'maria@email.com', 'abcdef', 'Av. Central, 456'),
('Carlos Souza', 'carlos@email.com', 'senha123', 'Rua das Flores, 78'),
('Ana Costa', 'ana@email.com', 'senha456', 'Rua da Paz, 10'),
('Pedro Lima', 'pedro@email.com', 'minhasenha', 'Rua Verde, 98');

INSERT INTO categorias (nome, descricao) VALUES
('Processadores', 'CPUs para desktops'),
('Memória RAM', 'Módulos de memória para PCs'),
('Placas de Vídeo', 'GPUs para jogos e renderização'),
('Armazenamento', 'Dispositivos como SSDs e HDs'),
('Placas-Mãe', 'Motherboards compatíveis com CPUs e periféricos');

INSERT INTO produtos (nome, descricao, preco, estoque, categoria_id) VALUES
('Intel Core i5-10400', '6 núcleos, 12 threads, 2.9GHz', 899.90, 10, 1),
('AMD Ryzen 5 5600X', '6 núcleos, 12 threads, até 4.6GHz', 1099.99, 7, 1),
('Memória DDR4 8GB 2666MHz', 'Kingston Fury Beast', 189.90, 20, 2),
('Memória DDR4 16GB 3200MHz', 'Corsair Vengeance LPX', 349.50, 15, 2),
('NVIDIA GeForce GTX 1660', '6GB GDDR5, 192-bit', 1450.00, 5, 3),
('NVIDIA RTX 3060', '12GB GDDR6, Ray Tracing', 2100.00, 3, 3),
('SSD Kingston 240GB', 'SATA 2.5"', 149.90, 25, 4),
('HD Seagate 1TB', '7200RPM, 3.5"', 230.00, 12, 4),
('Placa-Mãe ASUS Prime B450M', 'Socket AM4, DDR4', 499.99, 8, 5),
('Placa-Mãe Gigabyte H510M', 'Socket LGA1200, DDR4', 429.99, 9, 5);
