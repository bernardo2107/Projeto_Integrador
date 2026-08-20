USE LogisTruck;

DELIMITER $$

-- =========================================================
-- TRIGGER 1 - ENTREGAS
-- Ao finalizar uma entrega, registra automaticamente a data
-- da entrega e libera o caminhão para uma nova operação.
-- =========================================================
DROP TRIGGER IF EXISTS trg_finalizar_entrega$$

CREATE TRIGGER trg_finalizar_entrega
BEFORE UPDATE ON entregas
FOR EACH ROW
BEGIN
    IF NEW.status = 'ENTREGUE' AND OLD.status <> 'ENTREGUE' THEN
        SET NEW.data_entrega = NOW();

        UPDATE caminhoes
        SET status = 'DISPONIVEL',
            usuario_ultima_alteracao = CURRENT_USER()
        WHERE id_caminhao = NEW.id_caminhao;
    END IF;
END$$


-- =========================================================
-- TRIGGER 2 - MANUTENÇÕES
-- Sempre que uma manutenção for registrada, o caminhão
-- entra automaticamente em status de MANUTENCAO.
-- Também atualiza sua quilometragem quando necessário.
-- =========================================================
DROP TRIGGER IF EXISTS trg_manutencao_caminhao$$

CREATE TRIGGER trg_manutencao_caminhao
AFTER INSERT ON manutencoes
FOR EACH ROW
BEGIN
    UPDATE caminhoes
    SET status = 'MANUTENCAO',
        km_atual = GREATEST(km_atual, NEW.km_manutencao),
        usuario_ultima_alteracao = CURRENT_USER()
    WHERE id_caminhao = NEW.id_caminhao;
END$$


-- =========================================================
-- TRIGGER 3 - ABASTECIMENTOS
-- Após um abastecimento, atualiza automaticamente o
-- odômetro atual do caminhão caso a nova quilometragem
-- seja maior que a registrada anteriormente.
-- =========================================================
DROP TRIGGER IF EXISTS trg_atualizar_km_abastecimento$$

CREATE TRIGGER trg_atualizar_km_abastecimento
AFTER INSERT ON abastecimentos
FOR EACH ROW
BEGIN
    UPDATE caminhoes
    SET km_atual = NEW.km_odometro,
        usuario_ultima_alteracao = CURRENT_USER()
    WHERE id_caminhao = NEW.id_caminhao
      AND NEW.km_odometro > km_atual;
END$$

DELIMITER ;