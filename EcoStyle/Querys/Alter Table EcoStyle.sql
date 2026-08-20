USE EcoStyle;

-- ============================================================
-- LEGENDA DOS COMANDOS USADOS NESTE SCRIPT
-- ============================================================
-- CHARACTER SET utf8mb4: define quais caracteres podem ser armazenados;
-- utf8mb4 suporta Unicode completo, incluindo acentos e emojis.
--
-- COLLATE utf8mb4_unicode_ci: define como o texto é comparado e ordenado;
-- o sufixo "ci" (case insensitive) faz com que maiúscula/minúscula e
-- variações de acento sejam tratadas como iguais nas buscas.
--
-- ENGINE=InnoDB: define o motor de armazenamento da tabela; é o único
-- engine que aplica FOREIGN KEY de verdade e suporta transações
-- (COMMIT/ROLLBACK) e locking em nível de linha.
--
-- DECIMAL(precisão, escala): Precisão delimita a qtd total de dígitos (10).
-- Escala delimita a qtd de dígitos depois da vírgula (2).
-- Ex: 99999999.99 = 8 dígitos antes + 2 depois = 10 dígitos no total.

-- =========================================================
-- Adiciona o campo EmployeeID para identificar o funcionário
-- responsável pela alteração ou gerenciamento do produto.
-- ==========================================================

ALTER TABLE Products
ADD COLUMN EmployeeID INT UNSIGNED NOT NULL,
ADD CONSTRAINT fk_products_employee
    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID);


-- ============================================================
-- 1) CHARSET/COLLATION do banco
-- ============================================================
-- O banco foi criado sem CHARACTER SET/COLLATE definido, então usa o padrão
-- do servidor (pode não ser utf8mb4). Isso pode causar problemas com nomes
-- que têm acento (ContactName, City, etc.). Forçando utf8mb4 aqui.
ALTER DATABASE EcoStyle CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- ============================================================
-- 2) Renomeando Inventory -> OrderDetails
-- ============================================================
-- "Inventory" (inventário/estoque) é um nome enganoso para essa tabela: ela
-- na verdade guarda os ITENS DE CADA PEDIDO (OrderID + ProductID + Quantity),
-- não o estoque disponível. Quem representa estoque de verdade é a tabela
-- "Stock". Renomeando para deixar o propósito claro e evitar confusão futura.
RENAME TABLE Inventory TO OrderDetails;

-- Adicionando o preço unitário do item no pedido, e renomeando a PK
-- (InventoryID -> OrderDetailID) pra acompanhar o novo nome da tabela,
-- no mesmo ALTER TABLE.
ALTER TABLE OrderDetails
  ADD COLUMN UnitPrice DECIMAL(10,2) NOT NULL DEFAULT 0.00 AFTER Quantity,
  CHANGE COLUMN InventoryID OrderDetailID BIGINT UNSIGNED AUTO_INCREMENT;

-- Regra criada para que a combinação OrderID + ProductID não se repita
-- (evita o mesmo produto duplicado duas vezes dentro do mesmo pedido).
ALTER TABLE OrderDetails
  ADD CONSTRAINT uc_order_product UNIQUE (OrderID, ProductID);


-- ============================================================
-- 3) Returns — preenchimento automático de datas
-- ============================================================
-- UpdatedAt: mostra a última alteração realizada na linha.
-- RequestDate: passa a preencher automaticamente com a data em que o
-- cliente realizou o pedido de devolução, caso não seja informada.
ALTER TABLE Returns
  ADD COLUMN UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  MODIFY COLUMN RequestDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;


-- ============================================================
-- 4) Products.Price — bug silencioso de arredondamento
-- ============================================================
-- "DECIMAL" sem precisão vira DECIMAL(10,0) por padrão, ou seja, ZERO casas
-- decimais. Um preço de 19.99 seria salvo como 20, sem erro nenhum avisando.
-- Corrigindo para 2 casas decimais (padrão pra valores monetários em reais).
ALTER TABLE Products
  MODIFY COLUMN Price DECIMAL(10,2) DEFAULT NULL;


-- ============================================================
-- 5) Orders.OrderStatus — sem valor padrão
-- ============================================================
-- Hoje é possível inserir um pedido sem status nenhum (fica NULL). Definindo
-- 'PENDENTE' como padrão, igual já foi feito em Returns.ReturnStatus, pra
-- todo pedido nascer com um status válido.
ALTER TABLE Orders
  MODIFY COLUMN OrderStatus ENUM('ENTREGUE','PENDENTE','CONFIRMADO','ENVIADO','CANCELADO','DEVOLVIDO')
  NOT NULL DEFAULT 'PENDENTE';