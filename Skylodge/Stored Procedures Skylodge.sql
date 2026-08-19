-- ============================================================
-- SKYLODGE - STORED PROCEDURES (NÍVEL MÉDIO)
-- Uma procedure para cada uma das 12 tabelas do banco
-- ============================================================

USE skylodge;

DELIMITER $$

-- ============================================================
-- 1) cadeia_hoteleira
-- Cadastra uma nova cadeia, impedindo nomes duplicados
-- ============================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_cadeia$$
CREATE PROCEDURE sp_cadastrar_cadeia (
    IN p_nome     VARCHAR(150),
    IN p_telefone VARCHAR(20),
    IN p_email    VARCHAR(150),
    IN p_website  VARCHAR(200)
)
BEGIN
    IF EXISTS (SELECT 1 FROM cadeia_hoteleira WHERE nome = p_nome) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe uma cadeia hoteleira cadastrada com esse nome.';
    END IF;

    INSERT INTO cadeia_hoteleira (nome, telefone, email, website)
    VALUES (p_nome, p_telefone, p_email, p_website);

    SELECT LAST_INSERT_ID() AS id_cadeia_criada;
END$$


-- ============================================================
-- 2) hotel_pousada
-- Cadastra hotel/pousada validando existência da cadeia
-- e faixa de classificação (1 a 5 estrelas)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_hotel$$
CREATE PROCEDURE sp_cadastrar_hotel (
    IN p_id_cadeia    INT,
    IN p_nome         VARCHAR(150),
    IN p_tipo         ENUM('Hotel', 'Pousada'),
    IN p_endereco     VARCHAR(255),
    IN p_telefone     VARCHAR(20),
    IN p_email        VARCHAR(150),
    IN p_classificacao TINYINT UNSIGNED
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM cadeia_hoteleira WHERE id_cadeia = p_id_cadeia) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cadeia hoteleira informada não existe.';
    END IF;

    IF p_classificacao NOT BETWEEN 1 AND 5 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Classificação deve estar entre 1 e 5 estrelas.';
    END IF;

    INSERT INTO hotel_pousada (id_cadeia, nome, tipo, endereco, telefone, email, classificacao)
    VALUES (p_id_cadeia, p_nome, p_tipo, p_endereco, p_telefone, p_email, p_classificacao);

    SELECT LAST_INSERT_ID() AS id_estabelecimento_criado;
END$$


-- ============================================================
-- 3) categoria_alojamento
-- Atualiza o valor da diária de uma categoria, aplicando um
-- percentual de reajuste (positivo ou negativo)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_reajustar_valor_categoria$$
CREATE PROCEDURE sp_reajustar_valor_categoria (
    IN p_id_categoria INT,
    IN p_percentual   DECIMAL(5,2)   -- ex: 10.00 = +10%, -5.00 = -5%
)
BEGIN
    DECLARE v_valor_atual DECIMAL(10,2);
    DECLARE v_novo_valor  DECIMAL(10,2);

    SELECT valor_diaria INTO v_valor_atual
    FROM categoria_alojamento
    WHERE id_categoria = p_id_categoria;

    IF v_valor_atual IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Categoria de alojamento não encontrada.';
    END IF;

    SET v_novo_valor = ROUND(v_valor_atual * (1 + (p_percentual / 100)), 2);

    IF v_novo_valor < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O reajuste resultaria em valor negativo.';
    END IF;

    UPDATE categoria_alojamento
    SET valor_diaria = v_novo_valor
    WHERE id_categoria = p_id_categoria;

    SELECT p_id_categoria AS id_categoria, v_valor_atual AS valor_antigo, v_novo_valor AS valor_novo;
END$$


-- ============================================================
-- 4) quarto
-- Altera o status de um quarto, com regras de transição
-- (não permite reativar quarto que está em Manutenção
-- sem registrar a data da última manutenção)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_alterar_status_quarto$$
CREATE PROCEDURE sp_alterar_status_quarto (
    IN p_id_quarto  INT,
    IN p_novo_status ENUM('Disponível', 'Manutenção', 'Indisponível')
)
BEGIN
    DECLARE v_status_atual VARCHAR(20);

    SELECT status INTO v_status_atual
    FROM quarto
    WHERE id_quarto = p_id_quarto;

    IF v_status_atual IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Quarto não encontrado.';
    END IF;

    IF v_status_atual = 'Manutenção' AND p_novo_status = 'Disponível' THEN
        UPDATE quarto
        SET status = p_novo_status,
            ultima_manutencao = CURRENT_DATE
        WHERE id_quarto = p_id_quarto;
    ELSE
        UPDATE quarto
        SET status = p_novo_status
        WHERE id_quarto = p_id_quarto;
    END IF;

    SELECT id_quarto, v_status_atual AS status_anterior, p_novo_status AS status_atual
    FROM quarto WHERE id_quarto = p_id_quarto;
