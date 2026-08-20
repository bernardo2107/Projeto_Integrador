USE EcoStyle;

-- ===============================================================
-- STOCK - Trigger criada para baixa no estoque automática após venda.
-- ==================================================================

-- Quando um produto é adicionado a um pedido, a quantidade comprada
-- é subtraída automaticamente da quantidade disponível em estoque.
-- Exemplo: estoque = 10, compra = 3, novo estoque = 7.

DELIMITER $$

CREATE TRIGGER trg_stock_baixa_venda
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
  UPDATE Stock
  SET QuantityAvailable = QuantityAvailable - NEW.Quantity
  WHERE ProductID = NEW.ProductID;
END$$

DELIMITER ;

-- =======================================================================
-- STOCK - Trigger criado para reposição autómatica após devolução aprovada.
-- ========================================================================

-- Quando uma devolução muda para o status 'RECEBIDA', os produtos
-- daquele pedido são adicionados novamente ao estoque.
-- Exemplo: estoque = 7, devolução = 3, novo estoque = 10.

DELIMITER $$

CREATE TRIGGER trg_stock_devolucao_recebida
AFTER UPDATE ON Returns
FOR EACH ROW
BEGIN
  IF NEW.ReturnStatus = 'RECEBIDA' AND OLD.ReturnStatus <> 'RECEBIDA' THEN
    UPDATE Stock s
    JOIN Inventory i ON i.ProductID = s.ProductID
    SET s.QuantityAvailable = s.QuantityAvailable + i.Quantity
    WHERE i.OrderID = NEW.OrderID;
  END IF;
END$$

DELIMITER ;

-- =====================================================================
-- LOGS - Registra uma log toda vez que  o preço do produto for alterado.
-- ======================================================================

-- Quando o preço de um produto é alterado, a trigger verifica se houve
-- mudança e registra automaticamente essa alteração na tabela Logs.
-- O registro guarda o funcionário responsável, o produto, o preço antigo
-- e o novo preço.

DELIMITER $$

CREATE TRIGGER trg_log_alteracao_preco
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
  IF NEW.Price <> OLD.Price THEN
    INSERT INTO Logs (EmployeeID, ProductID, Actions, OldValue, NewValue)
    VALUES (NEW.EmployeeID, NEW.ProductID, 'Alteração de preço', OLD.Price, NEW.Price);
  END IF;
END$$

DELIMITER ;

-- =================================================================
-- STOCK - Trigger que impede que o estoque receba valores NEGATIVOS
-- =================================================================

-- Antes de atualizar o estoque, a trigger verifica se a nova quantidade
-- ficaria menor que zero. Caso isso aconteça, a operação é bloqueada
-- e o MySQL retorna uma mensagem informando que o estoque é insuficiente.

DELIMITER $$

CREATE TRIGGER trg_stock_impede_negativo
BEFORE UPDATE ON Stock
FOR EACH ROW
BEGIN
  IF NEW.QuantityAvailable < 0 THEN
    SIGNAL SQLSTATE '45000' -- Serve pra interromper uma operação no MYSQL
    SET MESSAGE_TEXT = 'Estoque insuficiente para esta operação';
  END IF;
END$$

DELIMITER ;
