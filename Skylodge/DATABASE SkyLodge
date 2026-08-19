DROP DATABASE IF EXISTS skylodge;
CREATE DATABASE skylodge
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE skylodge;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS cadeia_hoteleira;
CREATE TABLE cadeia_hoteleira (
    id_cadeia      INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(150) NOT NULL,
    telefone       VARCHAR(20),
    email          VARCHAR(150),
    website        VARCHAR(200)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS hotel_pousada;
CREATE TABLE hotel_pousada (
    id_estabelecimento INT AUTO_INCREMENT PRIMARY KEY,
    id_cadeia           INT NOT NULL,
    nome                 VARCHAR(150) NOT NULL,
    tipo                 ENUM('Hotel', 'Pousada') NOT NULL,
    endereco             VARCHAR(255),
    telefone             VARCHAR(20),
    email                VARCHAR(150),
    classificacao        TINYINT UNSIGNED COMMENT 'Classificação em estrelas (1 a 5)',
    CONSTRAINT fk_hotel_cadeia
        FOREIGN KEY (id_cadeia) REFERENCES cadeia_hoteleira (id_cadeia)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_classificacao CHECK (classificacao BETWEEN 1 AND 5)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS categoria_alojamento;
CREATE TABLE categoria_alojamento (
    id_categoria        INT AUTO_INCREMENT PRIMARY KEY,
    id_estabelecimento  INT NOT NULL,
    nome                 VARCHAR(100) NOT NULL,
    descricao            TEXT,
    capacidade_pessoas   TINYINT UNSIGNED NOT NULL,
    amenidades_inclusas  TEXT COMMENT 'Atributo derivado/observação - amenidades inclusas na categoria',
    CONSTRAINT fk_categoria_estabelecimento
        FOREIGN KEY (id_estabelecimento) REFERENCES hotel_pousada (id_estabelecimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS quarto;
CREATE TABLE quarto (
    id_quarto           INT AUTO_INCREMENT PRIMARY KEY,
    id_estabelecimento  INT NOT NULL,
    id_categoria         INT NOT NULL,
    numero               VARCHAR(10) NOT NULL,
    andar                VARCHAR(10),
    status               ENUM('Disponível', 'Manutenção', 'Indisponível') NOT NULL DEFAULT 'Disponível',
    localizacao          VARCHAR(150) COMMENT 'Atributo derivado/observação - localização do quarto',
    CONSTRAINT fk_quarto_estabelecimento
        FOREIGN KEY (id_estabelecimento) REFERENCES hotel_pousada (id_estabelecimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_quarto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria_alojamento (id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT uq_quarto_numero UNIQUE (id_estabelecimento, numero)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS funcionario;
CREATE TABLE funcionario (
    id_funcionario  INT AUTO_INCREMENT PRIMARY KEY,
    id_estabelecimento INT NOT NULL,
    nome             VARCHAR(150) NOT NULL,
    cargo            VARCHAR(100) NOT NULL,
    telefone         VARCHAR(20),
    email            VARCHAR(150),
    setor            VARCHAR(100) COMMENT 'Atributo derivado/observação - setor do funcionário',
    CONSTRAINT fk_funcionario_estabelecimento
        FOREIGN KEY (id_estabelecimento) REFERENCES hotel_pousada (id_estabelecimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
    id_cliente  INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(150) NOT NULL,
    documento    VARCHAR(30) NOT NULL,
    telefone     VARCHAR(20),
    email        VARCHAR(150),
    endereco     VARCHAR(255),
    CONSTRAINT uq_cliente_documento UNIQUE (documento)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS reserva;
CREATE TABLE reserva (
    id_reserva            INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente             INT NOT NULL,
    id_quarto              INT NOT NULL,
    data_reserva            DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_checkin_prevista   DATE NOT NULL,
    data_checkout_prevista  DATE NOT NULL,
    status                  ENUM('Confirmada', 'Cancelada', 'No-show', 'Concluída') NOT NULL DEFAULT 'Confirmada',
    origem_reserva          VARCHAR(100) COMMENT 'Atributo derivado/observação - ex: site, telefone, balcão, OTA',
    observacoes             TEXT COMMENT 'Atributo derivado/observação',
    CONSTRAINT fk_reserva_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_reserva_quarto
        FOREIGN KEY (id_quarto) REFERENCES quarto (id_quarto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_datas_reserva CHECK (data_checkout_prevista > data_checkin_prevista)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS checkin;
CREATE TABLE checkin (
    id_checkin      INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva       INT NOT NULL,
    data_hora         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    recepcionista     INT NOT NULL COMMENT 'FK para funcionario (recepcionista responsável)',
    CONSTRAINT fk_checkin_reserva
        FOREIGN KEY (id_reserva) REFERENCES reserva (id_reserva)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_checkin_funcionario
        FOREIGN KEY (recepcionista) REFERENCES funcionario (id_funcionario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


DROP TABLE IF EXISTS checkout;
CREATE TABLE checkout (
    id_checkout        INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva           INT NOT NULL,
    data_hora             DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total_diarias   DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    recepcionista         INT NOT NULL COMMENT 'FK para funcionario (recepcionista responsável)',
    forma_pagamento       ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'Pix', 'Transferência', 'Outro') NOT NULL,
    CONSTRAINT fk_checkout_reserva
        FOREIGN KEY (id_reserva) REFERENCES reserva (id_reserva)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_checkout_funcionario
        FOREIGN KEY (recepcionista) REFERENCES funcionario (id_funcionario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


DROP TABLE IF EXISTS servico_limpeza;
CREATE TABLE servico_limpeza (
    id_limpeza     INT AUTO_INCREMENT PRIMARY KEY,
    id_quarto        INT NOT NULL,
    data              DATE NOT NULL,
    tipo_servico      ENUM('Limpeza', 'Arrumação') NOT NULL,
    status            ENUM('Pendente', 'Concluído') NOT NULL DEFAULT 'Pendente',
    funcionario       INT NOT NULL COMMENT 'FK para funcionario responsável pelo serviço',
    observacoes       TEXT,
    CONSTRAINT fk_limpeza_quarto
        FOREIGN KEY (id_quarto) REFERENCES quarto (id_quarto)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_limpeza_funcionario
        FOREIGN KEY (funcionario) REFERENCES funcionario (id_funcionario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


DROP TABLE IF EXISTS consumo;
CREATE TABLE consumo (
    id_consumo   INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva     INT NOT NULL,
    tipo            ENUM('Frigobar', 'Restaurante', 'Outro') NOT NULL,
    data_hora       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total     DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    observacoes     TEXT,
    CONSTRAINT fk_consumo_reserva
        FOREIGN KEY (id_reserva) REFERENCES reserva (id_reserva)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS item_consumo;
CREATE TABLE item_consumo (
    id_item_consumo  INT AUTO_INCREMENT PRIMARY KEY,
    id_consumo         INT NOT NULL,
    descricao           VARCHAR(200) NOT NULL,
    quantidade          DECIMAL(10,2) NOT NULL DEFAULT 1.00,
    valor_unitario      DECIMAL(10,2) NOT NULL,
    valor_total         DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_consumo_consumo
        FOREIGN KEY (id_consumo) REFERENCES consumo (id_consumo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- ALTER TABLE - NOVAS COLUNAS 
-- =============================

ALTER TABLE cadeia_hoteleira ADD COLUMN data_cadastro DATE DEFAULT(CURRENT_DATE);
ALTER TABLE hotel_pousada ADD COLUMN horario_recepcao VARCHAR(50);
ALTER TABLE categoria_alojamento ADD COLUMN valor_diaria DECIMAL(10,2) NOT NULL DEFAULT 0.00;
ALTER TABLE quarto ADD COLUMN ultima_manutencao DATE;
ALTER TABLE funcionario ADD COLUMN data_admissao DATE;
ALTER TABLE cliente ADD COLUMN data_nascimento DATE;
ALTER TABLE reserva ADD COLUMN quantidade_hospedes TINYINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE checkin ADD COLUMN documentos_conferidos BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE checkout ADD COLUMN conta_quitada BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE servico_limpeza ADD COLUMN horario_conclusao DATETIME;
ALTER TABLE consumo ADD COLUMN faturado BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE item_consumo ADD COLUMN categoria_item VARCHAR(100);


SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (1, 'SkyLodge Cadeia 001', '+55 11 90000-0001', 'contato001@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/1');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (2, 'SkyLodge Cadeia 002', '+55 11 90000-0002', 'contato002@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/2');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (3, 'SkyLodge Cadeia 003', '+55 11 90000-0003', 'contato003@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/3');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (4, 'SkyLodge Cadeia 004', '+55 11 90000-0004', 'contato004@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/4');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (5, 'SkyLodge Cadeia 005', '+55 11 90000-0005', 'contato005@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/5');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (6, 'SkyLodge Cadeia 006', '+55 11 90000-0006', 'contato006@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/6');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (7, 'SkyLodge Cadeia 007', '+55 11 90000-0007', 'contato007@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/7');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (8, 'SkyLodge Cadeia 008', '+55 11 90000-0008', 'contato008@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/8');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (9, 'SkyLodge Cadeia 009', '+55 11 90000-0009', 'contato009@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/9');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (10, 'SkyLodge Cadeia 010', '+55 11 90000-0010', 'contato010@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/10');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (11, 'SkyLodge Cadeia 011', '+55 11 90000-0011', 'contato011@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/11');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (12, 'SkyLodge Cadeia 012', '+55 11 90000-0012', 'contato012@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/12');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (13, 'SkyLodge Cadeia 013', '+55 11 90000-0013', 'contato013@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/13');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (14, 'SkyLodge Cadeia 014', '+55 11 90000-0014', 'contato014@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/14');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (15, 'SkyLodge Cadeia 015', '+55 11 90000-0015', 'contato015@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/15');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (16, 'SkyLodge Cadeia 016', '+55 11 90000-0016', 'contato016@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/16');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (17, 'SkyLodge Cadeia 017', '+55 11 90000-0017', 'contato017@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/17');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (18, 'SkyLodge Cadeia 018', '+55 11 90000-0018', 'contato018@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/18');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (19, 'SkyLodge Cadeia 019', '+55 11 90000-0019', 'contato019@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/19');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (20, 'SkyLodge Cadeia 020', '+55 11 90000-0020', 'contato020@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/20');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (21, 'SkyLodge Cadeia 021', '+55 11 90000-0021', 'contato021@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/21');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (22, 'SkyLodge Cadeia 022', '+55 11 90000-0022', 'contato022@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/22');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (23, 'SkyLodge Cadeia 023', '+55 11 90000-0023', 'contato023@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/23');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (24, 'SkyLodge Cadeia 024', '+55 11 90000-0024', 'contato024@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/24');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (25, 'SkyLodge Cadeia 025', '+55 11 90000-0025', 'contato025@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/25');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (26, 'SkyLodge Cadeia 026', '+55 11 90000-0026', 'contato026@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/26');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (27, 'SkyLodge Cadeia 027', '+55 11 90000-0027', 'contato027@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/27');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (28, 'SkyLodge Cadeia 028', '+55 11 90000-0028', 'contato028@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/28');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (29, 'SkyLodge Cadeia 029', '+55 11 90000-0029', 'contato029@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/29');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (30, 'SkyLodge Cadeia 030', '+55 11 90000-0030', 'contato030@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/30');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (31, 'SkyLodge Cadeia 031', '+55 11 90000-0031', 'contato031@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/31');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (32, 'SkyLodge Cadeia 032', '+55 11 90000-0032', 'contato032@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/32');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (33, 'SkyLodge Cadeia 033', '+55 11 90000-0033', 'contato033@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/33');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (34, 'SkyLodge Cadeia 034', '+55 11 90000-0034', 'contato034@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/34');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (35, 'SkyLodge Cadeia 035', '+55 11 90000-0035', 'contato035@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/35');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (36, 'SkyLodge Cadeia 036', '+55 11 90000-0036', 'contato036@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/36');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (37, 'SkyLodge Cadeia 037', '+55 11 90000-0037', 'contato037@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/37');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (38, 'SkyLodge Cadeia 038', '+55 11 90000-0038', 'contato038@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/38');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (39, 'SkyLodge Cadeia 039', '+55 11 90000-0039', 'contato039@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/39');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (40, 'SkyLodge Cadeia 040', '+55 11 90000-0040', 'contato040@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/40');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (41, 'SkyLodge Cadeia 041', '+55 11 90000-0041', 'contato041@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/41');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (42, 'SkyLodge Cadeia 042', '+55 11 90000-0042', 'contato042@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/42');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (43, 'SkyLodge Cadeia 043', '+55 11 90000-0043', 'contato043@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/43');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (44, 'SkyLodge Cadeia 044', '+55 11 90000-0044', 'contato044@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/44');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (45, 'SkyLodge Cadeia 045', '+55 11 90000-0045', 'contato045@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/45');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (46, 'SkyLodge Cadeia 046', '+55 11 90000-0046', 'contato046@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/46');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (47, 'SkyLodge Cadeia 047', '+55 11 90000-0047', 'contato047@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/47');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (48, 'SkyLodge Cadeia 048', '+55 11 90000-0048', 'contato048@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/48');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (49, 'SkyLodge Cadeia 049', '+55 11 90000-0049', 'contato049@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/49');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (50, 'SkyLodge Cadeia 050', '+55 11 90000-0050', 'contato050@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/50');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (51, 'SkyLodge Cadeia 051', '+55 11 90000-0051', 'contato051@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/51');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (52, 'SkyLodge Cadeia 052', '+55 11 90000-0052', 'contato052@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/52');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (53, 'SkyLodge Cadeia 053', '+55 11 90000-0053', 'contato053@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/53');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (54, 'SkyLodge Cadeia 054', '+55 11 90000-0054', 'contato054@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/54');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (55, 'SkyLodge Cadeia 055', '+55 11 90000-0055', 'contato055@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/55');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (56, 'SkyLodge Cadeia 056', '+55 11 90000-0056', 'contato056@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/56');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (57, 'SkyLodge Cadeia 057', '+55 11 90000-0057', 'contato057@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/57');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (58, 'SkyLodge Cadeia 058', '+55 11 90000-0058', 'contato058@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/58');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (59, 'SkyLodge Cadeia 059', '+55 11 90000-0059', 'contato059@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/59');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (60, 'SkyLodge Cadeia 060', '+55 11 90000-0060', 'contato060@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/60');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (61, 'SkyLodge Cadeia 061', '+55 11 90000-0061', 'contato061@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/61');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (62, 'SkyLodge Cadeia 062', '+55 11 90000-0062', 'contato062@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/62');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (63, 'SkyLodge Cadeia 063', '+55 11 90000-0063', 'contato063@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/63');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (64, 'SkyLodge Cadeia 064', '+55 11 90000-0064', 'contato064@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/64');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (65, 'SkyLodge Cadeia 065', '+55 11 90000-0065', 'contato065@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/65');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (66, 'SkyLodge Cadeia 066', '+55 11 90000-0066', 'contato066@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/66');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (67, 'SkyLodge Cadeia 067', '+55 11 90000-0067', 'contato067@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/67');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (68, 'SkyLodge Cadeia 068', '+55 11 90000-0068', 'contato068@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/68');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (69, 'SkyLodge Cadeia 069', '+55 11 90000-0069', 'contato069@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/69');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (70, 'SkyLodge Cadeia 070', '+55 11 90000-0070', 'contato070@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/70');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (71, 'SkyLodge Cadeia 071', '+55 11 90000-0071', 'contato071@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/71');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (72, 'SkyLodge Cadeia 072', '+55 11 90000-0072', 'contato072@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/72');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (73, 'SkyLodge Cadeia 073', '+55 11 90000-0073', 'contato073@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/73');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (74, 'SkyLodge Cadeia 074', '+55 11 90000-0074', 'contato074@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/74');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (75, 'SkyLodge Cadeia 075', '+55 11 90000-0075', 'contato075@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/75');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (76, 'SkyLodge Cadeia 076', '+55 11 90000-0076', 'contato076@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/76');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (77, 'SkyLodge Cadeia 077', '+55 11 90000-0077', 'contato077@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/77');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (78, 'SkyLodge Cadeia 078', '+55 11 90000-0078', 'contato078@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/78');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (79, 'SkyLodge Cadeia 079', '+55 11 90000-0079', 'contato079@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/79');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (80, 'SkyLodge Cadeia 080', '+55 11 90000-0080', 'contato080@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/80');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (81, 'SkyLodge Cadeia 081', '+55 11 90000-0081', 'contato081@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/81');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (82, 'SkyLodge Cadeia 082', '+55 11 90000-0082', 'contato082@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/82');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (83, 'SkyLodge Cadeia 083', '+55 11 90000-0083', 'contato083@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/83');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (84, 'SkyLodge Cadeia 084', '+55 11 90000-0084', 'contato084@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/84');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (85, 'SkyLodge Cadeia 085', '+55 11 90000-0085', 'contato085@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/85');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (86, 'SkyLodge Cadeia 086', '+55 11 90000-0086', 'contato086@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/86');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (87, 'SkyLodge Cadeia 087', '+55 11 90000-0087', 'contato087@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/87');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (88, 'SkyLodge Cadeia 088', '+55 11 90000-0088', 'contato088@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/88');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (89, 'SkyLodge Cadeia 089', '+55 11 90000-0089', 'contato089@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/89');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (90, 'SkyLodge Cadeia 090', '+55 11 90000-0090', 'contato090@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/90');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (91, 'SkyLodge Cadeia 091', '+55 11 90000-0091', 'contato091@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/91');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (92, 'SkyLodge Cadeia 092', '+55 11 90000-0092', 'contato092@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/92');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (93, 'SkyLodge Cadeia 093', '+55 11 90000-0093', 'contato093@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/93');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (94, 'SkyLodge Cadeia 094', '+55 11 90000-0094', 'contato094@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/94');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (95, 'SkyLodge Cadeia 095', '+55 11 90000-0095', 'contato095@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/95');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (96, 'SkyLodge Cadeia 096', '+55 11 90000-0096', 'contato096@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/96');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (97, 'SkyLodge Cadeia 097', '+55 11 90000-0097', 'contato097@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/97');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (98, 'SkyLodge Cadeia 098', '+55 11 90000-0098', 'contato098@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/98');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (99, 'SkyLodge Cadeia 099', '+55 11 90000-0099', 'contato099@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/99');
INSERT INTO cadeia_hoteleira (id_cadeia, nome, telefone, email, website) VALUES (100, 'SkyLodge Cadeia 100', '+55 11 90000-0100', 'contato100@skylodge.com.br', 'https://www.skylodge.com.br/cadeia/100');
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (1, 1, 'SkyLodge Hotel 001', 'Hotel', 'Rua das Nuvens, 101, São Paulo - SP', '+55 11 91000-0001', 'hotel001@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (2, 2, 'SkyLodge Pousada 002', 'Pousada', 'Rua das Nuvens, 102, São Paulo - SP', '+55 11 91000-0002', 'hotel002@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (3, 3, 'SkyLodge Hotel 003', 'Hotel', 'Rua das Nuvens, 103, São Paulo - SP', '+55 11 91000-0003', 'hotel003@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (4, 4, 'SkyLodge Pousada 004', 'Pousada', 'Rua das Nuvens, 104, São Paulo - SP', '+55 11 91000-0004', 'hotel004@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (5, 5, 'SkyLodge Hotel 005', 'Hotel', 'Rua das Nuvens, 105, São Paulo - SP', '+55 11 91000-0005', 'hotel005@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (6, 6, 'SkyLodge Pousada 006', 'Pousada', 'Rua das Nuvens, 106, São Paulo - SP', '+55 11 91000-0006', 'hotel006@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (7, 7, 'SkyLodge Hotel 007', 'Hotel', 'Rua das Nuvens, 107, São Paulo - SP', '+55 11 91000-0007', 'hotel007@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (8, 8, 'SkyLodge Pousada 008', 'Pousada', 'Rua das Nuvens, 108, São Paulo - SP', '+55 11 91000-0008', 'hotel008@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (9, 9, 'SkyLodge Hotel 009', 'Hotel', 'Rua das Nuvens, 109, São Paulo - SP', '+55 11 91000-0009', 'hotel009@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (10, 10, 'SkyLodge Pousada 010', 'Pousada', 'Rua das Nuvens, 110, São Paulo - SP', '+55 11 91000-0010', 'hotel010@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (11, 11, 'SkyLodge Hotel 011', 'Hotel', 'Rua das Nuvens, 111, São Paulo - SP', '+55 11 91000-0011', 'hotel011@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (12, 12, 'SkyLodge Pousada 012', 'Pousada', 'Rua das Nuvens, 112, São Paulo - SP', '+55 11 91000-0012', 'hotel012@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (13, 13, 'SkyLodge Hotel 013', 'Hotel', 'Rua das Nuvens, 113, São Paulo - SP', '+55 11 91000-0013', 'hotel013@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (14, 14, 'SkyLodge Pousada 014', 'Pousada', 'Rua das Nuvens, 114, São Paulo - SP', '+55 11 91000-0014', 'hotel014@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (15, 15, 'SkyLodge Hotel 015', 'Hotel', 'Rua das Nuvens, 115, São Paulo - SP', '+55 11 91000-0015', 'hotel015@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (16, 16, 'SkyLodge Pousada 016', 'Pousada', 'Rua das Nuvens, 116, São Paulo - SP', '+55 11 91000-0016', 'hotel016@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (17, 17, 'SkyLodge Hotel 017', 'Hotel', 'Rua das Nuvens, 117, São Paulo - SP', '+55 11 91000-0017', 'hotel017@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (18, 18, 'SkyLodge Pousada 018', 'Pousada', 'Rua das Nuvens, 118, São Paulo - SP', '+55 11 91000-0018', 'hotel018@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (19, 19, 'SkyLodge Hotel 019', 'Hotel', 'Rua das Nuvens, 119, São Paulo - SP', '+55 11 91000-0019', 'hotel019@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (20, 20, 'SkyLodge Pousada 020', 'Pousada', 'Rua das Nuvens, 120, São Paulo - SP', '+55 11 91000-0020', 'hotel020@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (21, 21, 'SkyLodge Hotel 021', 'Hotel', 'Rua das Nuvens, 121, São Paulo - SP', '+55 11 91000-0021', 'hotel021@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (22, 22, 'SkyLodge Pousada 022', 'Pousada', 'Rua das Nuvens, 122, São Paulo - SP', '+55 11 91000-0022', 'hotel022@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (23, 23, 'SkyLodge Hotel 023', 'Hotel', 'Rua das Nuvens, 123, São Paulo - SP', '+55 11 91000-0023', 'hotel023@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (24, 24, 'SkyLodge Pousada 024', 'Pousada', 'Rua das Nuvens, 124, São Paulo - SP', '+55 11 91000-0024', 'hotel024@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (25, 25, 'SkyLodge Hotel 025', 'Hotel', 'Rua das Nuvens, 125, São Paulo - SP', '+55 11 91000-0025', 'hotel025@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (26, 26, 'SkyLodge Pousada 026', 'Pousada', 'Rua das Nuvens, 126, São Paulo - SP', '+55 11 91000-0026', 'hotel026@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (27, 27, 'SkyLodge Hotel 027', 'Hotel', 'Rua das Nuvens, 127, São Paulo - SP', '+55 11 91000-0027', 'hotel027@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (28, 28, 'SkyLodge Pousada 028', 'Pousada', 'Rua das Nuvens, 128, São Paulo - SP', '+55 11 91000-0028', 'hotel028@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (29, 29, 'SkyLodge Hotel 029', 'Hotel', 'Rua das Nuvens, 129, São Paulo - SP', '+55 11 91000-0029', 'hotel029@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (30, 30, 'SkyLodge Pousada 030', 'Pousada', 'Rua das Nuvens, 130, São Paulo - SP', '+55 11 91000-0030', 'hotel030@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (31, 31, 'SkyLodge Hotel 031', 'Hotel', 'Rua das Nuvens, 131, São Paulo - SP', '+55 11 91000-0031', 'hotel031@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (32, 32, 'SkyLodge Pousada 032', 'Pousada', 'Rua das Nuvens, 132, São Paulo - SP', '+55 11 91000-0032', 'hotel032@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (33, 33, 'SkyLodge Hotel 033', 'Hotel', 'Rua das Nuvens, 133, São Paulo - SP', '+55 11 91000-0033', 'hotel033@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (34, 34, 'SkyLodge Pousada 034', 'Pousada', 'Rua das Nuvens, 134, São Paulo - SP', '+55 11 91000-0034', 'hotel034@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (35, 35, 'SkyLodge Hotel 035', 'Hotel', 'Rua das Nuvens, 135, São Paulo - SP', '+55 11 91000-0035', 'hotel035@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (36, 36, 'SkyLodge Pousada 036', 'Pousada', 'Rua das Nuvens, 136, São Paulo - SP', '+55 11 91000-0036', 'hotel036@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (37, 37, 'SkyLodge Hotel 037', 'Hotel', 'Rua das Nuvens, 137, São Paulo - SP', '+55 11 91000-0037', 'hotel037@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (38, 38, 'SkyLodge Pousada 038', 'Pousada', 'Rua das Nuvens, 138, São Paulo - SP', '+55 11 91000-0038', 'hotel038@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (39, 39, 'SkyLodge Hotel 039', 'Hotel', 'Rua das Nuvens, 139, São Paulo - SP', '+55 11 91000-0039', 'hotel039@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (40, 40, 'SkyLodge Pousada 040', 'Pousada', 'Rua das Nuvens, 140, São Paulo - SP', '+55 11 91000-0040', 'hotel040@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (41, 41, 'SkyLodge Hotel 041', 'Hotel', 'Rua das Nuvens, 141, São Paulo - SP', '+55 11 91000-0041', 'hotel041@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (42, 42, 'SkyLodge Pousada 042', 'Pousada', 'Rua das Nuvens, 142, São Paulo - SP', '+55 11 91000-0042', 'hotel042@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (43, 43, 'SkyLodge Hotel 043', 'Hotel', 'Rua das Nuvens, 143, São Paulo - SP', '+55 11 91000-0043', 'hotel043@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (44, 44, 'SkyLodge Pousada 044', 'Pousada', 'Rua das Nuvens, 144, São Paulo - SP', '+55 11 91000-0044', 'hotel044@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (45, 45, 'SkyLodge Hotel 045', 'Hotel', 'Rua das Nuvens, 145, São Paulo - SP', '+55 11 91000-0045', 'hotel045@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (46, 46, 'SkyLodge Pousada 046', 'Pousada', 'Rua das Nuvens, 146, São Paulo - SP', '+55 11 91000-0046', 'hotel046@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (47, 47, 'SkyLodge Hotel 047', 'Hotel', 'Rua das Nuvens, 147, São Paulo - SP', '+55 11 91000-0047', 'hotel047@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (48, 48, 'SkyLodge Pousada 048', 'Pousada', 'Rua das Nuvens, 148, São Paulo - SP', '+55 11 91000-0048', 'hotel048@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (49, 49, 'SkyLodge Hotel 049', 'Hotel', 'Rua das Nuvens, 149, São Paulo - SP', '+55 11 91000-0049', 'hotel049@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (50, 50, 'SkyLodge Pousada 050', 'Pousada', 'Rua das Nuvens, 150, São Paulo - SP', '+55 11 91000-0050', 'hotel050@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (51, 51, 'SkyLodge Hotel 051', 'Hotel', 'Rua das Nuvens, 151, São Paulo - SP', '+55 11 91000-0051', 'hotel051@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (52, 52, 'SkyLodge Pousada 052', 'Pousada', 'Rua das Nuvens, 152, São Paulo - SP', '+55 11 91000-0052', 'hotel052@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (53, 53, 'SkyLodge Hotel 053', 'Hotel', 'Rua das Nuvens, 153, São Paulo - SP', '+55 11 91000-0053', 'hotel053@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (54, 54, 'SkyLodge Pousada 054', 'Pousada', 'Rua das Nuvens, 154, São Paulo - SP', '+55 11 91000-0054', 'hotel054@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (55, 55, 'SkyLodge Hotel 055', 'Hotel', 'Rua das Nuvens, 155, São Paulo - SP', '+55 11 91000-0055', 'hotel055@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (56, 56, 'SkyLodge Pousada 056', 'Pousada', 'Rua das Nuvens, 156, São Paulo - SP', '+55 11 91000-0056', 'hotel056@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (57, 57, 'SkyLodge Hotel 057', 'Hotel', 'Rua das Nuvens, 157, São Paulo - SP', '+55 11 91000-0057', 'hotel057@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (58, 58, 'SkyLodge Pousada 058', 'Pousada', 'Rua das Nuvens, 158, São Paulo - SP', '+55 11 91000-0058', 'hotel058@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (59, 59, 'SkyLodge Hotel 059', 'Hotel', 'Rua das Nuvens, 159, São Paulo - SP', '+55 11 91000-0059', 'hotel059@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (60, 60, 'SkyLodge Pousada 060', 'Pousada', 'Rua das Nuvens, 160, São Paulo - SP', '+55 11 91000-0060', 'hotel060@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (61, 61, 'SkyLodge Hotel 061', 'Hotel', 'Rua das Nuvens, 161, São Paulo - SP', '+55 11 91000-0061', 'hotel061@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (62, 62, 'SkyLodge Pousada 062', 'Pousada', 'Rua das Nuvens, 162, São Paulo - SP', '+55 11 91000-0062', 'hotel062@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (63, 63, 'SkyLodge Hotel 063', 'Hotel', 'Rua das Nuvens, 163, São Paulo - SP', '+55 11 91000-0063', 'hotel063@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (64, 64, 'SkyLodge Pousada 064', 'Pousada', 'Rua das Nuvens, 164, São Paulo - SP', '+55 11 91000-0064', 'hotel064@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (65, 65, 'SkyLodge Hotel 065', 'Hotel', 'Rua das Nuvens, 165, São Paulo - SP', '+55 11 91000-0065', 'hotel065@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (66, 66, 'SkyLodge Pousada 066', 'Pousada', 'Rua das Nuvens, 166, São Paulo - SP', '+55 11 91000-0066', 'hotel066@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (67, 67, 'SkyLodge Hotel 067', 'Hotel', 'Rua das Nuvens, 167, São Paulo - SP', '+55 11 91000-0067', 'hotel067@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (68, 68, 'SkyLodge Pousada 068', 'Pousada', 'Rua das Nuvens, 168, São Paulo - SP', '+55 11 91000-0068', 'hotel068@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (69, 69, 'SkyLodge Hotel 069', 'Hotel', 'Rua das Nuvens, 169, São Paulo - SP', '+55 11 91000-0069', 'hotel069@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (70, 70, 'SkyLodge Pousada 070', 'Pousada', 'Rua das Nuvens, 170, São Paulo - SP', '+55 11 91000-0070', 'hotel070@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (71, 71, 'SkyLodge Hotel 071', 'Hotel', 'Rua das Nuvens, 171, São Paulo - SP', '+55 11 91000-0071', 'hotel071@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (72, 72, 'SkyLodge Pousada 072', 'Pousada', 'Rua das Nuvens, 172, São Paulo - SP', '+55 11 91000-0072', 'hotel072@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (73, 73, 'SkyLodge Hotel 073', 'Hotel', 'Rua das Nuvens, 173, São Paulo - SP', '+55 11 91000-0073', 'hotel073@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (74, 74, 'SkyLodge Pousada 074', 'Pousada', 'Rua das Nuvens, 174, São Paulo - SP', '+55 11 91000-0074', 'hotel074@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (75, 75, 'SkyLodge Hotel 075', 'Hotel', 'Rua das Nuvens, 175, São Paulo - SP', '+55 11 91000-0075', 'hotel075@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (76, 76, 'SkyLodge Pousada 076', 'Pousada', 'Rua das Nuvens, 176, São Paulo - SP', '+55 11 91000-0076', 'hotel076@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (77, 77, 'SkyLodge Hotel 077', 'Hotel', 'Rua das Nuvens, 177, São Paulo - SP', '+55 11 91000-0077', 'hotel077@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (78, 78, 'SkyLodge Pousada 078', 'Pousada', 'Rua das Nuvens, 178, São Paulo - SP', '+55 11 91000-0078', 'hotel078@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (79, 79, 'SkyLodge Hotel 079', 'Hotel', 'Rua das Nuvens, 179, São Paulo - SP', '+55 11 91000-0079', 'hotel079@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (80, 80, 'SkyLodge Pousada 080', 'Pousada', 'Rua das Nuvens, 180, São Paulo - SP', '+55 11 91000-0080', 'hotel080@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (81, 81, 'SkyLodge Hotel 081', 'Hotel', 'Rua das Nuvens, 181, São Paulo - SP', '+55 11 91000-0081', 'hotel081@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (82, 82, 'SkyLodge Pousada 082', 'Pousada', 'Rua das Nuvens, 182, São Paulo - SP', '+55 11 91000-0082', 'hotel082@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (83, 83, 'SkyLodge Hotel 083', 'Hotel', 'Rua das Nuvens, 183, São Paulo - SP', '+55 11 91000-0083', 'hotel083@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (84, 84, 'SkyLodge Pousada 084', 'Pousada', 'Rua das Nuvens, 184, São Paulo - SP', '+55 11 91000-0084', 'hotel084@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (85, 85, 'SkyLodge Hotel 085', 'Hotel', 'Rua das Nuvens, 185, São Paulo - SP', '+55 11 91000-0085', 'hotel085@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (86, 86, 'SkyLodge Pousada 086', 'Pousada', 'Rua das Nuvens, 186, São Paulo - SP', '+55 11 91000-0086', 'hotel086@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (87, 87, 'SkyLodge Hotel 087', 'Hotel', 'Rua das Nuvens, 187, São Paulo - SP', '+55 11 91000-0087', 'hotel087@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (88, 88, 'SkyLodge Pousada 088', 'Pousada', 'Rua das Nuvens, 188, São Paulo - SP', '+55 11 91000-0088', 'hotel088@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (89, 89, 'SkyLodge Hotel 089', 'Hotel', 'Rua das Nuvens, 189, São Paulo - SP', '+55 11 91000-0089', 'hotel089@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (90, 90, 'SkyLodge Pousada 090', 'Pousada', 'Rua das Nuvens, 190, São Paulo - SP', '+55 11 91000-0090', 'hotel090@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (91, 91, 'SkyLodge Hotel 091', 'Hotel', 'Rua das Nuvens, 191, São Paulo - SP', '+55 11 91000-0091', 'hotel091@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (92, 92, 'SkyLodge Pousada 092', 'Pousada', 'Rua das Nuvens, 192, São Paulo - SP', '+55 11 91000-0092', 'hotel092@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (93, 93, 'SkyLodge Hotel 093', 'Hotel', 'Rua das Nuvens, 193, São Paulo - SP', '+55 11 91000-0093', 'hotel093@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (94, 94, 'SkyLodge Pousada 094', 'Pousada', 'Rua das Nuvens, 194, São Paulo - SP', '+55 11 91000-0094', 'hotel094@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (95, 95, 'SkyLodge Hotel 095', 'Hotel', 'Rua das Nuvens, 195, São Paulo - SP', '+55 11 91000-0095', 'hotel095@skylodge.com.br', 1);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (96, 96, 'SkyLodge Pousada 096', 'Pousada', 'Rua das Nuvens, 196, São Paulo - SP', '+55 11 91000-0096', 'hotel096@skylodge.com.br', 2);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (97, 97, 'SkyLodge Hotel 097', 'Hotel', 'Rua das Nuvens, 197, São Paulo - SP', '+55 11 91000-0097', 'hotel097@skylodge.com.br', 3);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (98, 98, 'SkyLodge Pousada 098', 'Pousada', 'Rua das Nuvens, 198, São Paulo - SP', '+55 11 91000-0098', 'hotel098@skylodge.com.br', 4);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (99, 99, 'SkyLodge Hotel 099', 'Hotel', 'Rua das Nuvens, 199, São Paulo - SP', '+55 11 91000-0099', 'hotel099@skylodge.com.br', 5);
INSERT INTO hotel_pousada (id_estabelecimento, id_cadeia, nome, tipo, endereco, telefone, email, classificacao) VALUES (100, 100, 'SkyLodge Pousada 100', 'Pousada', 'Rua das Nuvens, 200, São Paulo - SP', '+55 11 91000-0100', 'hotel100@skylodge.com.br', 1);
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (1, 1, 'Standard 001', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (2, 2, 'Superior 002', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (3, 3, 'Luxo 003', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (4, 4, 'Família 004', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (5, 5, 'Standard 005', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (6, 6, 'Superior 006', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (7, 7, 'Luxo 007', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (8, 8, 'Família 008', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (9, 9, 'Standard 009', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (10, 10, 'Superior 010', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (11, 11, 'Luxo 011', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (12, 12, 'Família 012', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (13, 13, 'Standard 013', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (14, 14, 'Superior 014', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (15, 15, 'Luxo 015', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (16, 16, 'Família 016', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (17, 17, 'Standard 017', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (18, 18, 'Superior 018', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (19, 19, 'Luxo 019', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (20, 20, 'Família 020', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (21, 21, 'Standard 021', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (22, 22, 'Superior 022', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (23, 23, 'Luxo 023', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (24, 24, 'Família 024', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (25, 25, 'Standard 025', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (26, 26, 'Superior 026', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (27, 27, 'Luxo 027', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (28, 28, 'Família 028', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (29, 29, 'Standard 029', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (30, 30, 'Superior 030', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (31, 31, 'Luxo 031', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (32, 32, 'Família 032', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (33, 33, 'Standard 033', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (34, 34, 'Superior 034', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (35, 35, 'Luxo 035', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (36, 36, 'Família 036', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (37, 37, 'Standard 037', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (38, 38, 'Superior 038', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (39, 39, 'Luxo 039', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (40, 40, 'Família 040', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (41, 41, 'Standard 041', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (42, 42, 'Superior 042', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (43, 43, 'Luxo 043', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (44, 44, 'Família 044', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (45, 45, 'Standard 045', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (46, 46, 'Superior 046', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (47, 47, 'Luxo 047', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (48, 48, 'Família 048', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (49, 49, 'Standard 049', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (50, 50, 'Superior 050', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (51, 51, 'Luxo 051', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (52, 52, 'Família 052', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (53, 53, 'Standard 053', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (54, 54, 'Superior 054', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (55, 55, 'Luxo 055', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (56, 56, 'Família 056', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (57, 57, 'Standard 057', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (58, 58, 'Superior 058', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (59, 59, 'Luxo 059', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (60, 60, 'Família 060', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (61, 61, 'Standard 061', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (62, 62, 'Superior 062', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (63, 63, 'Luxo 063', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (64, 64, 'Família 064', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (65, 65, 'Standard 065', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (66, 66, 'Superior 066', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (67, 67, 'Luxo 067', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (68, 68, 'Família 068', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (69, 69, 'Standard 069', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (70, 70, 'Superior 070', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (71, 71, 'Luxo 071', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (72, 72, 'Família 072', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (73, 73, 'Standard 073', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (74, 74, 'Superior 074', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (75, 75, 'Luxo 075', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (76, 76, 'Família 076', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (77, 77, 'Standard 077', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (78, 78, 'Superior 078', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (79, 79, 'Luxo 079', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (80, 80, 'Família 080', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (81, 81, 'Standard 081', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (82, 82, 'Superior 082', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (83, 83, 'Luxo 083', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (84, 84, 'Família 084', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (85, 85, 'Standard 085', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (86, 86, 'Superior 086', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (87, 87, 'Luxo 087', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (88, 88, 'Família 088', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (89, 89, 'Standard 089', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (90, 90, 'Superior 090', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (91, 91, 'Luxo 091', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (92, 92, 'Família 092', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (93, 93, 'Standard 093', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (94, 94, 'Superior 094', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (95, 95, 'Luxo 095', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (96, 96, 'Família 096', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (97, 97, 'Standard 097', 'Acomodação padrão com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (98, 98, 'Superior 098', 'Acomodação superior com conforto e praticidade', 2, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (99, 99, 'Luxo 099', 'Acomodação de luxo com conforto e praticidade', 3, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO categoria_alojamento (id_categoria, id_estabelecimento, nome, descricao, capacidade_pessoas, amenidades_inclusas) VALUES (100, 100, 'Família 100', 'Acomodação familiar com conforto e praticidade', 4, 'Wi-Fi, TV, ar-condicionado, roupa de cama e toalhas');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (1, 1, 1, '101', '1', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (2, 2, 2, '102', '1', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (3, 3, 3, '103', '1', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (4, 4, 4, '104', '1', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (5, 5, 5, '105', '1', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (6, 6, 6, '106', '1', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (7, 7, 7, '107', '1', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (8, 8, 8, '108', '1', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (9, 9, 9, '109', '1', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (10, 10, 10, '110', '1', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (11, 11, 11, '111', '1', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (12, 12, 12, '112', '1', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (13, 13, 13, '113', '1', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (14, 14, 14, '114', '1', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (15, 15, 15, '115', '1', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (16, 16, 16, '116', '1', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (17, 17, 17, '117', '1', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (18, 18, 18, '118', '1', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (19, 19, 19, '119', '1', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (20, 20, 20, '120', '1', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (21, 21, 21, '121', '2', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (22, 22, 22, '122', '2', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (23, 23, 23, '123', '2', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (24, 24, 24, '124', '2', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (25, 25, 25, '125', '2', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (26, 26, 26, '126', '2', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (27, 27, 27, '127', '2', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (28, 28, 28, '128', '2', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (29, 29, 29, '129', '2', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (30, 30, 30, '130', '2', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (31, 31, 31, '131', '2', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (32, 32, 32, '132', '2', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (33, 33, 33, '133', '2', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (34, 34, 34, '134', '2', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (35, 35, 35, '135', '2', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (36, 36, 36, '136', '2', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (37, 37, 37, '137', '2', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (38, 38, 38, '138', '2', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (39, 39, 39, '139', '2', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (40, 40, 40, '140', '2', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (41, 41, 41, '141', '3', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (42, 42, 42, '142', '3', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (43, 43, 43, '143', '3', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (44, 44, 44, '144', '3', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (45, 45, 45, '145', '3', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (46, 46, 46, '146', '3', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (47, 47, 47, '147', '3', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (48, 48, 48, '148', '3', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (49, 49, 49, '149', '3', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (50, 50, 50, '150', '3', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (51, 51, 51, '151', '3', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (52, 52, 52, '152', '3', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (53, 53, 53, '153', '3', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (54, 54, 54, '154', '3', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (55, 55, 55, '155', '3', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (56, 56, 56, '156', '3', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (57, 57, 57, '157', '3', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (58, 58, 58, '158', '3', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (59, 59, 59, '159', '3', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (60, 60, 60, '160', '3', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (61, 61, 61, '161', '4', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (62, 62, 62, '162', '4', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (63, 63, 63, '163', '4', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (64, 64, 64, '164', '4', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (65, 65, 65, '165', '4', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (66, 66, 66, '166', '4', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (67, 67, 67, '167', '4', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (68, 68, 68, '168', '4', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (69, 69, 69, '169', '4', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (70, 70, 70, '170', '4', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (71, 71, 71, '171', '4', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (72, 72, 72, '172', '4', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (73, 73, 73, '173', '4', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (74, 74, 74, '174', '4', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (75, 75, 75, '175', '4', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (76, 76, 76, '176', '4', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (77, 77, 77, '177', '4', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (78, 78, 78, '178', '4', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (79, 79, 79, '179', '4', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (80, 80, 80, '180', '4', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (81, 81, 81, '181', '5', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (82, 82, 82, '182', '5', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (83, 83, 83, '183', '5', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (84, 84, 84, '184', '5', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (85, 85, 85, '185', '5', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (86, 86, 86, '186', '5', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (87, 87, 87, '187', '5', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (88, 88, 88, '188', '5', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (89, 89, 89, '189', '5', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (90, 90, 90, '190', '5', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (91, 91, 91, '191', '5', 'Disponível', 'Bloco 1, corredor 1');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (92, 92, 92, '192', '5', 'Disponível', 'Bloco 2, corredor 2');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (93, 93, 93, '193', '5', 'Manutenção', 'Bloco 3, corredor 3');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (94, 94, 94, '194', '5', 'Indisponível', 'Bloco 4, corredor 4');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (95, 95, 95, '195', '5', 'Disponível', 'Bloco 5, corredor 5');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (96, 96, 96, '196', '5', 'Disponível', 'Bloco 1, corredor 6');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (97, 97, 97, '197', '5', 'Disponível', 'Bloco 2, corredor 7');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (98, 98, 98, '198', '5', 'Manutenção', 'Bloco 3, corredor 8');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (99, 99, 99, '199', '5', 'Indisponível', 'Bloco 4, corredor 9');
INSERT INTO quarto (id_quarto, id_estabelecimento, id_categoria, numero, andar, status, localizacao) VALUES (100, 100, 100, '200', '5', 'Disponível', 'Bloco 5, corredor 10');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (1, 1, 'Funcionário SkyLodge 001', 'Recepcionista', '+55 11 92000-0001', 'funcionario001@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (2, 2, 'Funcionário SkyLodge 002', 'Gerente', '+55 11 92000-0002', 'funcionario002@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (3, 3, 'Funcionário SkyLodge 003', 'Camareiro', '+55 11 92000-0003', 'funcionario003@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (4, 4, 'Funcionário SkyLodge 004', 'Supervisor', '+55 11 92000-0004', 'funcionario004@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (5, 5, 'Funcionário SkyLodge 005', 'Atendente', '+55 11 92000-0005', 'funcionario005@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (6, 6, 'Funcionário SkyLodge 006', 'Recepcionista', '+55 11 92000-0006', 'funcionario006@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (7, 7, 'Funcionário SkyLodge 007', 'Gerente', '+55 11 92000-0007', 'funcionario007@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (8, 8, 'Funcionário SkyLodge 008', 'Camareiro', '+55 11 92000-0008', 'funcionario008@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (9, 9, 'Funcionário SkyLodge 009', 'Supervisor', '+55 11 92000-0009', 'funcionario009@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (10, 10, 'Funcionário SkyLodge 010', 'Atendente', '+55 11 92000-0010', 'funcionario010@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (11, 11, 'Funcionário SkyLodge 011', 'Recepcionista', '+55 11 92000-0011', 'funcionario011@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (12, 12, 'Funcionário SkyLodge 012', 'Gerente', '+55 11 92000-0012', 'funcionario012@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (13, 13, 'Funcionário SkyLodge 013', 'Camareiro', '+55 11 92000-0013', 'funcionario013@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (14, 14, 'Funcionário SkyLodge 014', 'Supervisor', '+55 11 92000-0014', 'funcionario014@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (15, 15, 'Funcionário SkyLodge 015', 'Atendente', '+55 11 92000-0015', 'funcionario015@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (16, 16, 'Funcionário SkyLodge 016', 'Recepcionista', '+55 11 92000-0016', 'funcionario016@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (17, 17, 'Funcionário SkyLodge 017', 'Gerente', '+55 11 92000-0017', 'funcionario017@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (18, 18, 'Funcionário SkyLodge 018', 'Camareiro', '+55 11 92000-0018', 'funcionario018@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (19, 19, 'Funcionário SkyLodge 019', 'Supervisor', '+55 11 92000-0019', 'funcionario019@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (20, 20, 'Funcionário SkyLodge 020', 'Atendente', '+55 11 92000-0020', 'funcionario020@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (21, 21, 'Funcionário SkyLodge 021', 'Recepcionista', '+55 11 92000-0021', 'funcionario021@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (22, 22, 'Funcionário SkyLodge 022', 'Gerente', '+55 11 92000-0022', 'funcionario022@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (23, 23, 'Funcionário SkyLodge 023', 'Camareiro', '+55 11 92000-0023', 'funcionario023@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (24, 24, 'Funcionário SkyLodge 024', 'Supervisor', '+55 11 92000-0024', 'funcionario024@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (25, 25, 'Funcionário SkyLodge 025', 'Atendente', '+55 11 92000-0025', 'funcionario025@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (26, 26, 'Funcionário SkyLodge 026', 'Recepcionista', '+55 11 92000-0026', 'funcionario026@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (27, 27, 'Funcionário SkyLodge 027', 'Gerente', '+55 11 92000-0027', 'funcionario027@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (28, 28, 'Funcionário SkyLodge 028', 'Camareiro', '+55 11 92000-0028', 'funcionario028@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (29, 29, 'Funcionário SkyLodge 029', 'Supervisor', '+55 11 92000-0029', 'funcionario029@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (30, 30, 'Funcionário SkyLodge 030', 'Atendente', '+55 11 92000-0030', 'funcionario030@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (31, 31, 'Funcionário SkyLodge 031', 'Recepcionista', '+55 11 92000-0031', 'funcionario031@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (32, 32, 'Funcionário SkyLodge 032', 'Gerente', '+55 11 92000-0032', 'funcionario032@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (33, 33, 'Funcionário SkyLodge 033', 'Camareiro', '+55 11 92000-0033', 'funcionario033@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (34, 34, 'Funcionário SkyLodge 034', 'Supervisor', '+55 11 92000-0034', 'funcionario034@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (35, 35, 'Funcionário SkyLodge 035', 'Atendente', '+55 11 92000-0035', 'funcionario035@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (36, 36, 'Funcionário SkyLodge 036', 'Recepcionista', '+55 11 92000-0036', 'funcionario036@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (37, 37, 'Funcionário SkyLodge 037', 'Gerente', '+55 11 92000-0037', 'funcionario037@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (38, 38, 'Funcionário SkyLodge 038', 'Camareiro', '+55 11 92000-0038', 'funcionario038@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (39, 39, 'Funcionário SkyLodge 039', 'Supervisor', '+55 11 92000-0039', 'funcionario039@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (40, 40, 'Funcionário SkyLodge 040', 'Atendente', '+55 11 92000-0040', 'funcionario040@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (41, 41, 'Funcionário SkyLodge 041', 'Recepcionista', '+55 11 92000-0041', 'funcionario041@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (42, 42, 'Funcionário SkyLodge 042', 'Gerente', '+55 11 92000-0042', 'funcionario042@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (43, 43, 'Funcionário SkyLodge 043', 'Camareiro', '+55 11 92000-0043', 'funcionario043@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (44, 44, 'Funcionário SkyLodge 044', 'Supervisor', '+55 11 92000-0044', 'funcionario044@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (45, 45, 'Funcionário SkyLodge 045', 'Atendente', '+55 11 92000-0045', 'funcionario045@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (46, 46, 'Funcionário SkyLodge 046', 'Recepcionista', '+55 11 92000-0046', 'funcionario046@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (47, 47, 'Funcionário SkyLodge 047', 'Gerente', '+55 11 92000-0047', 'funcionario047@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (48, 48, 'Funcionário SkyLodge 048', 'Camareiro', '+55 11 92000-0048', 'funcionario048@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (49, 49, 'Funcionário SkyLodge 049', 'Supervisor', '+55 11 92000-0049', 'funcionario049@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (50, 50, 'Funcionário SkyLodge 050', 'Atendente', '+55 11 92000-0050', 'funcionario050@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (51, 51, 'Funcionário SkyLodge 051', 'Recepcionista', '+55 11 92000-0051', 'funcionario051@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (52, 52, 'Funcionário SkyLodge 052', 'Gerente', '+55 11 92000-0052', 'funcionario052@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (53, 53, 'Funcionário SkyLodge 053', 'Camareiro', '+55 11 92000-0053', 'funcionario053@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (54, 54, 'Funcionário SkyLodge 054', 'Supervisor', '+55 11 92000-0054', 'funcionario054@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (55, 55, 'Funcionário SkyLodge 055', 'Atendente', '+55 11 92000-0055', 'funcionario055@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (56, 56, 'Funcionário SkyLodge 056', 'Recepcionista', '+55 11 92000-0056', 'funcionario056@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (57, 57, 'Funcionário SkyLodge 057', 'Gerente', '+55 11 92000-0057', 'funcionario057@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (58, 58, 'Funcionário SkyLodge 058', 'Camareiro', '+55 11 92000-0058', 'funcionario058@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (59, 59, 'Funcionário SkyLodge 059', 'Supervisor', '+55 11 92000-0059', 'funcionario059@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (60, 60, 'Funcionário SkyLodge 060', 'Atendente', '+55 11 92000-0060', 'funcionario060@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (61, 61, 'Funcionário SkyLodge 061', 'Recepcionista', '+55 11 92000-0061', 'funcionario061@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (62, 62, 'Funcionário SkyLodge 062', 'Gerente', '+55 11 92000-0062', 'funcionario062@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (63, 63, 'Funcionário SkyLodge 063', 'Camareiro', '+55 11 92000-0063', 'funcionario063@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (64, 64, 'Funcionário SkyLodge 064', 'Supervisor', '+55 11 92000-0064', 'funcionario064@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (65, 65, 'Funcionário SkyLodge 065', 'Atendente', '+55 11 92000-0065', 'funcionario065@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (66, 66, 'Funcionário SkyLodge 066', 'Recepcionista', '+55 11 92000-0066', 'funcionario066@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (67, 67, 'Funcionário SkyLodge 067', 'Gerente', '+55 11 92000-0067', 'funcionario067@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (68, 68, 'Funcionário SkyLodge 068', 'Camareiro', '+55 11 92000-0068', 'funcionario068@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (69, 69, 'Funcionário SkyLodge 069', 'Supervisor', '+55 11 92000-0069', 'funcionario069@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (70, 70, 'Funcionário SkyLodge 070', 'Atendente', '+55 11 92000-0070', 'funcionario070@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (71, 71, 'Funcionário SkyLodge 071', 'Recepcionista', '+55 11 92000-0071', 'funcionario071@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (72, 72, 'Funcionário SkyLodge 072', 'Gerente', '+55 11 92000-0072', 'funcionario072@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (73, 73, 'Funcionário SkyLodge 073', 'Camareiro', '+55 11 92000-0073', 'funcionario073@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (74, 74, 'Funcionário SkyLodge 074', 'Supervisor', '+55 11 92000-0074', 'funcionario074@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (75, 75, 'Funcionário SkyLodge 075', 'Atendente', '+55 11 92000-0075', 'funcionario075@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (76, 76, 'Funcionário SkyLodge 076', 'Recepcionista', '+55 11 92000-0076', 'funcionario076@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (77, 77, 'Funcionário SkyLodge 077', 'Gerente', '+55 11 92000-0077', 'funcionario077@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (78, 78, 'Funcionário SkyLodge 078', 'Camareiro', '+55 11 92000-0078', 'funcionario078@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (79, 79, 'Funcionário SkyLodge 079', 'Supervisor', '+55 11 92000-0079', 'funcionario079@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (80, 80, 'Funcionário SkyLodge 080', 'Atendente', '+55 11 92000-0080', 'funcionario080@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (81, 81, 'Funcionário SkyLodge 081', 'Recepcionista', '+55 11 92000-0081', 'funcionario081@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (82, 82, 'Funcionário SkyLodge 082', 'Gerente', '+55 11 92000-0082', 'funcionario082@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (83, 83, 'Funcionário SkyLodge 083', 'Camareiro', '+55 11 92000-0083', 'funcionario083@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (84, 84, 'Funcionário SkyLodge 084', 'Supervisor', '+55 11 92000-0084', 'funcionario084@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (85, 85, 'Funcionário SkyLodge 085', 'Atendente', '+55 11 92000-0085', 'funcionario085@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (86, 86, 'Funcionário SkyLodge 086', 'Recepcionista', '+55 11 92000-0086', 'funcionario086@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (87, 87, 'Funcionário SkyLodge 087', 'Gerente', '+55 11 92000-0087', 'funcionario087@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (88, 88, 'Funcionário SkyLodge 088', 'Camareiro', '+55 11 92000-0088', 'funcionario088@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (89, 89, 'Funcionário SkyLodge 089', 'Supervisor', '+55 11 92000-0089', 'funcionario089@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (90, 90, 'Funcionário SkyLodge 090', 'Atendente', '+55 11 92000-0090', 'funcionario090@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (91, 91, 'Funcionário SkyLodge 091', 'Recepcionista', '+55 11 92000-0091', 'funcionario091@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (92, 92, 'Funcionário SkyLodge 092', 'Gerente', '+55 11 92000-0092', 'funcionario092@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (93, 93, 'Funcionário SkyLodge 093', 'Camareiro', '+55 11 92000-0093', 'funcionario093@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (94, 94, 'Funcionário SkyLodge 094', 'Supervisor', '+55 11 92000-0094', 'funcionario094@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (95, 95, 'Funcionário SkyLodge 095', 'Atendente', '+55 11 92000-0095', 'funcionario095@skylodge.com.br', 'Restaurante');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (96, 96, 'Funcionário SkyLodge 096', 'Recepcionista', '+55 11 92000-0096', 'funcionario096@skylodge.com.br', 'Recepção');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (97, 97, 'Funcionário SkyLodge 097', 'Gerente', '+55 11 92000-0097', 'funcionario097@skylodge.com.br', 'Administração');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (98, 98, 'Funcionário SkyLodge 098', 'Camareiro', '+55 11 92000-0098', 'funcionario098@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (99, 99, 'Funcionário SkyLodge 099', 'Supervisor', '+55 11 92000-0099', 'funcionario099@skylodge.com.br', 'Governança');
INSERT INTO funcionario (id_funcionario, id_estabelecimento, nome, cargo, telefone, email, setor) VALUES (100, 100, 'Funcionário SkyLodge 100', 'Atendente', '+55 11 92000-0100', 'funcionario100@skylodge.com.br', 'Restaurante');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (1, 'Cliente SkyLodge 001', '10000000001', '+55 11 93000-0001', 'cliente001@email.com', 'Avenida do Hóspede, 201, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (2, 'Cliente SkyLodge 002', '10000000002', '+55 11 93000-0002', 'cliente002@email.com', 'Avenida do Hóspede, 202, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (3, 'Cliente SkyLodge 003', '10000000003', '+55 11 93000-0003', 'cliente003@email.com', 'Avenida do Hóspede, 203, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (4, 'Cliente SkyLodge 004', '10000000004', '+55 11 93000-0004', 'cliente004@email.com', 'Avenida do Hóspede, 204, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (5, 'Cliente SkyLodge 005', '10000000005', '+55 11 93000-0005', 'cliente005@email.com', 'Avenida do Hóspede, 205, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (6, 'Cliente SkyLodge 006', '10000000006', '+55 11 93000-0006', 'cliente006@email.com', 'Avenida do Hóspede, 206, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (7, 'Cliente SkyLodge 007', '10000000007', '+55 11 93000-0007', 'cliente007@email.com', 'Avenida do Hóspede, 207, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (8, 'Cliente SkyLodge 008', '10000000008', '+55 11 93000-0008', 'cliente008@email.com', 'Avenida do Hóspede, 208, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (9, 'Cliente SkyLodge 009', '10000000009', '+55 11 93000-0009', 'cliente009@email.com', 'Avenida do Hóspede, 209, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (10, 'Cliente SkyLodge 010', '10000000010', '+55 11 93000-0010', 'cliente010@email.com', 'Avenida do Hóspede, 210, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (11, 'Cliente SkyLodge 011', '10000000011', '+55 11 93000-0011', 'cliente011@email.com', 'Avenida do Hóspede, 211, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (12, 'Cliente SkyLodge 012', '10000000012', '+55 11 93000-0012', 'cliente012@email.com', 'Avenida do Hóspede, 212, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (13, 'Cliente SkyLodge 013', '10000000013', '+55 11 93000-0013', 'cliente013@email.com', 'Avenida do Hóspede, 213, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (14, 'Cliente SkyLodge 014', '10000000014', '+55 11 93000-0014', 'cliente014@email.com', 'Avenida do Hóspede, 214, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (15, 'Cliente SkyLodge 015', '10000000015', '+55 11 93000-0015', 'cliente015@email.com', 'Avenida do Hóspede, 215, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (16, 'Cliente SkyLodge 016', '10000000016', '+55 11 93000-0016', 'cliente016@email.com', 'Avenida do Hóspede, 216, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (17, 'Cliente SkyLodge 017', '10000000017', '+55 11 93000-0017', 'cliente017@email.com', 'Avenida do Hóspede, 217, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (18, 'Cliente SkyLodge 018', '10000000018', '+55 11 93000-0018', 'cliente018@email.com', 'Avenida do Hóspede, 218, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (19, 'Cliente SkyLodge 019', '10000000019', '+55 11 93000-0019', 'cliente019@email.com', 'Avenida do Hóspede, 219, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (20, 'Cliente SkyLodge 020', '10000000020', '+55 11 93000-0020', 'cliente020@email.com', 'Avenida do Hóspede, 220, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (21, 'Cliente SkyLodge 021', '10000000021', '+55 11 93000-0021', 'cliente021@email.com', 'Avenida do Hóspede, 221, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (22, 'Cliente SkyLodge 022', '10000000022', '+55 11 93000-0022', 'cliente022@email.com', 'Avenida do Hóspede, 222, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (23, 'Cliente SkyLodge 023', '10000000023', '+55 11 93000-0023', 'cliente023@email.com', 'Avenida do Hóspede, 223, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (24, 'Cliente SkyLodge 024', '10000000024', '+55 11 93000-0024', 'cliente024@email.com', 'Avenida do Hóspede, 224, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (25, 'Cliente SkyLodge 025', '10000000025', '+55 11 93000-0025', 'cliente025@email.com', 'Avenida do Hóspede, 225, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (26, 'Cliente SkyLodge 026', '10000000026', '+55 11 93000-0026', 'cliente026@email.com', 'Avenida do Hóspede, 226, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (27, 'Cliente SkyLodge 027', '10000000027', '+55 11 93000-0027', 'cliente027@email.com', 'Avenida do Hóspede, 227, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (28, 'Cliente SkyLodge 028', '10000000028', '+55 11 93000-0028', 'cliente028@email.com', 'Avenida do Hóspede, 228, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (29, 'Cliente SkyLodge 029', '10000000029', '+55 11 93000-0029', 'cliente029@email.com', 'Avenida do Hóspede, 229, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (30, 'Cliente SkyLodge 030', '10000000030', '+55 11 93000-0030', 'cliente030@email.com', 'Avenida do Hóspede, 230, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (31, 'Cliente SkyLodge 031', '10000000031', '+55 11 93000-0031', 'cliente031@email.com', 'Avenida do Hóspede, 231, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (32, 'Cliente SkyLodge 032', '10000000032', '+55 11 93000-0032', 'cliente032@email.com', 'Avenida do Hóspede, 232, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (33, 'Cliente SkyLodge 033', '10000000033', '+55 11 93000-0033', 'cliente033@email.com', 'Avenida do Hóspede, 233, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (34, 'Cliente SkyLodge 034', '10000000034', '+55 11 93000-0034', 'cliente034@email.com', 'Avenida do Hóspede, 234, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (35, 'Cliente SkyLodge 035', '10000000035', '+55 11 93000-0035', 'cliente035@email.com', 'Avenida do Hóspede, 235, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (36, 'Cliente SkyLodge 036', '10000000036', '+55 11 93000-0036', 'cliente036@email.com', 'Avenida do Hóspede, 236, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (37, 'Cliente SkyLodge 037', '10000000037', '+55 11 93000-0037', 'cliente037@email.com', 'Avenida do Hóspede, 237, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (38, 'Cliente SkyLodge 038', '10000000038', '+55 11 93000-0038', 'cliente038@email.com', 'Avenida do Hóspede, 238, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (39, 'Cliente SkyLodge 039', '10000000039', '+55 11 93000-0039', 'cliente039@email.com', 'Avenida do Hóspede, 239, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (40, 'Cliente SkyLodge 040', '10000000040', '+55 11 93000-0040', 'cliente040@email.com', 'Avenida do Hóspede, 240, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (41, 'Cliente SkyLodge 041', '10000000041', '+55 11 93000-0041', 'cliente041@email.com', 'Avenida do Hóspede, 241, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (42, 'Cliente SkyLodge 042', '10000000042', '+55 11 93000-0042', 'cliente042@email.com', 'Avenida do Hóspede, 242, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (43, 'Cliente SkyLodge 043', '10000000043', '+55 11 93000-0043', 'cliente043@email.com', 'Avenida do Hóspede, 243, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (44, 'Cliente SkyLodge 044', '10000000044', '+55 11 93000-0044', 'cliente044@email.com', 'Avenida do Hóspede, 244, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (45, 'Cliente SkyLodge 045', '10000000045', '+55 11 93000-0045', 'cliente045@email.com', 'Avenida do Hóspede, 245, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (46, 'Cliente SkyLodge 046', '10000000046', '+55 11 93000-0046', 'cliente046@email.com', 'Avenida do Hóspede, 246, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (47, 'Cliente SkyLodge 047', '10000000047', '+55 11 93000-0047', 'cliente047@email.com', 'Avenida do Hóspede, 247, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (48, 'Cliente SkyLodge 048', '10000000048', '+55 11 93000-0048', 'cliente048@email.com', 'Avenida do Hóspede, 248, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (49, 'Cliente SkyLodge 049', '10000000049', '+55 11 93000-0049', 'cliente049@email.com', 'Avenida do Hóspede, 249, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (50, 'Cliente SkyLodge 050', '10000000050', '+55 11 93000-0050', 'cliente050@email.com', 'Avenida do Hóspede, 250, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (51, 'Cliente SkyLodge 051', '10000000051', '+55 11 93000-0051', 'cliente051@email.com', 'Avenida do Hóspede, 251, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (52, 'Cliente SkyLodge 052', '10000000052', '+55 11 93000-0052', 'cliente052@email.com', 'Avenida do Hóspede, 252, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (53, 'Cliente SkyLodge 053', '10000000053', '+55 11 93000-0053', 'cliente053@email.com', 'Avenida do Hóspede, 253, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (54, 'Cliente SkyLodge 054', '10000000054', '+55 11 93000-0054', 'cliente054@email.com', 'Avenida do Hóspede, 254, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (55, 'Cliente SkyLodge 055', '10000000055', '+55 11 93000-0055', 'cliente055@email.com', 'Avenida do Hóspede, 255, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (56, 'Cliente SkyLodge 056', '10000000056', '+55 11 93000-0056', 'cliente056@email.com', 'Avenida do Hóspede, 256, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (57, 'Cliente SkyLodge 057', '10000000057', '+55 11 93000-0057', 'cliente057@email.com', 'Avenida do Hóspede, 257, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (58, 'Cliente SkyLodge 058', '10000000058', '+55 11 93000-0058', 'cliente058@email.com', 'Avenida do Hóspede, 258, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (59, 'Cliente SkyLodge 059', '10000000059', '+55 11 93000-0059', 'cliente059@email.com', 'Avenida do Hóspede, 259, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (60, 'Cliente SkyLodge 060', '10000000060', '+55 11 93000-0060', 'cliente060@email.com', 'Avenida do Hóspede, 260, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (61, 'Cliente SkyLodge 061', '10000000061', '+55 11 93000-0061', 'cliente061@email.com', 'Avenida do Hóspede, 261, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (62, 'Cliente SkyLodge 062', '10000000062', '+55 11 93000-0062', 'cliente062@email.com', 'Avenida do Hóspede, 262, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (63, 'Cliente SkyLodge 063', '10000000063', '+55 11 93000-0063', 'cliente063@email.com', 'Avenida do Hóspede, 263, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (64, 'Cliente SkyLodge 064', '10000000064', '+55 11 93000-0064', 'cliente064@email.com', 'Avenida do Hóspede, 264, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (65, 'Cliente SkyLodge 065', '10000000065', '+55 11 93000-0065', 'cliente065@email.com', 'Avenida do Hóspede, 265, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (66, 'Cliente SkyLodge 066', '10000000066', '+55 11 93000-0066', 'cliente066@email.com', 'Avenida do Hóspede, 266, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (67, 'Cliente SkyLodge 067', '10000000067', '+55 11 93000-0067', 'cliente067@email.com', 'Avenida do Hóspede, 267, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (68, 'Cliente SkyLodge 068', '10000000068', '+55 11 93000-0068', 'cliente068@email.com', 'Avenida do Hóspede, 268, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (69, 'Cliente SkyLodge 069', '10000000069', '+55 11 93000-0069', 'cliente069@email.com', 'Avenida do Hóspede, 269, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (70, 'Cliente SkyLodge 070', '10000000070', '+55 11 93000-0070', 'cliente070@email.com', 'Avenida do Hóspede, 270, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (71, 'Cliente SkyLodge 071', '10000000071', '+55 11 93000-0071', 'cliente071@email.com', 'Avenida do Hóspede, 271, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (72, 'Cliente SkyLodge 072', '10000000072', '+55 11 93000-0072', 'cliente072@email.com', 'Avenida do Hóspede, 272, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (73, 'Cliente SkyLodge 073', '10000000073', '+55 11 93000-0073', 'cliente073@email.com', 'Avenida do Hóspede, 273, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (74, 'Cliente SkyLodge 074', '10000000074', '+55 11 93000-0074', 'cliente074@email.com', 'Avenida do Hóspede, 274, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (75, 'Cliente SkyLodge 075', '10000000075', '+55 11 93000-0075', 'cliente075@email.com', 'Avenida do Hóspede, 275, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (76, 'Cliente SkyLodge 076', '10000000076', '+55 11 93000-0076', 'cliente076@email.com', 'Avenida do Hóspede, 276, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (77, 'Cliente SkyLodge 077', '10000000077', '+55 11 93000-0077', 'cliente077@email.com', 'Avenida do Hóspede, 277, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (78, 'Cliente SkyLodge 078', '10000000078', '+55 11 93000-0078', 'cliente078@email.com', 'Avenida do Hóspede, 278, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (79, 'Cliente SkyLodge 079', '10000000079', '+55 11 93000-0079', 'cliente079@email.com', 'Avenida do Hóspede, 279, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (80, 'Cliente SkyLodge 080', '10000000080', '+55 11 93000-0080', 'cliente080@email.com', 'Avenida do Hóspede, 280, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (81, 'Cliente SkyLodge 081', '10000000081', '+55 11 93000-0081', 'cliente081@email.com', 'Avenida do Hóspede, 281, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (82, 'Cliente SkyLodge 082', '10000000082', '+55 11 93000-0082', 'cliente082@email.com', 'Avenida do Hóspede, 282, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (83, 'Cliente SkyLodge 083', '10000000083', '+55 11 93000-0083', 'cliente083@email.com', 'Avenida do Hóspede, 283, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (84, 'Cliente SkyLodge 084', '10000000084', '+55 11 93000-0084', 'cliente084@email.com', 'Avenida do Hóspede, 284, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (85, 'Cliente SkyLodge 085', '10000000085', '+55 11 93000-0085', 'cliente085@email.com', 'Avenida do Hóspede, 285, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (86, 'Cliente SkyLodge 086', '10000000086', '+55 11 93000-0086', 'cliente086@email.com', 'Avenida do Hóspede, 286, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (87, 'Cliente SkyLodge 087', '10000000087', '+55 11 93000-0087', 'cliente087@email.com', 'Avenida do Hóspede, 287, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (88, 'Cliente SkyLodge 088', '10000000088', '+55 11 93000-0088', 'cliente088@email.com', 'Avenida do Hóspede, 288, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (89, 'Cliente SkyLodge 089', '10000000089', '+55 11 93000-0089', 'cliente089@email.com', 'Avenida do Hóspede, 289, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (90, 'Cliente SkyLodge 090', '10000000090', '+55 11 93000-0090', 'cliente090@email.com', 'Avenida do Hóspede, 290, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (91, 'Cliente SkyLodge 091', '10000000091', '+55 11 93000-0091', 'cliente091@email.com', 'Avenida do Hóspede, 291, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (92, 'Cliente SkyLodge 092', '10000000092', '+55 11 93000-0092', 'cliente092@email.com', 'Avenida do Hóspede, 292, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (93, 'Cliente SkyLodge 093', '10000000093', '+55 11 93000-0093', 'cliente093@email.com', 'Avenida do Hóspede, 293, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (94, 'Cliente SkyLodge 094', '10000000094', '+55 11 93000-0094', 'cliente094@email.com', 'Avenida do Hóspede, 294, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (95, 'Cliente SkyLodge 095', '10000000095', '+55 11 93000-0095', 'cliente095@email.com', 'Avenida do Hóspede, 295, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (96, 'Cliente SkyLodge 096', '10000000096', '+55 11 93000-0096', 'cliente096@email.com', 'Avenida do Hóspede, 296, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (97, 'Cliente SkyLodge 097', '10000000097', '+55 11 93000-0097', 'cliente097@email.com', 'Avenida do Hóspede, 297, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (98, 'Cliente SkyLodge 098', '10000000098', '+55 11 93000-0098', 'cliente098@email.com', 'Avenida do Hóspede, 298, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (99, 'Cliente SkyLodge 099', '10000000099', '+55 11 93000-0099', 'cliente099@email.com', 'Avenida do Hóspede, 299, São Paulo - SP');
INSERT INTO cliente (id_cliente, nome, documento, telefone, email, endereco) VALUES (100, 'Cliente SkyLodge 100', '10000000100', '+55 11 93000-0100', 'cliente100@email.com', 'Avenida do Hóspede, 300, São Paulo - SP');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (1, 1, 1, '2026-01-01 10:00:00', '2027-01-01', '2027-01-03', 'Confirmada', 'Site', 'Reserva de teste 001.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (2, 2, 2, '2026-02-02 10:00:00', '2027-02-02', '2027-02-04', 'Concluída', 'Telefone', 'Reserva de teste 002.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (3, 3, 3, '2026-03-03 10:00:00', '2027-03-03', '2027-03-05', 'Confirmada', 'Balcão', 'Reserva de teste 003.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (4, 4, 4, '2026-04-04 10:00:00', '2027-04-04', '2027-04-06', 'Confirmada', 'Booking', 'Reserva de teste 004.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (5, 5, 5, '2026-05-05 10:00:00', '2027-05-05', '2027-05-07', 'Cancelada', 'Agência', 'Reserva de teste 005.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (6, 6, 6, '2026-06-06 10:00:00', '2027-06-06', '2027-06-08', 'Confirmada', 'Site', 'Reserva de teste 006.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (7, 7, 7, '2026-07-07 10:00:00', '2027-07-07', '2027-07-09', 'Concluída', 'Telefone', 'Reserva de teste 007.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (8, 8, 8, '2026-08-08 10:00:00', '2027-08-08', '2027-08-10', 'Confirmada', 'Balcão', 'Reserva de teste 008.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (9, 9, 9, '2026-09-09 10:00:00', '2027-09-09', '2027-09-11', 'Confirmada', 'Booking', 'Reserva de teste 009.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (10, 10, 10, '2026-10-10 10:00:00', '2027-10-10', '2027-10-12', 'Cancelada', 'Agência', 'Reserva de teste 010.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (11, 11, 11, '2026-11-11 10:00:00', '2027-11-11', '2027-11-13', 'Confirmada', 'Site', 'Reserva de teste 011.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (12, 12, 12, '2026-12-12 10:00:00', '2027-12-12', '2027-12-14', 'Concluída', 'Telefone', 'Reserva de teste 012.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (13, 13, 13, '2026-01-13 10:00:00', '2027-01-13', '2027-01-15', 'Confirmada', 'Balcão', 'Reserva de teste 013.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (14, 14, 14, '2026-02-14 10:00:00', '2027-02-14', '2027-02-16', 'Confirmada', 'Booking', 'Reserva de teste 014.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (15, 15, 15, '2026-03-15 10:00:00', '2027-03-15', '2027-03-17', 'Cancelada', 'Agência', 'Reserva de teste 015.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (16, 16, 16, '2026-04-16 10:00:00', '2027-04-16', '2027-04-18', 'Confirmada', 'Site', 'Reserva de teste 016.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (17, 17, 17, '2026-05-17 10:00:00', '2027-05-17', '2027-05-19', 'Concluída', 'Telefone', 'Reserva de teste 017.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (18, 18, 18, '2026-06-18 10:00:00', '2027-06-18', '2027-06-20', 'Confirmada', 'Balcão', 'Reserva de teste 018.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (19, 19, 19, '2026-07-19 10:00:00', '2027-07-19', '2027-07-21', 'Confirmada', 'Booking', 'Reserva de teste 019.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (20, 20, 20, '2026-08-20 10:00:00', '2027-08-20', '2027-08-22', 'Cancelada', 'Agência', 'Reserva de teste 020.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (21, 21, 21, '2026-09-01 10:00:00', '2027-09-01', '2027-09-03', 'Confirmada', 'Site', 'Reserva de teste 021.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (22, 22, 22, '2026-10-02 10:00:00', '2027-10-02', '2027-10-04', 'Concluída', 'Telefone', 'Reserva de teste 022.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (23, 23, 23, '2026-11-03 10:00:00', '2027-11-03', '2027-11-05', 'Confirmada', 'Balcão', 'Reserva de teste 023.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (24, 24, 24, '2026-12-04 10:00:00', '2027-12-04', '2027-12-06', 'Confirmada', 'Booking', 'Reserva de teste 024.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (25, 25, 25, '2026-01-05 10:00:00', '2027-01-05', '2027-01-07', 'Cancelada', 'Agência', 'Reserva de teste 025.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (26, 26, 26, '2026-02-06 10:00:00', '2027-02-06', '2027-02-08', 'Confirmada', 'Site', 'Reserva de teste 026.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (27, 27, 27, '2026-03-07 10:00:00', '2027-03-07', '2027-03-09', 'Concluída', 'Telefone', 'Reserva de teste 027.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (28, 28, 28, '2026-04-08 10:00:00', '2027-04-08', '2027-04-10', 'Confirmada', 'Balcão', 'Reserva de teste 028.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (29, 29, 29, '2026-05-09 10:00:00', '2027-05-09', '2027-05-11', 'Confirmada', 'Booking', 'Reserva de teste 029.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (30, 30, 30, '2026-06-10 10:00:00', '2027-06-10', '2027-06-12', 'Cancelada', 'Agência', 'Reserva de teste 030.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (31, 31, 31, '2026-07-11 10:00:00', '2027-07-11', '2027-07-13', 'Confirmada', 'Site', 'Reserva de teste 031.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (32, 32, 32, '2026-08-12 10:00:00', '2027-08-12', '2027-08-14', 'Concluída', 'Telefone', 'Reserva de teste 032.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (33, 33, 33, '2026-09-13 10:00:00', '2027-09-13', '2027-09-15', 'Confirmada', 'Balcão', 'Reserva de teste 033.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (34, 34, 34, '2026-10-14 10:00:00', '2027-10-14', '2027-10-16', 'Confirmada', 'Booking', 'Reserva de teste 034.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (35, 35, 35, '2026-11-15 10:00:00', '2027-11-15', '2027-11-17', 'Cancelada', 'Agência', 'Reserva de teste 035.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (36, 36, 36, '2026-12-16 10:00:00', '2027-12-16', '2027-12-18', 'Confirmada', 'Site', 'Reserva de teste 036.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (37, 37, 37, '2026-01-17 10:00:00', '2027-01-17', '2027-01-19', 'Concluída', 'Telefone', 'Reserva de teste 037.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (38, 38, 38, '2026-02-18 10:00:00', '2027-02-18', '2027-02-20', 'Confirmada', 'Balcão', 'Reserva de teste 038.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (39, 39, 39, '2026-03-19 10:00:00', '2027-03-19', '2027-03-21', 'Confirmada', 'Booking', 'Reserva de teste 039.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (40, 40, 40, '2026-04-20 10:00:00', '2027-04-20', '2027-04-22', 'Cancelada', 'Agência', 'Reserva de teste 040.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (41, 41, 41, '2026-05-01 10:00:00', '2027-05-01', '2027-05-03', 'Confirmada', 'Site', 'Reserva de teste 041.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (42, 42, 42, '2026-06-02 10:00:00', '2027-06-02', '2027-06-04', 'Concluída', 'Telefone', 'Reserva de teste 042.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (43, 43, 43, '2026-07-03 10:00:00', '2027-07-03', '2027-07-05', 'Confirmada', 'Balcão', 'Reserva de teste 043.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (44, 44, 44, '2026-08-04 10:00:00', '2027-08-04', '2027-08-06', 'Confirmada', 'Booking', 'Reserva de teste 044.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (45, 45, 45, '2026-09-05 10:00:00', '2027-09-05', '2027-09-07', 'Cancelada', 'Agência', 'Reserva de teste 045.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (46, 46, 46, '2026-10-06 10:00:00', '2027-10-06', '2027-10-08', 'Confirmada', 'Site', 'Reserva de teste 046.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (47, 47, 47, '2026-11-07 10:00:00', '2027-11-07', '2027-11-09', 'Concluída', 'Telefone', 'Reserva de teste 047.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (48, 48, 48, '2026-12-08 10:00:00', '2027-12-08', '2027-12-10', 'Confirmada', 'Balcão', 'Reserva de teste 048.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (49, 49, 49, '2026-01-09 10:00:00', '2027-01-09', '2027-01-11', 'Confirmada', 'Booking', 'Reserva de teste 049.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (50, 50, 50, '2026-02-10 10:00:00', '2027-02-10', '2027-02-12', 'Cancelada', 'Agência', 'Reserva de teste 050.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (51, 51, 51, '2026-03-11 10:00:00', '2027-03-11', '2027-03-13', 'Confirmada', 'Site', 'Reserva de teste 051.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (52, 52, 52, '2026-04-12 10:00:00', '2027-04-12', '2027-04-14', 'Concluída', 'Telefone', 'Reserva de teste 052.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (53, 53, 53, '2026-05-13 10:00:00', '2027-05-13', '2027-05-15', 'Confirmada', 'Balcão', 'Reserva de teste 053.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (54, 54, 54, '2026-06-14 10:00:00', '2027-06-14', '2027-06-16', 'Confirmada', 'Booking', 'Reserva de teste 054.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (55, 55, 55, '2026-07-15 10:00:00', '2027-07-15', '2027-07-17', 'Cancelada', 'Agência', 'Reserva de teste 055.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (56, 56, 56, '2026-08-16 10:00:00', '2027-08-16', '2027-08-18', 'Confirmada', 'Site', 'Reserva de teste 056.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (57, 57, 57, '2026-09-17 10:00:00', '2027-09-17', '2027-09-19', 'Concluída', 'Telefone', 'Reserva de teste 057.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (58, 58, 58, '2026-10-18 10:00:00', '2027-10-18', '2027-10-20', 'Confirmada', 'Balcão', 'Reserva de teste 058.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (59, 59, 59, '2026-11-19 10:00:00', '2027-11-19', '2027-11-21', 'Confirmada', 'Booking', 'Reserva de teste 059.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (60, 60, 60, '2026-12-20 10:00:00', '2027-12-20', '2027-12-22', 'Cancelada', 'Agência', 'Reserva de teste 060.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (61, 61, 61, '2026-01-01 10:00:00', '2027-01-01', '2027-01-03', 'Confirmada', 'Site', 'Reserva de teste 061.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (62, 62, 62, '2026-02-02 10:00:00', '2027-02-02', '2027-02-04', 'Concluída', 'Telefone', 'Reserva de teste 062.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (63, 63, 63, '2026-03-03 10:00:00', '2027-03-03', '2027-03-05', 'Confirmada', 'Balcão', 'Reserva de teste 063.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (64, 64, 64, '2026-04-04 10:00:00', '2027-04-04', '2027-04-06', 'Confirmada', 'Booking', 'Reserva de teste 064.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (65, 65, 65, '2026-05-05 10:00:00', '2027-05-05', '2027-05-07', 'Cancelada', 'Agência', 'Reserva de teste 065.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (66, 66, 66, '2026-06-06 10:00:00', '2027-06-06', '2027-06-08', 'Confirmada', 'Site', 'Reserva de teste 066.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (67, 67, 67, '2026-07-07 10:00:00', '2027-07-07', '2027-07-09', 'Concluída', 'Telefone', 'Reserva de teste 067.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (68, 68, 68, '2026-08-08 10:00:00', '2027-08-08', '2027-08-10', 'Confirmada', 'Balcão', 'Reserva de teste 068.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (69, 69, 69, '2026-09-09 10:00:00', '2027-09-09', '2027-09-11', 'Confirmada', 'Booking', 'Reserva de teste 069.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (70, 70, 70, '2026-10-10 10:00:00', '2027-10-10', '2027-10-12', 'Cancelada', 'Agência', 'Reserva de teste 070.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (71, 71, 71, '2026-11-11 10:00:00', '2027-11-11', '2027-11-13', 'Confirmada', 'Site', 'Reserva de teste 071.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (72, 72, 72, '2026-12-12 10:00:00', '2027-12-12', '2027-12-14', 'Concluída', 'Telefone', 'Reserva de teste 072.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (73, 73, 73, '2026-01-13 10:00:00', '2027-01-13', '2027-01-15', 'Confirmada', 'Balcão', 'Reserva de teste 073.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (74, 74, 74, '2026-02-14 10:00:00', '2027-02-14', '2027-02-16', 'Confirmada', 'Booking', 'Reserva de teste 074.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (75, 75, 75, '2026-03-15 10:00:00', '2027-03-15', '2027-03-17', 'Cancelada', 'Agência', 'Reserva de teste 075.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (76, 76, 76, '2026-04-16 10:00:00', '2027-04-16', '2027-04-18', 'Confirmada', 'Site', 'Reserva de teste 076.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (77, 77, 77, '2026-05-17 10:00:00', '2027-05-17', '2027-05-19', 'Concluída', 'Telefone', 'Reserva de teste 077.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (78, 78, 78, '2026-06-18 10:00:00', '2027-06-18', '2027-06-20', 'Confirmada', 'Balcão', 'Reserva de teste 078.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (79, 79, 79, '2026-07-19 10:00:00', '2027-07-19', '2027-07-21', 'Confirmada', 'Booking', 'Reserva de teste 079.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (80, 80, 80, '2026-08-20 10:00:00', '2027-08-20', '2027-08-22', 'Cancelada', 'Agência', 'Reserva de teste 080.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (81, 81, 81, '2026-09-01 10:00:00', '2027-09-01', '2027-09-03', 'Confirmada', 'Site', 'Reserva de teste 081.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (82, 82, 82, '2026-10-02 10:00:00', '2027-10-02', '2027-10-04', 'Concluída', 'Telefone', 'Reserva de teste 082.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (83, 83, 83, '2026-11-03 10:00:00', '2027-11-03', '2027-11-05', 'Confirmada', 'Balcão', 'Reserva de teste 083.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (84, 84, 84, '2026-12-04 10:00:00', '2027-12-04', '2027-12-06', 'Confirmada', 'Booking', 'Reserva de teste 084.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (85, 85, 85, '2026-01-05 10:00:00', '2027-01-05', '2027-01-07', 'Cancelada', 'Agência', 'Reserva de teste 085.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (86, 86, 86, '2026-02-06 10:00:00', '2027-02-06', '2027-02-08', 'Confirmada', 'Site', 'Reserva de teste 086.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (87, 87, 87, '2026-03-07 10:00:00', '2027-03-07', '2027-03-09', 'Concluída', 'Telefone', 'Reserva de teste 087.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (88, 88, 88, '2026-04-08 10:00:00', '2027-04-08', '2027-04-10', 'Confirmada', 'Balcão', 'Reserva de teste 088.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (89, 89, 89, '2026-05-09 10:00:00', '2027-05-09', '2027-05-11', 'Confirmada', 'Booking', 'Reserva de teste 089.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (90, 90, 90, '2026-06-10 10:00:00', '2027-06-10', '2027-06-12', 'Cancelada', 'Agência', 'Reserva de teste 090.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (91, 91, 91, '2026-07-11 10:00:00', '2027-07-11', '2027-07-13', 'Confirmada', 'Site', 'Reserva de teste 091.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (92, 92, 92, '2026-08-12 10:00:00', '2027-08-12', '2027-08-14', 'Concluída', 'Telefone', 'Reserva de teste 092.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (93, 93, 93, '2026-09-13 10:00:00', '2027-09-13', '2027-09-15', 'Confirmada', 'Balcão', 'Reserva de teste 093.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (94, 94, 94, '2026-10-14 10:00:00', '2027-10-14', '2027-10-16', 'Confirmada', 'Booking', 'Reserva de teste 094.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (95, 95, 95, '2026-11-15 10:00:00', '2027-11-15', '2027-11-17', 'Cancelada', 'Agência', 'Reserva de teste 095.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (96, 96, 96, '2026-12-16 10:00:00', '2027-12-16', '2027-12-18', 'Confirmada', 'Site', 'Reserva de teste 096.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (97, 97, 97, '2026-01-17 10:00:00', '2027-01-17', '2027-01-19', 'Concluída', 'Telefone', 'Reserva de teste 097.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (98, 98, 98, '2026-02-18 10:00:00', '2027-02-18', '2027-02-20', 'Confirmada', 'Balcão', 'Reserva de teste 098.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (99, 99, 99, '2026-03-19 10:00:00', '2027-03-19', '2027-03-21', 'Confirmada', 'Booking', 'Reserva de teste 099.');
INSERT INTO reserva (id_reserva, id_cliente, id_quarto, data_reserva, data_checkin_prevista, data_checkout_prevista, status, origem_reserva, observacoes) VALUES (100, 100, 100, '2026-04-20 10:00:00', '2027-04-20', '2027-04-22', 'Cancelada', 'Agência', 'Reserva de teste 100.');
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (1, 1, '2027-01-01 14:00:00', 1);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (2, 2, '2027-02-02 14:00:00', 2);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (3, 3, '2027-03-03 14:00:00', 3);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (4, 4, '2027-04-04 14:00:00', 4);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (5, 5, '2027-05-05 14:00:00', 5);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (6, 6, '2027-06-06 14:00:00', 6);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (7, 7, '2027-07-07 14:00:00', 7);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (8, 8, '2027-08-08 14:00:00', 8);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (9, 9, '2027-09-09 14:00:00', 9);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (10, 10, '2027-10-10 14:00:00', 10);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (11, 11, '2027-11-11 14:00:00', 11);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (12, 12, '2027-12-12 14:00:00', 12);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (13, 13, '2027-01-13 14:00:00', 13);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (14, 14, '2027-02-14 14:00:00', 14);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (15, 15, '2027-03-15 14:00:00', 15);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (16, 16, '2027-04-16 14:00:00', 16);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (17, 17, '2027-05-17 14:00:00', 17);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (18, 18, '2027-06-18 14:00:00', 18);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (19, 19, '2027-07-19 14:00:00', 19);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (20, 20, '2027-08-20 14:00:00', 20);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (21, 21, '2027-09-01 14:00:00', 21);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (22, 22, '2027-10-02 14:00:00', 22);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (23, 23, '2027-11-03 14:00:00', 23);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (24, 24, '2027-12-04 14:00:00', 24);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (25, 25, '2027-01-05 14:00:00', 25);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (26, 26, '2027-02-06 14:00:00', 26);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (27, 27, '2027-03-07 14:00:00', 27);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (28, 28, '2027-04-08 14:00:00', 28);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (29, 29, '2027-05-09 14:00:00', 29);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (30, 30, '2027-06-10 14:00:00', 30);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (31, 31, '2027-07-11 14:00:00', 31);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (32, 32, '2027-08-12 14:00:00', 32);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (33, 33, '2027-09-13 14:00:00', 33);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (34, 34, '2027-10-14 14:00:00', 34);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (35, 35, '2027-11-15 14:00:00', 35);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (36, 36, '2027-12-16 14:00:00', 36);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (37, 37, '2027-01-17 14:00:00', 37);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (38, 38, '2027-02-18 14:00:00', 38);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (39, 39, '2027-03-19 14:00:00', 39);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (40, 40, '2027-04-20 14:00:00', 40);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (41, 41, '2027-05-01 14:00:00', 41);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (42, 42, '2027-06-02 14:00:00', 42);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (43, 43, '2027-07-03 14:00:00', 43);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (44, 44, '2027-08-04 14:00:00', 44);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (45, 45, '2027-09-05 14:00:00', 45);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (46, 46, '2027-10-06 14:00:00', 46);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (47, 47, '2027-11-07 14:00:00', 47);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (48, 48, '2027-12-08 14:00:00', 48);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (49, 49, '2027-01-09 14:00:00', 49);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (50, 50, '2027-02-10 14:00:00', 50);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (51, 51, '2027-03-11 14:00:00', 51);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (52, 52, '2027-04-12 14:00:00', 52);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (53, 53, '2027-05-13 14:00:00', 53);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (54, 54, '2027-06-14 14:00:00', 54);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (55, 55, '2027-07-15 14:00:00', 55);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (56, 56, '2027-08-16 14:00:00', 56);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (57, 57, '2027-09-17 14:00:00', 57);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (58, 58, '2027-10-18 14:00:00', 58);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (59, 59, '2027-11-19 14:00:00', 59);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (60, 60, '2027-12-20 14:00:00', 60);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (61, 61, '2027-01-01 14:00:00', 61);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (62, 62, '2027-02-02 14:00:00', 62);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (63, 63, '2027-03-03 14:00:00', 63);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (64, 64, '2027-04-04 14:00:00', 64);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (65, 65, '2027-05-05 14:00:00', 65);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (66, 66, '2027-06-06 14:00:00', 66);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (67, 67, '2027-07-07 14:00:00', 67);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (68, 68, '2027-08-08 14:00:00', 68);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (69, 69, '2027-09-09 14:00:00', 69);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (70, 70, '2027-10-10 14:00:00', 70);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (71, 71, '2027-11-11 14:00:00', 71);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (72, 72, '2027-12-12 14:00:00', 72);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (73, 73, '2027-01-13 14:00:00', 73);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (74, 74, '2027-02-14 14:00:00', 74);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (75, 75, '2027-03-15 14:00:00', 75);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (76, 76, '2027-04-16 14:00:00', 76);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (77, 77, '2027-05-17 14:00:00', 77);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (78, 78, '2027-06-18 14:00:00', 78);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (79, 79, '2027-07-19 14:00:00', 79);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (80, 80, '2027-08-20 14:00:00', 80);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (81, 81, '2027-09-01 14:00:00', 81);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (82, 82, '2027-10-02 14:00:00', 82);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (83, 83, '2027-11-03 14:00:00', 83);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (84, 84, '2027-12-04 14:00:00', 84);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (85, 85, '2027-01-05 14:00:00', 85);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (86, 86, '2027-02-06 14:00:00', 86);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (87, 87, '2027-03-07 14:00:00', 87);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (88, 88, '2027-04-08 14:00:00', 88);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (89, 89, '2027-05-09 14:00:00', 89);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (90, 90, '2027-06-10 14:00:00', 90);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (91, 91, '2027-07-11 14:00:00', 91);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (92, 92, '2027-08-12 14:00:00', 92);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (93, 93, '2027-09-13 14:00:00', 93);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (94, 94, '2027-10-14 14:00:00', 94);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (95, 95, '2027-11-15 14:00:00', 95);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (96, 96, '2027-12-16 14:00:00', 96);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (97, 97, '2027-01-17 14:00:00', 97);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (98, 98, '2027-02-18 14:00:00', 98);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (99, 99, '2027-03-19 14:00:00', 99);
INSERT INTO checkin (id_checkin, id_reserva, data_hora, recepcionista) VALUES (100, 100, '2027-04-20 14:00:00', 100);
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (1, 1, '2027-01-03 11:00:00', 267.50, 1, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (2, 2, '2027-02-04 11:00:00', 285.00, 2, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (3, 3, '2027-03-05 11:00:00', 302.50, 3, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (4, 4, '2027-04-06 11:00:00', 320.00, 4, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (5, 5, '2027-05-07 11:00:00', 337.50, 5, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (6, 6, '2027-06-08 11:00:00', 355.00, 6, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (7, 7, '2027-07-09 11:00:00', 372.50, 7, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (8, 8, '2027-08-10 11:00:00', 390.00, 8, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (9, 9, '2027-09-11 11:00:00', 407.50, 9, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (10, 10, '2027-10-12 11:00:00', 425.00, 10, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (11, 11, '2027-11-13 11:00:00', 442.50, 11, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (12, 12, '2027-12-14 11:00:00', 460.00, 12, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (13, 13, '2027-01-15 11:00:00', 477.50, 13, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (14, 14, '2027-02-16 11:00:00', 495.00, 14, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (15, 15, '2027-03-17 11:00:00', 512.50, 15, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (16, 16, '2027-04-18 11:00:00', 530.00, 16, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (17, 17, '2027-05-19 11:00:00', 547.50, 17, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (18, 18, '2027-06-20 11:00:00', 565.00, 18, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (19, 19, '2027-07-21 11:00:00', 582.50, 19, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (20, 20, '2027-08-22 11:00:00', 600.00, 20, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (21, 21, '2027-09-03 11:00:00', 617.50, 21, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (22, 22, '2027-10-04 11:00:00', 635.00, 22, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (23, 23, '2027-11-05 11:00:00', 652.50, 23, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (24, 24, '2027-12-06 11:00:00', 670.00, 24, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (25, 25, '2027-01-07 11:00:00', 687.50, 25, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (26, 26, '2027-02-08 11:00:00', 705.00, 26, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (27, 27, '2027-03-09 11:00:00', 722.50, 27, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (28, 28, '2027-04-10 11:00:00', 740.00, 28, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (29, 29, '2027-05-11 11:00:00', 757.50, 29, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (30, 30, '2027-06-12 11:00:00', 775.00, 30, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (31, 31, '2027-07-13 11:00:00', 792.50, 31, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (32, 32, '2027-08-14 11:00:00', 810.00, 32, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (33, 33, '2027-09-15 11:00:00', 827.50, 33, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (34, 34, '2027-10-16 11:00:00', 845.00, 34, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (35, 35, '2027-11-17 11:00:00', 862.50, 35, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (36, 36, '2027-12-18 11:00:00', 880.00, 36, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (37, 37, '2027-01-19 11:00:00', 897.50, 37, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (38, 38, '2027-02-20 11:00:00', 915.00, 38, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (39, 39, '2027-03-21 11:00:00', 932.50, 39, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (40, 40, '2027-04-22 11:00:00', 950.00, 40, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (41, 41, '2027-05-03 11:00:00', 967.50, 41, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (42, 42, '2027-06-04 11:00:00', 985.00, 42, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (43, 43, '2027-07-05 11:00:00', 1002.50, 43, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (44, 44, '2027-08-06 11:00:00', 1020.00, 44, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (45, 45, '2027-09-07 11:00:00', 1037.50, 45, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (46, 46, '2027-10-08 11:00:00', 1055.00, 46, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (47, 47, '2027-11-09 11:00:00', 1072.50, 47, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (48, 48, '2027-12-10 11:00:00', 1090.00, 48, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (49, 49, '2027-01-11 11:00:00', 1107.50, 49, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (50, 50, '2027-02-12 11:00:00', 1125.00, 50, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (51, 51, '2027-03-13 11:00:00', 1142.50, 51, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (52, 52, '2027-04-14 11:00:00', 1160.00, 52, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (53, 53, '2027-05-15 11:00:00', 1177.50, 53, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (54, 54, '2027-06-16 11:00:00', 1195.00, 54, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (55, 55, '2027-07-17 11:00:00', 1212.50, 55, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (56, 56, '2027-08-18 11:00:00', 1230.00, 56, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (57, 57, '2027-09-19 11:00:00', 1247.50, 57, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (58, 58, '2027-10-20 11:00:00', 1265.00, 58, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (59, 59, '2027-11-21 11:00:00', 1282.50, 59, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (60, 60, '2027-12-22 11:00:00', 1300.00, 60, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (61, 61, '2027-01-03 11:00:00', 1317.50, 61, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (62, 62, '2027-02-04 11:00:00', 1335.00, 62, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (63, 63, '2027-03-05 11:00:00', 1352.50, 63, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (64, 64, '2027-04-06 11:00:00', 1370.00, 64, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (65, 65, '2027-05-07 11:00:00', 1387.50, 65, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (66, 66, '2027-06-08 11:00:00', 1405.00, 66, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (67, 67, '2027-07-09 11:00:00', 1422.50, 67, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (68, 68, '2027-08-10 11:00:00', 1440.00, 68, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (69, 69, '2027-09-11 11:00:00', 1457.50, 69, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (70, 70, '2027-10-12 11:00:00', 1475.00, 70, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (71, 71, '2027-11-13 11:00:00', 1492.50, 71, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (72, 72, '2027-12-14 11:00:00', 1510.00, 72, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (73, 73, '2027-01-15 11:00:00', 1527.50, 73, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (74, 74, '2027-02-16 11:00:00', 1545.00, 74, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (75, 75, '2027-03-17 11:00:00', 1562.50, 75, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (76, 76, '2027-04-18 11:00:00', 1580.00, 76, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (77, 77, '2027-05-19 11:00:00', 1597.50, 77, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (78, 78, '2027-06-20 11:00:00', 1615.00, 78, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (79, 79, '2027-07-21 11:00:00', 1632.50, 79, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (80, 80, '2027-08-22 11:00:00', 1650.00, 80, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (81, 81, '2027-09-03 11:00:00', 1667.50, 81, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (82, 82, '2027-10-04 11:00:00', 1685.00, 82, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (83, 83, '2027-11-05 11:00:00', 1702.50, 83, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (84, 84, '2027-12-06 11:00:00', 1720.00, 84, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (85, 85, '2027-01-07 11:00:00', 1737.50, 85, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (86, 86, '2027-02-08 11:00:00', 1755.00, 86, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (87, 87, '2027-03-09 11:00:00', 1772.50, 87, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (88, 88, '2027-04-10 11:00:00', 1790.00, 88, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (89, 89, '2027-05-11 11:00:00', 1807.50, 89, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (90, 90, '2027-06-12 11:00:00', 1825.00, 90, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (91, 91, '2027-07-13 11:00:00', 1842.50, 91, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (92, 92, '2027-08-14 11:00:00', 1860.00, 92, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (93, 93, '2027-09-15 11:00:00', 1877.50, 93, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (94, 94, '2027-10-16 11:00:00', 1895.00, 94, 'Pix');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (95, 95, '2027-11-17 11:00:00', 1912.50, 95, 'Transferência');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (96, 96, '2027-12-18 11:00:00', 1930.00, 96, 'Outro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (97, 97, '2027-01-19 11:00:00', 1947.50, 97, 'Dinheiro');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (98, 98, '2027-02-20 11:00:00', 1965.00, 98, 'Cartão de Crédito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (99, 99, '2027-03-21 11:00:00', 1982.50, 99, 'Cartão de Débito');
INSERT INTO checkout (id_checkout, id_reserva, data_hora, valor_total_diarias, recepcionista, forma_pagamento) VALUES (100, 100, '2027-04-22 11:00:00', 2000.00, 100, 'Pix');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (1, 1, '2027-01-01', 'Limpeza', 'Pendente', 1, 'Serviço de limpeza do quarto 101.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (2, 2, '2027-02-02', 'Arrumação', 'Concluído', 2, 'Serviço de arrumação do quarto 102.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (3, 3, '2027-03-03', 'Limpeza', 'Pendente', 3, 'Serviço de limpeza do quarto 103.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (4, 4, '2027-04-04', 'Arrumação', 'Concluído', 4, 'Serviço de arrumação do quarto 104.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (5, 5, '2027-05-05', 'Limpeza', 'Pendente', 5, 'Serviço de limpeza do quarto 105.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (6, 6, '2027-06-06', 'Arrumação', 'Concluído', 6, 'Serviço de arrumação do quarto 106.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (7, 7, '2027-07-07', 'Limpeza', 'Pendente', 7, 'Serviço de limpeza do quarto 107.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (8, 8, '2027-08-08', 'Arrumação', 'Concluído', 8, 'Serviço de arrumação do quarto 108.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (9, 9, '2027-09-09', 'Limpeza', 'Pendente', 9, 'Serviço de limpeza do quarto 109.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (10, 10, '2027-10-10', 'Arrumação', 'Concluído', 10, 'Serviço de arrumação do quarto 110.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (11, 11, '2027-11-11', 'Limpeza', 'Pendente', 11, 'Serviço de limpeza do quarto 111.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (12, 12, '2027-12-12', 'Arrumação', 'Concluído', 12, 'Serviço de arrumação do quarto 112.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (13, 13, '2027-01-13', 'Limpeza', 'Pendente', 13, 'Serviço de limpeza do quarto 113.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (14, 14, '2027-02-14', 'Arrumação', 'Concluído', 14, 'Serviço de arrumação do quarto 114.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (15, 15, '2027-03-15', 'Limpeza', 'Pendente', 15, 'Serviço de limpeza do quarto 115.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (16, 16, '2027-04-16', 'Arrumação', 'Concluído', 16, 'Serviço de arrumação do quarto 116.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (17, 17, '2027-05-17', 'Limpeza', 'Pendente', 17, 'Serviço de limpeza do quarto 117.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (18, 18, '2027-06-18', 'Arrumação', 'Concluído', 18, 'Serviço de arrumação do quarto 118.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (19, 19, '2027-07-19', 'Limpeza', 'Pendente', 19, 'Serviço de limpeza do quarto 119.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (20, 20, '2027-08-20', 'Arrumação', 'Concluído', 20, 'Serviço de arrumação do quarto 120.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (21, 21, '2027-09-01', 'Limpeza', 'Pendente', 21, 'Serviço de limpeza do quarto 121.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (22, 22, '2027-10-02', 'Arrumação', 'Concluído', 22, 'Serviço de arrumação do quarto 122.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (23, 23, '2027-11-03', 'Limpeza', 'Pendente', 23, 'Serviço de limpeza do quarto 123.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (24, 24, '2027-12-04', 'Arrumação', 'Concluído', 24, 'Serviço de arrumação do quarto 124.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (25, 25, '2027-01-05', 'Limpeza', 'Pendente', 25, 'Serviço de limpeza do quarto 125.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (26, 26, '2027-02-06', 'Arrumação', 'Concluído', 26, 'Serviço de arrumação do quarto 126.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (27, 27, '2027-03-07', 'Limpeza', 'Pendente', 27, 'Serviço de limpeza do quarto 127.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (28, 28, '2027-04-08', 'Arrumação', 'Concluído', 28, 'Serviço de arrumação do quarto 128.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (29, 29, '2027-05-09', 'Limpeza', 'Pendente', 29, 'Serviço de limpeza do quarto 129.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (30, 30, '2027-06-10', 'Arrumação', 'Concluído', 30, 'Serviço de arrumação do quarto 130.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (31, 31, '2027-07-11', 'Limpeza', 'Pendente', 31, 'Serviço de limpeza do quarto 131.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (32, 32, '2027-08-12', 'Arrumação', 'Concluído', 32, 'Serviço de arrumação do quarto 132.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (33, 33, '2027-09-13', 'Limpeza', 'Pendente', 33, 'Serviço de limpeza do quarto 133.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (34, 34, '2027-10-14', 'Arrumação', 'Concluído', 34, 'Serviço de arrumação do quarto 134.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (35, 35, '2027-11-15', 'Limpeza', 'Pendente', 35, 'Serviço de limpeza do quarto 135.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (36, 36, '2027-12-16', 'Arrumação', 'Concluído', 36, 'Serviço de arrumação do quarto 136.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (37, 37, '2027-01-17', 'Limpeza', 'Pendente', 37, 'Serviço de limpeza do quarto 137.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (38, 38, '2027-02-18', 'Arrumação', 'Concluído', 38, 'Serviço de arrumação do quarto 138.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (39, 39, '2027-03-19', 'Limpeza', 'Pendente', 39, 'Serviço de limpeza do quarto 139.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (40, 40, '2027-04-20', 'Arrumação', 'Concluído', 40, 'Serviço de arrumação do quarto 140.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (41, 41, '2027-05-01', 'Limpeza', 'Pendente', 41, 'Serviço de limpeza do quarto 141.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (42, 42, '2027-06-02', 'Arrumação', 'Concluído', 42, 'Serviço de arrumação do quarto 142.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (43, 43, '2027-07-03', 'Limpeza', 'Pendente', 43, 'Serviço de limpeza do quarto 143.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (44, 44, '2027-08-04', 'Arrumação', 'Concluído', 44, 'Serviço de arrumação do quarto 144.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (45, 45, '2027-09-05', 'Limpeza', 'Pendente', 45, 'Serviço de limpeza do quarto 145.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (46, 46, '2027-10-06', 'Arrumação', 'Concluído', 46, 'Serviço de arrumação do quarto 146.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (47, 47, '2027-11-07', 'Limpeza', 'Pendente', 47, 'Serviço de limpeza do quarto 147.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (48, 48, '2027-12-08', 'Arrumação', 'Concluído', 48, 'Serviço de arrumação do quarto 148.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (49, 49, '2027-01-09', 'Limpeza', 'Pendente', 49, 'Serviço de limpeza do quarto 149.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (50, 50, '2027-02-10', 'Arrumação', 'Concluído', 50, 'Serviço de arrumação do quarto 150.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (51, 51, '2027-03-11', 'Limpeza', 'Pendente', 51, 'Serviço de limpeza do quarto 151.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (52, 52, '2027-04-12', 'Arrumação', 'Concluído', 52, 'Serviço de arrumação do quarto 152.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (53, 53, '2027-05-13', 'Limpeza', 'Pendente', 53, 'Serviço de limpeza do quarto 153.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (54, 54, '2027-06-14', 'Arrumação', 'Concluído', 54, 'Serviço de arrumação do quarto 154.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (55, 55, '2027-07-15', 'Limpeza', 'Pendente', 55, 'Serviço de limpeza do quarto 155.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (56, 56, '2027-08-16', 'Arrumação', 'Concluído', 56, 'Serviço de arrumação do quarto 156.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (57, 57, '2027-09-17', 'Limpeza', 'Pendente', 57, 'Serviço de limpeza do quarto 157.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (58, 58, '2027-10-18', 'Arrumação', 'Concluído', 58, 'Serviço de arrumação do quarto 158.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (59, 59, '2027-11-19', 'Limpeza', 'Pendente', 59, 'Serviço de limpeza do quarto 159.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (60, 60, '2027-12-20', 'Arrumação', 'Concluído', 60, 'Serviço de arrumação do quarto 160.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (61, 61, '2027-01-01', 'Limpeza', 'Pendente', 61, 'Serviço de limpeza do quarto 161.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (62, 62, '2027-02-02', 'Arrumação', 'Concluído', 62, 'Serviço de arrumação do quarto 162.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (63, 63, '2027-03-03', 'Limpeza', 'Pendente', 63, 'Serviço de limpeza do quarto 163.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (64, 64, '2027-04-04', 'Arrumação', 'Concluído', 64, 'Serviço de arrumação do quarto 164.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (65, 65, '2027-05-05', 'Limpeza', 'Pendente', 65, 'Serviço de limpeza do quarto 165.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (66, 66, '2027-06-06', 'Arrumação', 'Concluído', 66, 'Serviço de arrumação do quarto 166.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (67, 67, '2027-07-07', 'Limpeza', 'Pendente', 67, 'Serviço de limpeza do quarto 167.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (68, 68, '2027-08-08', 'Arrumação', 'Concluído', 68, 'Serviço de arrumação do quarto 168.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (69, 69, '2027-09-09', 'Limpeza', 'Pendente', 69, 'Serviço de limpeza do quarto 169.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (70, 70, '2027-10-10', 'Arrumação', 'Concluído', 70, 'Serviço de arrumação do quarto 170.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (71, 71, '2027-11-11', 'Limpeza', 'Pendente', 71, 'Serviço de limpeza do quarto 171.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (72, 72, '2027-12-12', 'Arrumação', 'Concluído', 72, 'Serviço de arrumação do quarto 172.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (73, 73, '2027-01-13', 'Limpeza', 'Pendente', 73, 'Serviço de limpeza do quarto 173.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (74, 74, '2027-02-14', 'Arrumação', 'Concluído', 74, 'Serviço de arrumação do quarto 174.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (75, 75, '2027-03-15', 'Limpeza', 'Pendente', 75, 'Serviço de limpeza do quarto 175.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (76, 76, '2027-04-16', 'Arrumação', 'Concluído', 76, 'Serviço de arrumação do quarto 176.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (77, 77, '2027-05-17', 'Limpeza', 'Pendente', 77, 'Serviço de limpeza do quarto 177.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (78, 78, '2027-06-18', 'Arrumação', 'Concluído', 78, 'Serviço de arrumação do quarto 178.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (79, 79, '2027-07-19', 'Limpeza', 'Pendente', 79, 'Serviço de limpeza do quarto 179.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (80, 80, '2027-08-20', 'Arrumação', 'Concluído', 80, 'Serviço de arrumação do quarto 180.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (81, 81, '2027-09-01', 'Limpeza', 'Pendente', 81, 'Serviço de limpeza do quarto 181.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (82, 82, '2027-10-02', 'Arrumação', 'Concluído', 82, 'Serviço de arrumação do quarto 182.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (83, 83, '2027-11-03', 'Limpeza', 'Pendente', 83, 'Serviço de limpeza do quarto 183.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (84, 84, '2027-12-04', 'Arrumação', 'Concluído', 84, 'Serviço de arrumação do quarto 184.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (85, 85, '2027-01-05', 'Limpeza', 'Pendente', 85, 'Serviço de limpeza do quarto 185.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (86, 86, '2027-02-06', 'Arrumação', 'Concluído', 86, 'Serviço de arrumação do quarto 186.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (87, 87, '2027-03-07', 'Limpeza', 'Pendente', 87, 'Serviço de limpeza do quarto 187.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (88, 88, '2027-04-08', 'Arrumação', 'Concluído', 88, 'Serviço de arrumação do quarto 188.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (89, 89, '2027-05-09', 'Limpeza', 'Pendente', 89, 'Serviço de limpeza do quarto 189.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (90, 90, '2027-06-10', 'Arrumação', 'Concluído', 90, 'Serviço de arrumação do quarto 190.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (91, 91, '2027-07-11', 'Limpeza', 'Pendente', 91, 'Serviço de limpeza do quarto 191.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (92, 92, '2027-08-12', 'Arrumação', 'Concluído', 92, 'Serviço de arrumação do quarto 192.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (93, 93, '2027-09-13', 'Limpeza', 'Pendente', 93, 'Serviço de limpeza do quarto 193.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (94, 94, '2027-10-14', 'Arrumação', 'Concluído', 94, 'Serviço de arrumação do quarto 194.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (95, 95, '2027-11-15', 'Limpeza', 'Pendente', 95, 'Serviço de limpeza do quarto 195.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (96, 96, '2027-12-16', 'Arrumação', 'Concluído', 96, 'Serviço de arrumação do quarto 196.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (97, 97, '2027-01-17', 'Limpeza', 'Pendente', 97, 'Serviço de limpeza do quarto 197.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (98, 98, '2027-02-18', 'Arrumação', 'Concluído', 98, 'Serviço de arrumação do quarto 198.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (99, 99, '2027-03-19', 'Limpeza', 'Pendente', 99, 'Serviço de limpeza do quarto 199.');
INSERT INTO servico_limpeza (id_limpeza, id_quarto, data, tipo_servico, status, funcionario, observacoes) VALUES (100, 100, '2027-04-20', 'Arrumação', 'Concluído', 100, 'Serviço de arrumação do quarto 200.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (1, 1, 'Frigobar', '2027-01-01 18:30:00', 23.75, 'Consumo de teste 001.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (2, 2, 'Restaurante', '2027-02-02 18:30:00', 27.50, 'Consumo de teste 002.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (3, 3, 'Outro', '2027-03-03 18:30:00', 31.25, 'Consumo de teste 003.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (4, 4, 'Frigobar', '2027-04-04 18:30:00', 35.00, 'Consumo de teste 004.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (5, 5, 'Restaurante', '2027-05-05 18:30:00', 38.75, 'Consumo de teste 005.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (6, 6, 'Outro', '2027-06-06 18:30:00', 42.50, 'Consumo de teste 006.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (7, 7, 'Frigobar', '2027-07-07 18:30:00', 46.25, 'Consumo de teste 007.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (8, 8, 'Restaurante', '2027-08-08 18:30:00', 50.00, 'Consumo de teste 008.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (9, 9, 'Outro', '2027-09-09 18:30:00', 53.75, 'Consumo de teste 009.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (10, 10, 'Frigobar', '2027-10-10 18:30:00', 57.50, 'Consumo de teste 010.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (11, 11, 'Restaurante', '2027-11-11 18:30:00', 61.25, 'Consumo de teste 011.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (12, 12, 'Outro', '2027-12-12 18:30:00', 65.00, 'Consumo de teste 012.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (13, 13, 'Frigobar', '2027-01-13 18:30:00', 68.75, 'Consumo de teste 013.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (14, 14, 'Restaurante', '2027-02-14 18:30:00', 72.50, 'Consumo de teste 014.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (15, 15, 'Outro', '2027-03-15 18:30:00', 76.25, 'Consumo de teste 015.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (16, 16, 'Frigobar', '2027-04-16 18:30:00', 80.00, 'Consumo de teste 016.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (17, 17, 'Restaurante', '2027-05-17 18:30:00', 83.75, 'Consumo de teste 017.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (18, 18, 'Outro', '2027-06-18 18:30:00', 87.50, 'Consumo de teste 018.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (19, 19, 'Frigobar', '2027-07-19 18:30:00', 91.25, 'Consumo de teste 019.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (20, 20, 'Restaurante', '2027-08-20 18:30:00', 95.00, 'Consumo de teste 020.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (21, 21, 'Outro', '2027-09-01 18:30:00', 98.75, 'Consumo de teste 021.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (22, 22, 'Frigobar', '2027-10-02 18:30:00', 102.50, 'Consumo de teste 022.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (23, 23, 'Restaurante', '2027-11-03 18:30:00', 106.25, 'Consumo de teste 023.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (24, 24, 'Outro', '2027-12-04 18:30:00', 110.00, 'Consumo de teste 024.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (25, 25, 'Frigobar', '2027-01-05 18:30:00', 113.75, 'Consumo de teste 025.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (26, 26, 'Restaurante', '2027-02-06 18:30:00', 117.50, 'Consumo de teste 026.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (27, 27, 'Outro', '2027-03-07 18:30:00', 121.25, 'Consumo de teste 027.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (28, 28, 'Frigobar', '2027-04-08 18:30:00', 125.00, 'Consumo de teste 028.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (29, 29, 'Restaurante', '2027-05-09 18:30:00', 128.75, 'Consumo de teste 029.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (30, 30, 'Outro', '2027-06-10 18:30:00', 132.50, 'Consumo de teste 030.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (31, 31, 'Frigobar', '2027-07-11 18:30:00', 136.25, 'Consumo de teste 031.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (32, 32, 'Restaurante', '2027-08-12 18:30:00', 140.00, 'Consumo de teste 032.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (33, 33, 'Outro', '2027-09-13 18:30:00', 143.75, 'Consumo de teste 033.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (34, 34, 'Frigobar', '2027-10-14 18:30:00', 147.50, 'Consumo de teste 034.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (35, 35, 'Restaurante', '2027-11-15 18:30:00', 151.25, 'Consumo de teste 035.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (36, 36, 'Outro', '2027-12-16 18:30:00', 155.00, 'Consumo de teste 036.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (37, 37, 'Frigobar', '2027-01-17 18:30:00', 158.75, 'Consumo de teste 037.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (38, 38, 'Restaurante', '2027-02-18 18:30:00', 162.50, 'Consumo de teste 038.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (39, 39, 'Outro', '2027-03-19 18:30:00', 166.25, 'Consumo de teste 039.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (40, 40, 'Frigobar', '2027-04-20 18:30:00', 170.00, 'Consumo de teste 040.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (41, 41, 'Restaurante', '2027-05-01 18:30:00', 173.75, 'Consumo de teste 041.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (42, 42, 'Outro', '2027-06-02 18:30:00', 177.50, 'Consumo de teste 042.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (43, 43, 'Frigobar', '2027-07-03 18:30:00', 181.25, 'Consumo de teste 043.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (44, 44, 'Restaurante', '2027-08-04 18:30:00', 185.00, 'Consumo de teste 044.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (45, 45, 'Outro', '2027-09-05 18:30:00', 188.75, 'Consumo de teste 045.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (46, 46, 'Frigobar', '2027-10-06 18:30:00', 192.50, 'Consumo de teste 046.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (47, 47, 'Restaurante', '2027-11-07 18:30:00', 196.25, 'Consumo de teste 047.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (48, 48, 'Outro', '2027-12-08 18:30:00', 200.00, 'Consumo de teste 048.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (49, 49, 'Frigobar', '2027-01-09 18:30:00', 203.75, 'Consumo de teste 049.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (50, 50, 'Restaurante', '2027-02-10 18:30:00', 207.50, 'Consumo de teste 050.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (51, 51, 'Outro', '2027-03-11 18:30:00', 211.25, 'Consumo de teste 051.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (52, 52, 'Frigobar', '2027-04-12 18:30:00', 215.00, 'Consumo de teste 052.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (53, 53, 'Restaurante', '2027-05-13 18:30:00', 218.75, 'Consumo de teste 053.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (54, 54, 'Outro', '2027-06-14 18:30:00', 222.50, 'Consumo de teste 054.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (55, 55, 'Frigobar', '2027-07-15 18:30:00', 226.25, 'Consumo de teste 055.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (56, 56, 'Restaurante', '2027-08-16 18:30:00', 230.00, 'Consumo de teste 056.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (57, 57, 'Outro', '2027-09-17 18:30:00', 233.75, 'Consumo de teste 057.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (58, 58, 'Frigobar', '2027-10-18 18:30:00', 237.50, 'Consumo de teste 058.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (59, 59, 'Restaurante', '2027-11-19 18:30:00', 241.25, 'Consumo de teste 059.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (60, 60, 'Outro', '2027-12-20 18:30:00', 245.00, 'Consumo de teste 060.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (61, 61, 'Frigobar', '2027-01-01 18:30:00', 248.75, 'Consumo de teste 061.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (62, 62, 'Restaurante', '2027-02-02 18:30:00', 252.50, 'Consumo de teste 062.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (63, 63, 'Outro', '2027-03-03 18:30:00', 256.25, 'Consumo de teste 063.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (64, 64, 'Frigobar', '2027-04-04 18:30:00', 260.00, 'Consumo de teste 064.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (65, 65, 'Restaurante', '2027-05-05 18:30:00', 263.75, 'Consumo de teste 065.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (66, 66, 'Outro', '2027-06-06 18:30:00', 267.50, 'Consumo de teste 066.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (67, 67, 'Frigobar', '2027-07-07 18:30:00', 271.25, 'Consumo de teste 067.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (68, 68, 'Restaurante', '2027-08-08 18:30:00', 275.00, 'Consumo de teste 068.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (69, 69, 'Outro', '2027-09-09 18:30:00', 278.75, 'Consumo de teste 069.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (70, 70, 'Frigobar', '2027-10-10 18:30:00', 282.50, 'Consumo de teste 070.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (71, 71, 'Restaurante', '2027-11-11 18:30:00', 286.25, 'Consumo de teste 071.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (72, 72, 'Outro', '2027-12-12 18:30:00', 290.00, 'Consumo de teste 072.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (73, 73, 'Frigobar', '2027-01-13 18:30:00', 293.75, 'Consumo de teste 073.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (74, 74, 'Restaurante', '2027-02-14 18:30:00', 297.50, 'Consumo de teste 074.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (75, 75, 'Outro', '2027-03-15 18:30:00', 301.25, 'Consumo de teste 075.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (76, 76, 'Frigobar', '2027-04-16 18:30:00', 305.00, 'Consumo de teste 076.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (77, 77, 'Restaurante', '2027-05-17 18:30:00', 308.75, 'Consumo de teste 077.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (78, 78, 'Outro', '2027-06-18 18:30:00', 312.50, 'Consumo de teste 078.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (79, 79, 'Frigobar', '2027-07-19 18:30:00', 316.25, 'Consumo de teste 079.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (80, 80, 'Restaurante', '2027-08-20 18:30:00', 320.00, 'Consumo de teste 080.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (81, 81, 'Outro', '2027-09-01 18:30:00', 323.75, 'Consumo de teste 081.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (82, 82, 'Frigobar', '2027-10-02 18:30:00', 327.50, 'Consumo de teste 082.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (83, 83, 'Restaurante', '2027-11-03 18:30:00', 331.25, 'Consumo de teste 083.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (84, 84, 'Outro', '2027-12-04 18:30:00', 335.00, 'Consumo de teste 084.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (85, 85, 'Frigobar', '2027-01-05 18:30:00', 338.75, 'Consumo de teste 085.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (86, 86, 'Restaurante', '2027-02-06 18:30:00', 342.50, 'Consumo de teste 086.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (87, 87, 'Outro', '2027-03-07 18:30:00', 346.25, 'Consumo de teste 087.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (88, 88, 'Frigobar', '2027-04-08 18:30:00', 350.00, 'Consumo de teste 088.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (89, 89, 'Restaurante', '2027-05-09 18:30:00', 353.75, 'Consumo de teste 089.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (90, 90, 'Outro', '2027-06-10 18:30:00', 357.50, 'Consumo de teste 090.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (91, 91, 'Frigobar', '2027-07-11 18:30:00', 361.25, 'Consumo de teste 091.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (92, 92, 'Restaurante', '2027-08-12 18:30:00', 365.00, 'Consumo de teste 092.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (93, 93, 'Outro', '2027-09-13 18:30:00', 368.75, 'Consumo de teste 093.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (94, 94, 'Frigobar', '2027-10-14 18:30:00', 372.50, 'Consumo de teste 094.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (95, 95, 'Restaurante', '2027-11-15 18:30:00', 376.25, 'Consumo de teste 095.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (96, 96, 'Outro', '2027-12-16 18:30:00', 380.00, 'Consumo de teste 096.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (97, 97, 'Frigobar', '2027-01-17 18:30:00', 383.75, 'Consumo de teste 097.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (98, 98, 'Restaurante', '2027-02-18 18:30:00', 387.50, 'Consumo de teste 098.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (99, 99, 'Outro', '2027-03-19 18:30:00', 391.25, 'Consumo de teste 099.');
INSERT INTO consumo (id_consumo, id_reserva, tipo, data_hora, valor_total, observacoes) VALUES (100, 100, 'Frigobar', '2027-04-20 18:30:00', 395.00, 'Consumo de teste 100.');
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (1, 1, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (2, 2, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (3, 3, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (4, 4, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (5, 5, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (6, 6, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (7, 7, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (8, 8, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (9, 9, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (10, 10, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (11, 11, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (12, 12, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (13, 13, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (14, 14, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (15, 15, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (16, 16, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (17, 17, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (18, 18, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (19, 19, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (20, 20, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (21, 21, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (22, 22, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (23, 23, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (24, 24, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (25, 25, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (26, 26, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (27, 27, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (28, 28, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (29, 29, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (30, 30, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (31, 31, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (32, 32, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (33, 33, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (34, 34, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (35, 35, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (36, 36, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (37, 37, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (38, 38, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (39, 39, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (40, 40, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (41, 41, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (42, 42, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (43, 43, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (44, 44, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (45, 45, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (46, 46, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (47, 47, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (48, 48, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (49, 49, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (50, 50, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (51, 51, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (52, 52, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (53, 53, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (54, 54, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (55, 55, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (56, 56, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (57, 57, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (58, 58, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (59, 59, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (60, 60, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (61, 61, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (62, 62, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (63, 63, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (64, 64, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (65, 65, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (66, 66, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (67, 67, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (68, 68, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (69, 69, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (70, 70, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (71, 71, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (72, 72, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (73, 73, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (74, 74, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (75, 75, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (76, 76, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (77, 77, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (78, 78, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (79, 79, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (80, 80, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (81, 81, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (82, 82, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (83, 83, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (84, 84, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (85, 85, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (86, 86, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (87, 87, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (88, 88, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (89, 89, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (90, 90, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (91, 91, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (92, 92, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (93, 93, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (94, 94, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (95, 95, 'Café', 2.00, 7.00, 14.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (96, 96, 'Água mineral', 1.00, 6.00, 6.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (97, 97, 'Refrigerante', 2.00, 8.50, 17.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (98, 98, 'Suco natural', 1.00, 12.00, 12.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (99, 99, 'Sanduíche', 1.00, 24.00, 24.00);
INSERT INTO item_consumo (id_item_consumo, id_consumo, descricao, quantidade, valor_unitario, valor_total) VALUES (100, 100, 'Café', 2.00, 7.00, 14.00);