END$$


-- ============================================================
-- 5) funcionario
-- Admite um novo funcionário, validando o estabelecimento
-- e definindo data de admissão automaticamente
-- ============================================================
DROP PROCEDURE IF EXISTS sp_admitir_funcionario$$
CREATE PROCEDURE sp_admitir_funcionario (
    IN p_id_estabelecimento INT,
    IN p_nome     VARCHAR(150),
    IN p_cargo    VARCHAR(100),
    IN p_telefone VARCHAR(20),
    IN p_email    VARCHAR(150),
    IN p_setor    VARCHAR(100)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM hotel_pousada WHERE id_estabelecimento = p_id_estabelecimento) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Estabelecimento informado não existe.';
    END IF;

    INSERT INTO funcionario (id_estabelecimento, nome, cargo, telefone, email, setor, data_admissao)
    VALUES (p_id_estabelecimento, p_nome, p_cargo, p_telefone, p_email, p_setor, CURRENT_DATE);

    SELECT LAST_INSERT_ID() AS id_funcionario_criado;
END$$


-- ============================================================
-- 6) cliente
-- Cadastra cliente evitando documento duplicado (idempotente:
-- se já existir, retorna o id existente em vez de duplicar)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_cliente$$
CREATE PROCEDURE sp_cadastrar_cliente (
    IN p_nome      VARCHAR(150),
    IN p_documento VARCHAR(30),
    IN p_telefone  VARCHAR(20),
    IN p_email     VARCHAR(150),
    IN p_endereco  VARCHAR(255)
)
BEGIN
    DECLARE v_id_existente INT;

    SELECT id_cliente INTO v_id_existente
    FROM cliente
    WHERE documento = p_documento
    LIMIT 1;

    IF v_id_existente IS NOT NULL THEN
        SELECT v_id_existente AS id_cliente, 'Cliente já existente, cadastro não duplicado' AS mensagem;
    ELSE
        INSERT INTO cliente (nome, documento, telefone, email, endereco)
        VALUES (p_nome, p_documento, p_telefone, p_email, p_endereco);

        SELECT LAST_INSERT_ID() AS id_cliente, 'Cliente cadastrado com sucesso' AS mensagem;
    END IF;
END$$


-- ============================================================
-- 7) reserva
-- Cria uma reserva validando disponibilidade do quarto e
-- consistência das datas
-- ============================================================
DROP PROCEDURE IF EXISTS sp_criar_reserva$$
CREATE PROCEDURE sp_criar_reserva (
    IN p_id_cliente  INT,
    IN p_id_quarto   INT,
    IN p_data_checkin  DATE,
    IN p_data_checkout DATE,
    IN p_origem_reserva VARCHAR(100),
    IN p_quantidade_hospedes TINYINT UNSIGNED,
    IN p_observacoes TEXT
)
BEGIN
    DECLARE v_status_quarto VARCHAR(20);
    DECLARE v_capacidade INT;

    SELECT q.status, c.capacidade_pessoas
    INTO v_status_quarto, v_capacidade
    FROM quarto q
    JOIN categoria_alojamento c ON c.id_categoria = q.id_categoria
    WHERE q.id_quarto = p_id_quarto;

    IF v_status_quarto IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quarto não encontrado.';
    END IF;

    IF v_status_quarto <> 'Disponível' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quarto não está disponível para reserva.';
    END IF;

    IF p_data_checkout <= p_data_checkin THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de checkout deve ser posterior à data de checkin.';
    END IF;

    IF p_quantidade_hospedes > v_capacidade THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantidade de hóspedes excede a capacidade da categoria do quarto.';
    END IF;

    INSERT INTO reserva (id_cliente, id_quarto, data_checkin_prevista, data_checkout_prevista,
                          status, origem_reserva, quantidade_hospedes, observacoes)
    VALUES (p_id_cliente, p_id_quarto, p_data_checkin, p_data_checkout,
            'Confirmada', p_origem_reserva, p_quantidade_hospedes, p_observacoes);

    SELECT LAST_INSERT_ID() AS id_reserva_criada;
END$$


