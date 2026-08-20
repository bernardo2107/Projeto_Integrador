CREATE DATABASE IF NOT EXISTS LogisTruck;

USE LogisTruck;


-- =========================================================
-- 1. CLIENTES B2B
-- =========================================================

CREATE TABLE clientes_b2b (
    id_cliente INT UNSIGNED AUTO_INCREMENT,
    razao_social VARCHAR(120) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    email VARCHAR(120),
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    cidade VARCHAR(80),
    estado CHAR(2),

    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente),
    CONSTRAINT uk_cliente_cnpj UNIQUE (cnpj)
);


-- =========================================================
-- 2. MOTORISTAS
-- =========================================================

CREATE TABLE motoristas (
    id_motorista INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cnh VARCHAR(20) NOT NULL,
    categoria_cnh VARCHAR(5) NOT NULL,
    validade_cnh DATE NOT NULL,
    telefone VARCHAR(20),

    CONSTRAINT pk_motoristas PRIMARY KEY (id_motorista),
    CONSTRAINT uk_motorista_cpf UNIQUE (cpf),
    CONSTRAINT uk_motorista_cnh UNIQUE (cnh)
);


-- =========================================================
-- 3. CAMINHOES
-- =========================================================

CREATE TABLE caminhoes (
    id_caminhao INT UNSIGNED AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    ano SMALLINT NOT NULL,
    capacidade_kg DECIMAL(12,2) NOT NULL,
    km_atual DECIMAL(12,2)
        NOT NULL DEFAULT 0,
    status ENUM('DISPONIVEL','EM_ROTA','MANUTENCAO','INATIVO') NOT NULL DEFAULT 'DISPONIVEL',
    
    CONSTRAINT pk_caminhoes PRIMARY KEY (id_caminhao),
    CONSTRAINT uk_caminhao_placa UNIQUE (placa),
    CONSTRAINT chk_capacidade CHECK (capacidade_kg > 0),
    CONSTRAINT chk_km CHECK (km_atual >= 0)
);


-- =========================================================
-- 4. ROTAS
-- =========================================================

CREATE TABLE rotas (
    id_rota INT UNSIGNED AUTO_INCREMENT,
    origem VARCHAR(120) NOT NULL,
    destino VARCHAR(120) NOT NULL,
    distancia_km DECIMAL(10,2) NOT NULL,
    pedagio_estimado DECIMAL(10,2) DEFAULT 0,
    tempo_estimado_min INT,

    CONSTRAINT pk_rotas PRIMARY KEY (id_rota),
    CONSTRAINT chk_distancia CHECK (distancia_km > 0)
);


-- =========================================================
-- 5. ENTREGAS
-- =========================================================

CREATE TABLE entregas (
    id_entrega BIGINT UNSIGNED AUTO_INCREMENT,
    id_cliente INT UNSIGNED NOT NULL,
    id_motorista INT UNSIGNED NOT NULL,
    id_caminhao INT UNSIGNED NOT NULL,
    id_rota INT UNSIGNED NOT NULL,
    data_saida DATETIME NOT NULL,
    data_prevista DATETIME NOT NULL,
    data_entrega DATETIME NULL,
    peso_carga_kg DECIMAL(12,2) NOT NULL,
    valor_frete DECIMAL(12,2) NOT NULL,

    status ENUM('AGENDADA','EM_TRANSPORTE','ENTREGUE','CANCELADA') DEFAULT 'AGENDADA',

    CONSTRAINT pk_entregas PRIMARY KEY (id_entrega),
    CONSTRAINT fk_entrega_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_b2b(id_cliente),
    CONSTRAINT fk_entrega_motorista FOREIGN KEY (id_motorista) REFERENCES motoristas(id_motorista),
    CONSTRAINT fk_entrega_caminhao FOREIGN KEY (id_caminhao) REFERENCES caminhoes(id_caminhao),
    CONSTRAINT fk_entrega_rota FOREIGN KEY (id_rota) REFERENCES rotas(id_rota),
    CONSTRAINT chk_peso_entrega CHECK (peso_carga_kg > 0),
    CONSTRAINT chk_valor_frete CHECK (valor_frete >= 0)
);


-- =========================================================
-- 6. MANUTENCOES
-- =========================================================

CREATE TABLE manutencoes (
    id_manutencao BIGINT UNSIGNED AUTO_INCREMENT,
    id_caminhao INT UNSIGNED NOT NULL,
    tipo ENUM('PREVENTIVA','CORRETIVA') NOT NULL,
    data_manutencao DATE NOT NULL,
    km_manutencao DECIMAL(12,2),
    descricao VARCHAR(255),
    custo DECIMAL(12,2) DEFAULT 0,
    proxima_manutencao_km DECIMAL(12,2),
    
    CONSTRAINT pk_manutencoes PRIMARY KEY (id_manutencao),
    CONSTRAINT fk_manutencao_caminhao FOREIGN KEY (id_caminhao) REFERENCES caminhoes(id_caminhao),
    CONSTRAINT chk_custo_manutencao CHECK (custo >= 0)
);


-- =========================================================
-- 7. ABASTECIMENTOS
-- =========================================================

CREATE TABLE abastecimentos (
    id_abastecimento BIGINT UNSIGNED AUTO_INCREMENT,
    id_caminhao INT UNSIGNED NOT NULL,
    id_motorista INT UNSIGNED NOT NULL,
    data_abastecimento DATETIME NOT NULL,
    litros DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(12,2) NOT NULL,
    km_odometro DECIMAL(12,2) NOT NULL,
    posto VARCHAR(120),

    CONSTRAINT pk_abastecimentos PRIMARY KEY (id_abastecimento),
    CONSTRAINT fk_abastecimento_caminhao FOREIGN KEY (id_caminhao) REFERENCES caminhoes(id_caminhao),
    CONSTRAINT fk_abastecimento_motorista FOREIGN KEY (id_motorista) REFERENCES motoristas(id_motorista),
    CONSTRAINT chk_litros CHECK (litros > 0),
    CONSTRAINT chk_valor_abastecimento CHECK (valor_total > 0)
);