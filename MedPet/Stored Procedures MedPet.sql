DROP PROCEDURE IF EXISTS sp_CadastrarDono;
DROP PROCEDURE IF EXISTS sp_ListarAnimaisPorDono;
DROP PROCEDURE IF EXISTS sp_HistoricoConsultasAnimal;
DROP PROCEDURE IF EXISTS sp_RegistrarInternamento;
DROP PROCEDURE IF EXISTS sp_AtualizarHistoricoMedico;
DROP PROCEDURE IF EXISTS sp_RelatorioFaturasPorDono;
DROP PROCEDURE IF EXISTS sp_RegistrarVacina;
DROP PROCEDURE IF EXISTS sp_ProcessarPagamento;
 
DELIMITER $$
 
-- ---------------------------------------------------------------------
-- 1) Dono: cadastra um novo dono, validando e-mail duplicado
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_CadastrarDono(
    IN  p_Nome      VARCHAR(50),
    IN  p_Telefone  VARCHAR(15),
    IN  p_Email     VARCHAR(100),
    IN  p_Endereco  VARCHAR(50),
    OUT p_IdDono    INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Dono WHERE EmailDono = p_Email) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe um dono cadastrado com este e-mail.';
    ELSE
        INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono, DataCadastro)
        VALUES (p_Nome, p_Telefone, p_Email, p_Endereco, CURDATE());
 
        SET p_IdDono = LAST_INSERT_ID();
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 2) Animal: lista os animais de um dono, com idade calculada
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_ListarAnimaisPorDono(
    IN p_IdDono INT
)
BEGIN
    DECLARE v_Total INT;
 
    SELECT COUNT(*) INTO v_Total FROM Animal WHERE IdDono = p_IdDono;
 
    IF v_Total = 0 THEN
        SELECT CONCAT('Nenhum animal encontrado para o dono ID ', p_IdDono) AS Aviso;
    ELSE
        SELECT
            a.IdAnimal,
            a.NomeAnimal,
            a.EspecieAnimal,
            a.RacaAnimal,
            a.SexoAnimal,
            a.DataNascimento,
            TIMESTAMPDIFF(YEAR, a.DataNascimento, CURDATE()) AS IdadeAnos,
            a.Peso
        FROM Animal a
        WHERE a.IdDono = p_IdDono
        ORDER BY a.NomeAnimal;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 3) Consulta: histórico de consultas de um animal + total de consultas
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_HistoricoConsultasAnimal(
    IN p_IdAnimal INT
)
BEGIN
    DECLARE v_QtdConsultas INT;
 
    SELECT COUNT(*) INTO v_QtdConsultas
    FROM Consulta
    WHERE IdAnimal = p_IdAnimal;
 
    SELECT
        c.IdConsulta,
        c.DataHora,
        c.Motivo,
        c.Diagnostico,
        c.Veterinario,
        c.Observacoes
    FROM Consulta c
    WHERE c.IdAnimal = p_IdAnimal
    ORDER BY c.DataHora DESC;
 
    SELECT v_QtdConsultas AS TotalConsultas;
END $$
 
-- ---------------------------------------------------------------------
-- 4) Internamento: registra internamento com validações e custo estimado
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RegistrarInternamento(
    IN p_IdAnimal     INT,
    IN p_DataEntrada  DATE,
    IN p_DataSaida    DATE,
    IN p_Motivo       VARCHAR(255),
    IN p_Observacoes  TEXT,
    IN p_CustoDiario  DECIMAL(10,2)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Animal WHERE IdAnimal = p_IdAnimal) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Animal não encontrado.';
    ELSEIF p_DataSaida IS NOT NULL AND p_DataSaida < p_DataEntrada THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A data de saída não pode ser anterior à data de entrada.';
    ELSE
        INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes, CustoDiario)
        VALUES (p_IdAnimal, p_DataEntrada, p_DataSaida, p_Motivo, p_Observacoes, p_CustoDiario);
 
        SELECT
            LAST_INSERT_ID() AS IdInternamentoGerado,
            IFNULL(DATEDIFF(p_DataSaida, p_DataEntrada), 0) AS DiasInternado,
            IFNULL(DATEDIFF(p_DataSaida, p_DataEntrada), 0) * p_CustoDiario AS CustoEstimado;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 5) HistoricoMedico: cria ou atualiza (upsert) o histórico do animal
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_AtualizarHistoricoMedico(
    IN p_IdAnimal            INT,
    IN p_ObservacoesGerais   VARCHAR(255),
    IN p_Alergias            VARCHAR(90)
)
BEGIN
    DECLARE v_IdHistorico INT;
 
    SELECT IdHistorico INTO v_IdHistorico
    FROM HistoricoMedico
    WHERE IdAnimal = p_IdAnimal
    ORDER BY IdHistorico DESC
    LIMIT 1;
 
    IF v_IdHistorico IS NULL THEN
        INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias, DataAtualizacao)
        VALUES (p_IdAnimal, p_ObservacoesGerais, p_Alergias, NOW());
 
        SELECT LAST_INSERT_ID() AS IdHistorico, 'Novo histórico criado' AS Status;
    ELSE
        UPDATE HistoricoMedico
        SET ObservacoesGerais = p_ObservacoesGerais,
            Alergias = p_Alergias,
            DataAtualizacao = NOW()
        WHERE IdHistorico = v_IdHistorico;
 
        SELECT v_IdHistorico AS IdHistorico, 'Histórico atualizado' AS Status;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 6) Fatura: relatório de faturas de um dono, com filtro opcional de estado
