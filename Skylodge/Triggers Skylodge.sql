USE skylodge;

DELIMITER $$


-- =========================================================
-- TRIGGER 1 - CLIENTE
-- Tabela: cliente
-- Evento: BEFORE INSERT
--
-- Garante que o nome do cliente seja armazenado
-- sem espaços desnecessários no início ou no final.
-- =========================================================

CREATE TRIGGER trg_cliente_validar_nome
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN

    SET NEW.nome = TRIM(NEW.nome);

    IF NEW.nome IS NULL OR NEW.nome = '' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O nome do cliente não pode ficar vazio.';

    END IF;

END $$


-- =========================================================
-- TRIGGER 2 - RESERVA
-- Tabela: reserva
-- Evento: BEFORE INSERT
--
-- Verifica se a data de checkout é posterior à data
-- de check-in e impede reservas com datas inválidas.
-- =========================================================

CREATE TRIGGER trg_reserva_validar_datas
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN

    IF NEW.data_checkout_prevista <= NEW.data_checkin_prevista THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'A data de checkout deve ser posterior à data de check-in.';

    END IF;

END $$


-- =========================================================
-- TRIGGER 3 - CHECKOUT
-- Tabela: checkout
-- Evento: BEFORE INSERT
--
-- Impede que o valor total das diárias seja negativo.
-- =========================================================

CREATE TRIGGER trg_checkout_validar_valor
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN

    IF NEW.valor_total_diarias < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'O valor total das diárias não pode ser negativo.';

    END IF;

END $$


DELIMITER ;