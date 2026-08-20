
DROP DATABASE IF EXISTS EcoStyle;

-- ATENÇÃO! EXPLICAÇÃO DE COMANDOS USADOS NO BANCO:
-- NOT NULL: Usado para indicar que o campo não pode receber valores NULL
-- DEFAULT NULL: Usado para indicar para que caso o campo não seja preenchido, o sistema preenche com valores NULL
-- BIGINT UNSIGNED: Usado para armazenar valores INTEIROS LONGOS
-- ENUM: Delimita que aquela coluna só pode receber os valores direcionados

CREATE DATABASE IF NOT EXISTS EcoStyle;

USE EcoStyle;


-- ============================================================
-- TABELA: Customers
-- ============================================================
-- Clientes da loja de moda sustentável. Guarda os dados de contato e
-- endereço de entrega, usados tanto pra faturar o pedido (Orders) quanto
-- pra rastrear pedidos de devolução (Returns) feitos por esse cliente.
-- ============================================================
CREATE TABLE IF NOT EXISTS Customers (
CustomerID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do cliente
CustomerName VARCHAR (40) NOT NULL, -- Nome/razão social do cliente
ContactName VARCHAR (40) NOT NULL, -- Nome da pessoa de contato (útil em cadastros de empresas/PJ)
Adress VARCHAR (70) NOT NULL, -- Endereço de entrega do cliente
City VARCHAR (20) NOT NULL, -- Cidade do cliente
PostalCode VARCHAR (10) NOT NULL -- CEP/código postal do cliente
);

-- ============================================================
-- TABELA: Categories
-- ============================================================
-- Categorias das peças de roupa vendidas (ex: "Camisetas Orgânicas",
-- "Acessórios Reciclados", "Calçados Veganos"). Usada pra organizar o
-- catálogo de Products e permitir filtros de navegação na loja.
-- ============================================================
CREATE TABLE IF NOT EXISTS Categories (
CategoryID INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único da categoria
CategoryName VARCHAR (40) NOT NULL, -- Nome da categoria (ex: "Calçados Veganos")
Description VARCHAR (300) -- Descrição da categoria, exibida na navegação da loja
);

-- ============================================================
-- TABELA: Employees
-- ============================================================
-- Funcionários responsáveis pela operação da loja (atendimento, compras,
-- gestão de fornecedores, controle de estoque). Vinculada aos registros de
-- auditoria em Logs, pra rastrear quem alterou o quê nos produtos.
-- ============================================================
CREATE TABLE IF NOT EXISTS Employees (
EmployeeID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do funcionário
LastName VARCHAR (15) NOT NULL, -- Sobrenome do funcionário
FirstName VARCHAR (15) NOT NULL, -- Primeiro nome do funcionário
BirthDate DATE NOT NULL, -- Data de nascimento do funcionário
Adress VARCHAR (50) NOT NULL, -- Endereço residencial do funcionário
Photo VARCHAR (150) DEFAULT NULL, -- Caminho/URL da foto do funcionário (opcional)
Notes VARCHAR (1000) NOT NULL -- Observações gerais sobre o funcionário (cargo, funções, etc.)
);

-- ============================================================
-- TABELA: Shippers
-- ============================================================
-- Transportadoras responsáveis pelas entregas neutras em carbono da loja.
-- Cada Order e cada Return referenciam qual transportadora ficou
-- responsável pelo envio/coleta daquele pedido.
-- ============================================================
CREATE TABLE IF NOT EXISTS Shippers (
ShipperID INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único da transportadora
ShipperName VARCHAR (25) NOT NULL, -- Nome da transportadora
Phone VARCHAR (15) NOT NULL -- Telefone de contato da transportadora
);

-- ============================================================
-- TABELA: Orders
-- ============================================================
-- Pedidos de compra feitos pelos clientes. Liga Customer (quem comprou),
-- Employee (quem processou o pedido) e Shipper (quem vai entregar) numa
-- única transação, com status de acompanhamento (pendente, enviado, etc.).
-- ============================================================
CREATE TABLE IF NOT EXISTS Orders (
OrderID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do pedido
CustomerID BIGINT UNSIGNED NOT NULL, -- Cliente que fez o pedido (FK -> Customers)
EmployeeID INT UNSIGNED NOT NULL, -- Funcionário que processou o pedido (FK -> Employees)
OrderDate DATETIME NOT NULL, -- Data/hora em que o pedido foi realizado
ShipperID INT NOT NULL, -- Transportadora responsável pela entrega (FK -> Shippers)
OrderStatus ENUM('ENTREGUE','PENDENTE','CONFIRMADO','ENVIADO','CANCELADO','DEVOLVIDO'), -- Situação atual do pedido
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);