--    (percorre Fatura -> Consulta/Internamento -> Animal -> Dono)
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RelatorioFaturasPorDono(
    IN p_IdDono INT,
    IN p_Estado VARCHAR(30)   -- passar NULL para trazer todos os estados
)
BEGIN
    SELECT
        d.NomeDono,
        f.IdFatura,
        f.NumeroFatura,
        f.DataEmissao,
        f.DataVencimento,
        f.Total,
        f.Estado
    FROM Fatura f
    LEFT JOIN Consulta c      ON f.IdConsulta = c.IdConsulta
    LEFT JOIN Internamento i  ON f.IdInternamento = i.IdInternamento
    INNER JOIN Animal a       ON a.IdAnimal = COALESCE(c.IdAnimal, i.IdAnimal)
    INNER JOIN Dono d         ON d.IdDono = a.IdDono
    WHERE d.IdDono = p_IdDono
      AND (p_Estado IS NULL OR f.Estado = p_Estado)
    ORDER BY f.DataEmissao DESC;
 
    SELECT
        COUNT(*)     AS QtdFaturas,
        SUM(f.Total) AS ValorTotal
    FROM Fatura f
    LEFT JOIN Consulta c      ON f.IdConsulta = c.IdConsulta
    LEFT JOIN Internamento i  ON f.IdInternamento = i.IdInternamento
    INNER JOIN Animal a       ON a.IdAnimal = COALESCE(c.IdAnimal, i.IdAnimal)
    INNER JOIN Dono d         ON d.IdDono = a.IdDono
    WHERE d.IdDono = p_IdDono
      AND (p_Estado IS NULL OR f.Estado = p_Estado);
END $$
 
-- ---------------------------------------------------------------------
-- 7) Vacina: registra vacina evitando duplicidade em curto período
--    e calcula automaticamente a próxima dose (1 ano depois)
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RegistrarVacina(
    IN p_IdHistorico   INT,
    IN p_NomeVacina    VARCHAR(50),
    IN p_DataAplicacao DATE,
    IN p_Lote          VARCHAR(80),
    IN p_Veterinario   VARCHAR(100)
)
BEGIN
    DECLARE v_QtdRecente INT;
 
    SELECT COUNT(*) INTO v_QtdRecente
    FROM Vacina
    WHERE IdHistorico = p_IdHistorico
      AND NomeVacina = p_NomeVacina
      AND DataAplicacao >= DATE_SUB(p_DataAplicacao, INTERVAL 30 DAY);
 
    IF v_QtdRecente > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe aplicação desta vacina nos últimos 30 dias.';
    ELSE
        INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose, Veterinario)
        VALUES (
            p_IdHistorico, p_NomeVacina, p_DataAplicacao, p_Lote,
            DATE_ADD(p_DataAplicacao, INTERVAL 1 YEAR), p_Veterinario
        );
 
        SELECT
            LAST_INSERT_ID() AS IdVacinaGerada,
            DATE_ADD(p_DataAplicacao, INTERVAL 1 YEAR) AS ProximaDoseCalculada;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 8) Pagamento: processa um pagamento dentro de uma transação,
--    atualizando o estado da fatura conforme o saldo devedor
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_ProcessarPagamento(
    IN p_IdFatura         INT,
    IN p_ValorPagamento   DECIMAL(10,2),
    IN p_MetodoPagamento  VARCHAR(50),
    IN p_Referencia       VARCHAR(100)
)
BEGIN
    DECLARE v_Total      DECIMAL(10,2);
    DECLARE v_JaPago     DECIMAL(10,2);
    DECLARE v_NovoTotal  DECIMAL(10,2);
 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
 
    START TRANSACTION;
 
    SELECT Total INTO v_Total
    FROM Fatura
    WHERE IdFatura = p_IdFatura
    FOR UPDATE;
 
    IF v_Total IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fatura não encontrada.';
    END IF;
 
    SELECT IFNULL(SUM(ValorPagamento), 0) INTO v_JaPago
    FROM Pagamento
    WHERE IdFatura = p_IdFatura;
 
    INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia, StatusPagamento)
    VALUES (p_IdFatura, CURDATE(), p_ValorPagamento, p_MetodoPagamento, p_Referencia, 'Confirmado');
 
    SET v_NovoTotal = v_JaPago + p_ValorPagamento;
 
    IF v_NovoTotal >= v_Total THEN
        UPDATE Fatura SET Estado = 'Paga' WHERE IdFatura = p_IdFatura;
    ELSE
        UPDATE Fatura SET Estado = 'Pendente' WHERE IdFatura = p_IdFatura;
    END IF;
 
    COMMIT;
 
    SELECT
        p_IdFatura AS IdFatura,
        v_NovoTotal AS TotalPago,
        v_Total AS ValorFatura,
        (v_Total - v_NovoTotal) AS Saldo;
END $$
 
DELIMITER ;
