USE TuneStream;
 
DROP TRIGGER IF EXISTS trg_Subscricao_BeforeInsert_ValidaDatas;
DROP TRIGGER IF EXISTS trg_Musica_BeforeInsert_ValidaDuracao;
DROP TRIGGER IF EXISTS trg_HistoricoReproducao_AfterInsert_AtualizaUltimoLogin;
 
DELIMITER $$
 
-- ---------------------------------------------------------------------
-- 1) Subscricao (BEFORE INSERT)
--    Garante que DataFim seja posterior a DataInicio antes de gravar
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Subscricao_BeforeInsert_ValidaDatas
BEFORE INSERT ON Subscricao
FOR EACH ROW
BEGIN
    IF NEW.DataFim IS NOT NULL AND NEW.DataFim <= NEW.DataInicio THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de fim da subscrição deve ser posterior à data de início.';
    END IF;
 
    -- Garante um valor padrão consistente caso não tenha sido informado
    IF NEW.StatusSubscricao IS NULL THEN
        SET NEW.StatusSubscricao = 'Ativa';
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 2) Musica (BEFORE INSERT)
--    Impede o cadastro de faixas com duração inválida (<= 0)
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Musica_BeforeInsert_ValidaDuracao
BEFORE INSERT ON Musica
FOR EACH ROW
BEGIN
    IF NEW.DuracaoSegundos IS NULL OR NEW.DuracaoSegundos <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A duração da música deve ser maior que zero segundos.';
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 3) HistoricoReproducao (AFTER INSERT)
--    Toda vez que o utilizador ouve uma música, o seu UltimoLogin
--    é atualizado automaticamente (indício de atividade recente)
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_HistoricoReproducao_AfterInsert_AtualizaUltimoLogin
AFTER INSERT ON HistoricoReproducao
FOR EACH ROW
BEGIN
    UPDATE Utilizador
    SET UltimoLogin = NEW.DataHora
    WHERE IdUtilizador = NEW.IdUtilizador
      AND (UltimoLogin IS NULL OR UltimoLogin < NEW.DataHora);
END $$
 
DELIMITER ;
 