-- ============================================================
-- 8) checkin
-- Realiza checkin de uma reserva: valida status da reserva,
-- registra o checkin e marca o quarto como Indisponível
-- ============================================================
DROP PROCEDURE IF EXISTS sp_realizar_checkin$$
CREATE PROCEDURE sp_realizar_checkin (
    IN p_id_reserva     INT,
    IN p_recepcionista  INT,
    IN p_documentos_conferidos BOOLEAN
)
BEGIN
    DECLARE v_status_reserva VARCHAR(20);
    DECLARE v_id_quarto INT;

    SELECT status, id_quarto INTO v_status_reserva, v_id_quarto
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    IF v_status_reserva IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Reserva não encontrada.';
    END IF;

    IF v_status_reserva <> 'Confirmada' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Somente reservas Confirmadas podem realizar checkin.';
    END IF;

    START TRANSACTION;

        INSERT INTO checkin (id_reserva, recepcionista, documentos_conferidos)
        VALUES (p_id_reserva, p_recepcionista, p_documentos_conferidos);

        UPDATE quarto
        SET status = 'Indisponível'
        WHERE id_quarto = v_id_quarto;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_checkin_criado, v_id_quarto AS quarto_ocupado;
END$$


-- ============================================================
-- 9) checkout
-- Realiza checkout: calcula diárias + consumo, registra o
-- checkout, libera o quarto e conclui a reserva
-- ============================================================
DROP PROCEDURE IF EXISTS sp_realizar_checkout$$
CREATE PROCEDURE sp_realizar_checkout (
    IN p_id_reserva     INT,
    IN p_recepcionista  INT,
    IN p_forma_pagamento ENUM('Dinheiro','Cartão de Crédito','Cartão de Débito','Pix','Transferência','Outro')
)
BEGIN
    DECLARE v_id_quarto INT;
    DECLARE v_id_categoria INT;
    DECLARE v_valor_diaria DECIMAL(10,2);
    DECLARE v_qtd_diarias INT;
    DECLARE v_total_consumo DECIMAL(10,2);
    DECLARE v_total_geral DECIMAL(10,2);

    SELECT r.id_quarto, q.id_categoria,
           DATEDIFF(r.data_checkout_prevista, r.data_checkin_prevista)
    INTO v_id_quarto, v_id_categoria, v_qtd_diarias
    FROM reserva r
    JOIN quarto q ON q.id_quarto = r.id_quarto
    WHERE r.id_reserva = p_id_reserva
      AND r.status = 'Confirmada';

    IF v_id_quarto IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Reserva não encontrada ou não está em status Confirmada.';
    END IF;

    SELECT valor_diaria INTO v_valor_diaria
    FROM categoria_alojamento
    WHERE id_categoria = v_id_categoria;

    SELECT IFNULL(SUM(valor_total), 0) INTO v_total_consumo
    FROM consumo
    WHERE id_reserva = p_id_reserva;

    SET v_total_geral = (v_valor_diaria * v_qtd_diarias) + v_total_consumo;

    START TRANSACTION;

        INSERT INTO checkout (id_reserva, valor_total_diarias, recepcionista, forma_pagamento, conta_quitada)
        VALUES (p_id_reserva, v_total_geral, p_recepcionista, p_forma_pagamento, TRUE);

        UPDATE reserva
        SET status = 'Concluída'
        WHERE id_reserva = p_id_reserva;

        UPDATE quarto
        SET status = 'Disponível'
        WHERE id_quarto = v_id_quarto;

        UPDATE consumo
        SET faturado = TRUE
        WHERE id_reserva = p_id_reserva;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_checkout_criado, v_total_geral AS valor_total_cobrado;
END$$


