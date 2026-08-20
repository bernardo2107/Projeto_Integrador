USE EcoStyle;

-- ============================================================
-- Nenhuma tabela do EcoStyle foi criada com ENGINE, CHARACTER SET
-- ou COLLATE explícitos — todas ficaram no padrão do servidor.
-- Os ALTER TABLE abaixo forçam essas 3 configurações em cada tabela.
--
-- ENGINE=InnoDB: garante suporte real a FOREIGN KEY, transações
-- (COMMIT/ROLLBACK) e locking em nível de linha.
--
-- CONVERT TO CHARACTER SET utf8mb4: diferente de só "CHARACTER SET",
-- o CONVERT TO também reconverte os dados de texto que já existem nas
-- colunas (não só define o padrão pra colunas futuras). Suporta
-- Unicode completo, incluindo acentos e emojis.
--
-- COLLATE utf8mb4_unicode_ci: define como o texto é comparado/ordenado;
-- "ci" (case insensitive) trata maiúscula/minúscula e variações de
-- acento como iguais nas buscas.
-- ============================================================

ALTER TABLE Customers
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Categories
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Employees
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Shippers
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Orders
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Returns
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Suppliers
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Products
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE OrderDetails-- usar "OrderDetails" no lugar de "Inventory" se já aplicou o alter anterior
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Stock
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE Logs
  ENGINE=InnoDB,
  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;