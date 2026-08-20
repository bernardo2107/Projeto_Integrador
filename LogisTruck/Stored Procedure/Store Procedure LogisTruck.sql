USE LogisTruck;

DELIMITER $$

-- =========================================================
-- 1. CLIENTES B2B
-- Regra: impede o cadastro de clientes com CNPJ duplicado.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_cliente$$
CREATE PROCEDURE sp_cadastrar_cliente(
    IN p_razao_social VARCHAR(120),
    IN p_cnpj VARCHAR(18),
    IN p_email VARCHAR(120),
    IN p_telefone VARCHAR(20),
    IN p_endereco VARCHAR(150),
    IN p_cidade VARCHAR(80),
    IN p_estado CHAR(2)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_existe
    FROM clientes_b2b
    WHERE cnpj = p_cnpj;

    IF v_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Já existe um cliente cadastrado com este CNPJ.';
    ELSE
        INSERT INTO clientes_b2b(
            razao_social, cnpj, email, telefone,
            endereco, cidade, estado
        )
        VALUES(
            p_razao_social, p_cnpj, p_email, p_telefone,
            p_endereco, p_cidade, p_estado
        );
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_cliente,
           'Cliente cadastrado com sucesso.' AS mensagem;
END$$


-- =========================================================
-- 2. MOTORISTAS
-- Regra: valida CPF/CNH duplicados e validade da CNH.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_motorista$$
CREATE PROCEDURE sp_cadastrar_motorista(
    IN p_nome VARCHAR(120),
    IN p_cpf VARCHAR(14),
    IN p_cnh VARCHAR(20),
    IN p_categoria_cnh VARCHAR(5),
    IN p_validade_cnh DATE,
    IN p_telefone VARCHAR(20)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_existe
    FROM motoristas
    WHERE cpf = p_cpf OR cnh = p_cnh;

    IF v_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CPF ou CNH já cadastrado.';
    ELSEIF p_validade_cnh <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível cadastrar motorista com CNH vencida.';
    ELSE
        INSERT INTO motoristas(
            nome, cpf, cnh, categoria_cnh,
            validade_cnh, telefone
        )
        VALUES(
            p_nome, p_cpf, p_cnh, p_categoria_cnh,
            p_validade_cnh, p_telefone
        );
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_motorista,
           'Motorista cadastrado com sucesso.' AS mensagem;
END$$


-- =========================================================
-- 3. CAMINHÕES
-- Regra: valida placa, capacidade e ano do veículo.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_caminhao$$
CREATE PROCEDURE sp_cadastrar_caminhao(
    IN p_placa VARCHAR(10),
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(80),
    IN p_ano SMALLINT,
    IN p_capacidade_kg DECIMAL(12,2),
    IN p_km_atual DECIMAL(12,2)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_existe
    FROM caminhoes
    WHERE placa = p_placa;

    IF v_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Já existe um caminhão cadastrado com esta placa.';
    ELSEIF p_capacidade_kg <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A capacidade do caminhão deve ser maior que zero.';
    ELSEIF p_km_atual < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quilometragem não pode ser negativa.';
    ELSEIF p_ano < 1980 OR p_ano > YEAR(CURDATE()) + 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ano do caminhão inválido.';
    ELSE
        INSERT INTO caminhoes(
            placa, marca, modelo, ano, capacidade_kg,
            km_atual, status, usuario_ultima_alteracao
        )
        VALUES(
            p_placa, p_marca, p_modelo, p_ano,
            p_capacidade_kg, p_km_atual,
            'DISPONIVEL', CURRENT_USER()
        );
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_caminhao,
           'Caminhão cadastrado com sucesso.' AS mensagem;
END$$


-- =========================================================
-- 4. ROTAS
-- Regra: calcula automaticamente o tempo estimado da rota
-- considerando velocidade média de 55 km/h.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_cadastrar_rota$$
CREATE PROCEDURE sp_cadastrar_rota(
    IN p_origem VARCHAR(120),
    IN p_destino VARCHAR(120),
    IN p_distancia_km DECIMAL(10,2),
    IN p_pedagio_estimado DECIMAL(10,2)
)
BEGIN
    DECLARE v_tempo_estimado INT;

    IF p_origem = p_destino THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A origem e o destino não podem ser iguais.';
    ELSEIF p_distancia_km <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A distância deve ser maior que zero.';
    ELSEIF p_pedagio_estimado < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor do pedágio não pode ser negativo.';
    ELSE
        SET v_tempo_estimado = CEIL((p_distancia_km / 55) * 60);

        INSERT INTO rotas(
            origem, destino, distancia_km,
            pedagio_estimado, tempo_estimado_min
        )
        VALUES(
            p_origem, p_destino, p_distancia_km,
            p_pedagio_estimado, v_tempo_estimado
        );

        SELECT LAST_INSERT_ID() AS id_rota,
               v_tempo_estimado AS tempo_estimado_min,
               'Rota cadastrada com sucesso.' AS mensagem;
    END IF;
END$$


-- =========================================================
-- 5. ENTREGAS
-- Regra: valida cliente, motorista, caminhão e rota.
-- Também verifica CNH, capacidade do caminhão e disponibilidade.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_registrar_entrega$$
CREATE PROCEDURE sp_registrar_entrega(
    IN p_id_cliente INT UNSIGNED,
    IN p_id_motorista INT UNSIGNED,
    IN p_id_caminhao INT UNSIGNED,
    IN p_id_rota INT UNSIGNED,
    IN p_data_saida DATETIME,
    IN p_data_prevista DATETIME,
    IN p_peso_carga DECIMAL(12,2),
    IN p_valor_frete DECIMAL(12,2)
)
BEGIN
    DECLARE v_cliente_existe INT DEFAULT 0;
    DECLARE v_motorista_existe INT DEFAULT 0;
    DECLARE v_caminhao_existe INT DEFAULT 0;
    DECLARE v_rota_existe INT DEFAULT 0;
    DECLARE v_motorista_ativo BOOLEAN;
    DECLARE v_validade_cnh DATE;
    DECLARE v_capacidade DECIMAL(12,2);
    DECLARE v_status_caminhao VARCHAR(20);
    DECLARE v_rota_ativa BOOLEAN;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_cliente_existe
    FROM clientes_b2b
    WHERE id_cliente = p_id_cliente;

    SELECT COUNT(*), MAX(status_ativo), MAX(validade_cnh)
    INTO v_motorista_existe, v_motorista_ativo, v_validade_cnh
    FROM motoristas
    WHERE id_motorista = p_id_motorista;

    SELECT COUNT(*), MAX(capacidade_kg), MAX(status)
    INTO v_caminhao_existe, v_capacidade, v_status_caminhao
    FROM caminhoes
    WHERE id_caminhao = p_id_caminhao;

    SELECT COUNT(*), MAX(status_ativa)
    INTO v_rota_existe, v_rota_ativa
    FROM rotas
    WHERE id_rota = p_id_rota;

    IF v_cliente_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cliente não encontrado.';
    ELSEIF v_motorista_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Motorista não encontrado.';
    ELSEIF v_caminhao_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caminhão não encontrado.';
    ELSEIF v_rota_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rota não encontrada.';
    ELSEIF v_motorista_ativo = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O motorista informado está inativo.';
    ELSEIF v_validade_cnh < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O motorista está com a CNH vencida.';
    ELSEIF v_status_caminhao <> 'DISPONIVEL' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O caminhão não está disponível para entrega.';
    ELSEIF p_peso_carga <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O peso da carga deve ser maior que zero.';
    ELSEIF p_peso_carga > v_capacidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O peso da carga ultrapassa a capacidade do caminhão.';
    ELSEIF v_rota_ativa = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A rota informada está inativa.';
    ELSEIF p_data_prevista <= p_data_saida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A previsão de entrega deve ser posterior à saída.';
    ELSEIF p_valor_frete < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor do frete não pode ser negativo.';
    ELSE
        INSERT INTO entregas(
            id_cliente, id_motorista, id_caminhao, id_rota,
            data_saida, data_prevista, peso_carga_kg,
            valor_frete, status
        )
        VALUES(
            p_id_cliente, p_id_motorista, p_id_caminhao,
            p_id_rota, p_data_saida, p_data_prevista,
            p_peso_carga, p_valor_frete, 'EM_TRANSPORTE'
        );

        UPDATE caminhoes
        SET status = 'EM_ROTA',
            usuario_ultima_alteracao = CURRENT_USER()
        WHERE id_caminhao = p_id_caminhao;
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_entrega,
           'Entrega registrada com sucesso.' AS mensagem;
END$$


-- =========================================================
-- 6. MANUTENÇÕES
-- Regra: registra a manutenção e coloca o caminhão
-- automaticamente com status MANUTENCAO.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_registrar_manutencao$$
CREATE PROCEDURE sp_registrar_manutencao(
    IN p_id_caminhao INT UNSIGNED,
    IN p_tipo VARCHAR(20),
    IN p_data_manutencao DATE,
    IN p_km_manutencao DECIMAL(12,2),
    IN p_descricao VARCHAR(255),
    IN p_custo DECIMAL(12,2),
    IN p_proxima_manutencao_km DECIMAL(12,2)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE v_km_atual DECIMAL(12,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*), MAX(km_atual)
    INTO v_existe, v_km_atual
    FROM caminhoes
    WHERE id_caminhao = p_id_caminhao;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caminhão não encontrado.';
    ELSEIF p_tipo NOT IN ('PREVENTIVA', 'CORRETIVA') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de manutenção inválido.';
    ELSEIF p_custo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O custo da manutenção não pode ser negativo.';
    ELSEIF p_km_manutencao < v_km_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quilometragem da manutenção não pode ser menor que a quilometragem atual.';
    ELSE
        INSERT INTO manutencoes(
            id_caminhao, tipo, data_manutencao,
            km_manutencao, descricao, custo,
            proxima_manutencao_km
        )
        VALUES(
            p_id_caminhao, p_tipo, p_data_manutencao,
            p_km_manutencao, p_descricao, p_custo,
            p_proxima_manutencao_km
        );

        UPDATE caminhoes
        SET status = 'MANUTENCAO',
            km_atual = GREATEST(km_atual, p_km_manutencao),
            usuario_ultima_alteracao = CURRENT_USER()
        WHERE id_caminhao = p_id_caminhao;
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_manutencao,
           'Manutenção registrada e caminhão colocado em manutenção.' AS mensagem;
END$$


-- =========================================================
-- 7. ABASTECIMENTOS
-- Regra: valida motorista/caminhão, registra abastecimento,
-- calcula preço por litro e atualiza o odômetro do caminhão.
-- =========================================================
DROP PROCEDURE IF EXISTS sp_registrar_abastecimento$$
CREATE PROCEDURE sp_registrar_abastecimento(
    IN p_id_caminhao INT UNSIGNED,
    IN p_id_motorista INT UNSIGNED,
    IN p_litros DECIMAL(10,2),
    IN p_valor_total DECIMAL(12,2),
    IN p_km_odometro DECIMAL(12,2),
    IN p_posto VARCHAR(120)
)
BEGIN
    DECLARE v_caminhao_existe INT DEFAULT 0;
    DECLARE v_motorista_existe INT DEFAULT 0;
    DECLARE v_km_atual DECIMAL(12,2);
    DECLARE v_motorista_ativo BOOLEAN;
    DECLARE v_preco_litro DECIMAL(10,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*), MAX(km_atual)
    INTO v_caminhao_existe, v_km_atual
    FROM caminhoes
    WHERE id_caminhao = p_id_caminhao;

    SELECT COUNT(*), MAX(status_ativo)
    INTO v_motorista_existe, v_motorista_ativo
    FROM motoristas
    WHERE id_motorista = p_id_motorista;

    IF v_caminhao_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caminhão não encontrado.';
    ELSEIF v_motorista_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Motorista não encontrado.';
    ELSEIF v_motorista_ativo = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O motorista informado está inativo.';
    ELSEIF p_litros <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quantidade de combustível deve ser maior que zero.';
    ELSEIF p_valor_total <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor do abastecimento deve ser maior que zero.';
    ELSEIF p_km_odometro < v_km_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quilometragem informada é menor que a atual do caminhão.';
    ELSE
        SET v_preco_litro = p_valor_total / p_litros;

        INSERT INTO abastecimentos(
            id_caminhao, id_motorista, data_abastecimento,
            litros, valor_total, km_odometro, posto
        )
        VALUES(
            p_id_caminhao, p_id_motorista, NOW(),
            p_litros, p_valor_total, p_km_odometro, p_posto
        );

        UPDATE caminhoes
        SET km_atual = p_km_odometro,
            usuario_ultima_alteracao = CURRENT_USER()
        WHERE id_caminhao = p_id_caminhao;
    END IF;

    COMMIT;

    SELECT LAST_INSERT_ID() AS id_abastecimento,
           v_preco_litro AS preco_por_litro,
           'Abastecimento registrado com sucesso.' AS mensagem;
END$$

DELIMITER ;