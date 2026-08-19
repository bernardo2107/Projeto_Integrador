-- =====================================================================
-- MedPet - Triggers
-- Cobre 5 tabelas diferentes: Animal, Internamento, Pagamento, Consulta e Vacina
-- =====================================================================

USE MedPet;

-- =====================================================================
-- Tabela de apoio para auditoria (necessária para o trigger 6)
-- =====================================================================
CREATE TABLE IF NOT EXISTS LogAlteracoesConsulta (
    IdLog INT PRIMARY KEY AUTO_INCREMENT,
    IdConsulta INT,
    DiagnosticoAntigo VARCHAR(255),
    DiagnosticoNovo VARCHAR(255),
    DataAlteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdConsulta) REFERENCES Consulta(IdConsulta)
);

-- Remover triggers antigos, caso existam (permite reexecutar o script)
DROP TRIGGER IF EXISTS trg_Animal_BeforeInsert_ValidaData;
DROP TRIGGER IF EXISTS trg_Animal_BeforeUpdate_ValidaData;
DROP TRIGGER IF EXISTS trg_Internamento_BeforeInsert_ValidaDatas;
DROP TRIGGER IF EXISTS trg_Internamento_BeforeUpdate_ValidaDatas;
DROP TRIGGER IF EXISTS trg_Pagamento_AfterInsert_AtualizaFatura;
DROP TRIGGER IF EXISTS trg_Consulta_AfterUpdate_LogDiagnostico;
DROP TRIGGER IF EXISTS trg_Vacina_BeforeInsert_ProximaDose;

DELIMITER $$

-- ---------------------------------------------------------------------
-- 1) Animal (BEFORE INSERT) - impede data de nascimento inválida
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Animal_BeforeInsert_ValidaData
BEFORE INSERT ON Animal
FOR EACH ROW
BEGIN
    IF NEW.DataNascimento IS NOT NULL AND NEW.DataNascimento > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de nascimento do animal não pode ser no futuro.';
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 2) Animal (BEFORE UPDATE) - mesma validação ao editar o registro
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Animal_BeforeUpdate_ValidaData
BEFORE UPDATE ON Animal
FOR EACH ROW
BEGIN
    IF NEW.DataNascimento IS NOT NULL AND NEW.DataNascimento > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de nascimento do animal não pode ser no futuro.';
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 3) Internamento (BEFORE INSERT) - garante DataSaida >= DataEntrada
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Internamento_BeforeInsert_ValidaDatas
BEFORE INSERT ON Internamento
FOR EACH ROW
BEGIN
    IF NEW.DataSaida IS NOT NULL AND NEW.DataSaida < NEW.DataEntrada THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de saída não pode ser anterior à data de entrada.';
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 4) Internamento (BEFORE UPDATE) - mesma validação ao editar
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Internamento_BeforeUpdate_ValidaDatas
BEFORE UPDATE ON Internamento
FOR EACH ROW
BEGIN
    IF NEW.DataSaida IS NOT NULL AND NEW.DataSaida < NEW.DataEntrada THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de saída não pode ser anterior à data de entrada.';
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 5) Pagamento (AFTER INSERT) - atualiza automaticamente o Estado da Fatura
--    (funciona mesmo quando o INSERT é feito direto, sem passar pela procedure)
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Pagamento_AfterInsert_AtualizaFatura
AFTER INSERT ON Pagamento
FOR EACH ROW
BEGIN
    DECLARE v_Total     DECIMAL(10,2);
    DECLARE v_TotalPago DECIMAL(10,2);
    DECLARE v_Estado    VARCHAR(30);

    SELECT Total, Estado INTO v_Total, v_Estado
    FROM Fatura
    WHERE IdFatura = NEW.IdFatura;

    SELECT IFNULL(SUM(ValorPagamento), 0) INTO v_TotalPago
    FROM Pagamento
    WHERE IdFatura = NEW.IdFatura;

    -- Não mexe em faturas já canceladas
    IF v_Estado <> 'Cancelada' THEN
        IF v_TotalPago >= v_Total THEN
            UPDATE Fatura SET Estado = 'Paga' WHERE IdFatura = NEW.IdFatura;
        ELSE
            UPDATE Fatura SET Estado = 'Pendente' WHERE IdFatura = NEW.IdFatura;
        END IF;
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 6) Consulta (AFTER UPDATE) - audita alterações de diagnóstico
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Consulta_AfterUpdate_LogDiagnostico
AFTER UPDATE ON Consulta
FOR EACH ROW
BEGIN
    IF NOT (NEW.Diagnostico <=> OLD.Diagnostico) THEN
        INSERT INTO LogAlteracoesConsulta (IdConsulta, DiagnosticoAntigo, DiagnosticoNovo)
        VALUES (OLD.IdConsulta, OLD.Diagnostico, NEW.Diagnostico);
    END IF;
END $$

-- ---------------------------------------------------------------------
-- 7) Vacina (BEFORE INSERT) - preenche ProximaDose automaticamente
--    quando não informada (1 ano após a aplicação)
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_Vacina_BeforeInsert_ProximaDose
BEFORE INSERT ON Vacina
FOR EACH ROW
BEGIN
    IF NEW.ProximaDose IS NULL AND NEW.DataAplicacao IS NOT NULL THEN
        SET NEW.ProximaDose = DATE_ADD(NEW.DataAplicacao, INTERVAL 1 YEAR);
    END IF;
END $$

DELIMITER ;

-- =====================================================================
-- Exemplos de teste (descomentar para validar)
-- =====================================================================
-- Deve falhar (data futura):
-- INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento)
-- VALUES (1, 'Teste', 'Cão', 'SRD', 'Macho', '2099-01-01');

-- Deve falhar (saída antes da entrada):
-- INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes)
-- VALUES (1, '2026-08-10', '2026-08-01', 'Teste', 'Teste');

-- Atualiza automaticamente o estado da fatura para 'Paga' se o valor cobrir o total:
-- INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia)
-- VALUES (1, CURDATE(), 99999.00, 'Pix', 'REF-TESTE');
-- SELECT Estado FROM Fatura WHERE IdFatura = 1;

-- Gera registro de auditoria:
-- UPDATE Consulta SET Diagnostico = 'Novo diagnóstico de teste' WHERE IdConsulta = 1;
-- SELECT * FROM LogAlteracoesConsulta WHERE IdConsulta = 1;

-- Preenche ProximaDose automaticamente:
-- INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote)
-- VALUES (1, 'Teste Vacina', '2026-08-19', 'L0000-X');
-- SELECT * FROM Vacina ORDER BY IdVacina DESC LIMIT 1;