-- ============================================================
-- 10) servico_limpeza
-- Agenda um serviço de limpeza/arrumação, impedindo duplicar
-- um serviço pendente do mesmo tipo no mesmo dia
-- ============================================================
DROP PROCEDURE IF EXISTS sp_agendar_limpeza$$
CREATE PROCEDURE sp_agendar_limpeza (
    IN p_id_quarto     INT,
    IN p_data          DATE,
    IN p_tipo_servico  ENUM('Limpeza', 'Arrumação'),
    IN p_funcionario   INT,
    IN p_observacoes   TEXT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM servico_limpeza
        WHERE id_quarto = p_id_quarto
          AND data = p_data
          AND tipo_servico = p_tipo_servico
          AND status = 'Pendente'
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe um serviço pendente do mesmo tipo agendado para esse quarto nesta data.';
    END IF;

    INSERT INTO servico_limpeza (id_quarto, data, tipo_servico, status, funcionario, observacoes)
    VALUES (p_id_quarto, p_data, p_tipo_servico, 'Pendente', p_funcionario, p_observacoes);

    SELECT LAST_INSERT_ID() AS id_limpeza_criada;
END$$


-- ============================================================
-- 11) consumo
-- Registra um novo consumo (frigobar/restaurante/outro)
-- vinculado a uma reserva ativa (não concluída/cancelada)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_registrar_consumo$$
CREATE PROCEDURE sp_registrar_consumo (
    IN p_id_reserva  INT,
    IN p_tipo        ENUM('Frigobar', 'Restaurante', 'Outro'),
    IN p_observacoes TEXT
)
BEGIN
    DECLARE v_status_reserva VARCHAR(20);

    SELECT status INTO v_status_reserva
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    IF v_status_reserva IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Reserva não encontrada.';
    END IF;

    IF v_status_reserva IN ('Cancelada', 'Concluída') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Não é possível registrar consumo em reserva cancelada ou já concluída.';
    END IF;

    INSERT INTO consumo (id_reserva, tipo, valor_total, observacoes, faturado)
    VALUES (p_id_reserva, p_tipo, 0.00, p_observacoes, FALSE);

    SELECT LAST_INSERT_ID() AS id_consumo_criado;
END$$


-- ============================================================
-- 12) item_consumo
-- Adiciona um item a um consumo já existente e recalcula
-- automaticamente o valor_total do consumo pai
-- ============================================================
DROP PROCEDURE IF EXISTS sp_adicionar_item_consumo$$
CREATE PROCEDURE sp_adicionar_item_consumo (
    IN p_id_consumo    INT,
    IN p_descricao     VARCHAR(200),
    IN p_quantidade    DECIMAL(10,2),
    IN p_valor_unitario DECIMAL(10,2),
    IN p_categoria_item VARCHAR(100)
)
BEGIN
    DECLARE v_valor_total_item DECIMAL(10,2);
    DECLARE v_id_reserva INT;

    IF NOT EXISTS (SELECT 1 FROM consumo WHERE id_consumo = p_id_consumo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Consumo não encontrado.';
    END IF;

    IF p_quantidade <= 0 OR p_valor_unitario < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantidade e valor unitário devem ser válidos e positivos.';
    END IF;

    SET v_valor_total_item = ROUND(p_quantidade * p_valor_unitario, 2);

    START TRANSACTION;

        INSERT INTO item_consumo (id_consumo, descricao, quantidade, valor_unitario, valor_total, categoria_item)
        VALUES (p_id_consumo, p_descricao, p_quantidade, p_valor_unitario, v_valor_total_item, p_categoria_item);

        UPDATE consumo
        SET valor_total = (
            SELECT IFNULL(SUM(valor_total), 0)
            FROM item_consumo
            WHERE id_consumo = p_id_consumo
        )
        WHERE id_consumo = p_id_consumo;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_item_consumo_criado, v_valor_total_item AS valor_total_item;
END$$

DELIMITER ;

-- ============================================================
-- EXEMPLOS DE CHAMADA (comentados)
-- ============================================================
-- CALL sp_cadastrar_cadeia('Nova Cadeia', '+55 11 90000-9999', 'nova@cadeia.com', 'https://nova.com');
-- CALL sp_cadastrar_hotel(1, 'Hotel Teste', 'Hotel', 'Rua X, 1', '1199999999', 'a@a.com', 4);
-- CALL sp_reajustar_valor_categoria(1, 10.00);
-- CALL sp_alterar_status_quarto(1, 'Manutenção');
-- CALL sp_admitir_funcionario(1, 'João Silva', 'Recepcionista', '1199999999', 'joao@a.com', 'Recepção');
-- CALL sp_cadastrar_cliente('Maria Souza', '99999999999', '1198888888', 'maria@a.com', 'Rua Y, 2');
-- CALL sp_criar_reserva(1, 1, '2027-01-01', '2027-01-03', 'Site', 2, 'Observação');
-- CALL sp_realizar_checkin(1, 1, TRUE);
-- CALL sp_realizar_checkout(1, 1, 'Pix');
-- CALL sp_agendar_limpeza(1, '2027-01-03', 'Limpeza', 3, 'Limpeza pós checkout');
-- CALL sp_registrar_consumo(1, 'Frigobar', 'Consumo do dia');
-- CALL sp_adicionar_item_consumo(1, 'Água mineral', 2, 6.00, 'Bebidas');