-- ============================================================
-- TABELA: Returns
-- ============================================================
-- Pedidos de devolução de compras já realizadas. Guarda qual Order está
-- sendo devolvido, qual Customer solicitou, e qual Shipper vai fazer a
-- coleta neutra em carbono do produto devolvido — com um fluxo de status
-- próprio (solicitada, aprovada, em análise, etc.).
-- ============================================================
CREATE TABLE IF NOT EXISTS Returns (

ReturnID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único da devolução
OrderID BIGINT UNSIGNED NOT NULL, -- Pedido original que está sendo devolvido (FK -> Orders)
CustomerID BIGINT UNSIGNED NOT NULL, -- Cliente que solicitou a devolução (FK -> Customers)
RequestDate DATETIME NOT NULL, -- Data do pedido de devolução
ShipperID INT, -- Transportadora responsável pela coleta do produto (FK -> Shippers)
ReturnStatus ENUM('SOLICITADA','APROVADA','REJEITADA','AGUARDANDO_COLETA','EM_ANALISE','RECEBIDA','TROCA_REALIZADA')
NOT NULL DEFAULT 'SOLICITADA', -- Definindo status padrão como 'SOLICITADA' para o campo nunca ficar NULL
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);

-- ============================================================
-- TABELA: Suppliers
-- ============================================================
-- Fornecedores de materiais reciclados/ecológicos usados na fabricação
-- das roupas (ex: algodão orgânico, tecido reciclado de garrafa PET).
-- Cada Product vendido na loja está ligado ao fornecedor que forneceu o
-- material usado nele — parte central do controle de sustentabilidade.
-- ============================================================
CREATE TABLE IF NOT EXISTS Suppliers (
SupplierID INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único do fornecedor
SupplierName VARCHAR (50) NOT NULL, -- Nome do fornecedor de material ecológico
ContactName VARCHAR (50) NOT NULL, -- Nome da pessoa de contato no fornecedor
Adress VARCHAR (50) NOT NULL, -- Endereço do fornecedor
City VARCHAR (25) NOT NULL, -- Cidade do fornecedor
PostalCode VARCHAR (10) NOT NULL, -- CEP/código postal do fornecedor
Country VARCHAR (15) NOT NULL, -- País do fornecedor
Phone VARCHAR (15) NOT NULL, -- Telefone de contato do fornecedor
Description VARCHAR (1000) NOT NULL -- Descrição do fornecedor (ex: tipo de material reciclado que fornece)
);

-- ============================================================
-- TABELA: Products
-- ============================================================
-- Catálogo de peças de roupa/acessórios ecológicos vendidos na loja. Cada
-- produto pertence a uma Category e é fabricado com material de um
-- Supplier específico — é o centro do catálogo, referenciado por pedidos
-- (via OrderDetails/Inventory), estoque (Stock) e auditoria (Logs).
-- ============================================================
CREATE TABLE IF NOT EXISTS Products (
ProductID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do produto
ProductName VARCHAR (40) NOT NULL, -- Nome da peça/produto
SupplierID INT NOT NULL, -- Fornecedor do material usado no produto (FK -> Suppliers)
CategoryID INT NOT NULL, -- Categoria do produto (FK -> Categories)
Unit VARCHAR (25) NOT NULL, -- Unidade de venda (ex: "unidade", "par", "kit")
Price DECIMAL DEFAULT NULL, -- Preço de venda do produto
Description VARCHAR (1000) NOT NULL, -- Descrição do produto (material, características sustentáveis, etc.)
FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);


-- ============================================================
-- TABELA: Inventory
-- ============================================================
-- Apesar do nome, esta tabela representa os ITENS DE CADA PEDIDO (qual
-- Product foi comprado, em qual Order, e em qual quantidade) — não o
-- estoque disponível em si. Quem representa estoque de verdade é a
-- tabela Stock, logo abaixo.
-- ============================================================
CREATE TABLE IF NOT EXISTS Inventory (
InventoryID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do item do pedido
OrderID BIGINT UNSIGNED NOT NULL, -- Pedido ao qual este item pertence (FK -> Orders)
ProductID INT UNSIGNED NOT NULL, -- Produto comprado (FK -> Products)
Quantity INT NOT NULL, -- Quantidade desse produto no pedido
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

-- ============================================================
-- TABELA: Stock
-- ============================================================
-- Estoque disponível de cada Product na loja. Atualizada conforme peças
-- entram (reposição de fornecedores ecológicos) ou saem (vendas), com
-- registro automático da última atualização em UpdatedAt.
-- ============================================================
CREATE TABLE IF NOT EXISTS Stock (
  StockID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do registro de estoque
  ProductID INT UNSIGNED NOT NULL, -- Produto ao qual este estoque se refere (FK -> Products)
  QuantityAvailable INT NOT NULL DEFAULT 0, -- Quantidade disponível para venda no momento
  UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Mostra a ultima atualização realizada na table
  FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

-- ============================================================
-- TABELA: Logs
-- ============================================================
-- Auditoria de alterações feitas nos produtos por Employees (ex: mudança
-- de preço, correção de descrição, ajuste de estoque manual). Guarda o
-- valor antigo e o novo, pra rastrear quem mudou o quê e quando.
-- ============================================================
CREATE TABLE IF NOT EXISTS Logs (
LogID BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- Identificador único do registro de log
EmployeeID INT UNSIGNED NOT NULL, -- Funcionário que realizou a alteração (FK -> Employees)
ProductID INT UNSIGNED NOT NULL, -- Produto que foi alterado (FK -> Products)
Actions VARCHAR (100) NOT NULL, -- Descrição da ação realizada (ex: "Alteração de preço")
OldValue VARCHAR(255), -- Valor anterior à alteração
NewValue VARCHAR(255), -- Novo valor após a alteração
ActionDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- Preenche automaticamente na criação do registro 
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);