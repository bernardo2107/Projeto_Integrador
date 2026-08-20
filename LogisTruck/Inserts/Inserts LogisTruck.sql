USE LogisTruck;

-- 1. CLIENTES B2B
INSERT INTO clientes_b2b
(razao_social, cnpj, email, telefone, endereco, cidade, estado)
VALUES
('Minas Aço Industrial LTDA', '12.345.678/0001-10', 'contato@minasaco.com.br', '(31) 3333-1001', 'Av. Amazonas, 2500', 'Belo Horizonte', 'MG'),
('Supermercados Horizonte LTDA', '23.456.789/0001-21', 'logistica@horizonte.com.br', '(31) 3333-2002', 'Av. Cristiano Machado, 4100', 'Belo Horizonte', 'MG'),
('TechParts Brasil SA', '34.567.890/0001-32', 'compras@techparts.com.br', '(11) 4444-3003', 'Av. Paulista, 1500', 'São Paulo', 'SP'),
('EcoFoods Distribuidora LTDA', '45.678.901/0001-43', 'transportes@ecofoods.com.br', '(21) 5555-4004', 'Av. Brasil, 7500', 'Rio de Janeiro', 'RJ'),
('Construtora Nova Era LTDA', '56.789.012/0001-54', 'suprimentos@novaera.com.br', '(31) 6666-5005', 'Av. João César de Oliveira, 3200', 'Contagem', 'MG');

-- 2. MOTORISTAS
INSERT INTO motoristas
(nome, cpf, cnh, categoria_cnh, validade_cnh, telefone)
VALUES
('Carlos Henrique Silva', '123.456.789-01', 'CNH100001', 'E', '2030-05-20', '(31) 98888-1001'),
('Marcos Antônio Souza', '234.567.890-12', 'CNH100002', 'E', '2029-08-15', '(31) 98888-1002'),
('João Pedro Oliveira', '345.678.901-23', 'CNH100003', 'D', '2031-02-10', '(31) 98888-1003'),
('Ricardo Gomes Lima', '456.789.012-34', 'CNH100004', 'E', '2028-11-25', '(31) 98888-1004'),
('Fernando Costa Alves', '567.890.123-45', 'CNH100005', 'D', '2032-07-30', '(31) 98888-1005');

-- 3. CAMINHÕES
INSERT INTO caminhoes
(placa, marca, modelo, ano, capacidade_kg, km_atual, status, usuario_ultima_alteracao)
VALUES
('ABC1D23', 'Volvo', 'FH 540', 2024, 30000.00, 85000.00, 'DISPONIVEL', CURRENT_USER()),
('DEF4G56', 'Scania', 'R 450', 2023, 28000.00, 120000.00, 'DISPONIVEL', CURRENT_USER()),
('GHI7J89', 'Mercedes-Benz', 'Actros 2651', 2022, 26000.00, 145000.00, 'EM_ROTA', CURRENT_USER()),
('JKL1M23', 'DAF', 'XF 530', 2024, 32000.00, 65000.00, 'DISPONIVEL', CURRENT_USER()),
('NOP4Q56', 'Iveco', 'S-Way 480', 2021, 24000.00, 180000.00, 'DISPONIVEL', CURRENT_USER());

-- 4. ROTAS
INSERT INTO rotas
(origem, destino, distancia_km, pedagio_estimado, tempo_estimado_min)
VALUES
('Belo Horizonte - MG', 'São Paulo - SP', 586.00, 98.50, 640),
('Belo Horizonte - MG', 'Rio de Janeiro - RJ', 440.00, 72.00, 480),
('Contagem - MG', 'Vitória - ES', 540.00, 65.50, 590),
('Belo Horizonte - MG', 'Brasília - DF', 740.00, 45.00, 810),
('São Paulo - SP', 'Curitiba - PR', 408.00, 89.90, 445);

-- 5. ENTREGAS
INSERT INTO entregas
(id_cliente, id_motorista, id_caminhao, id_rota, data_saida, data_prevista, data_entrega, peso_carga_kg, valor_frete, status, observacoes_internas)
VALUES
(1, 1, 1, 1, '2026-08-15 06:00:00', '2026-08-16 18:00:00', '2026-08-16 15:30:00', 18000.00, 6500.00, 'ENTREGUE', 'Entrega realizada sem intercorrências.'),
(2, 2, 2, 2, '2026-08-18 07:30:00', '2026-08-19 16:00:00', '2026-08-19 14:20:00', 15000.00, 4800.00, 'ENTREGUE', 'Carga refrigerada entregue normalmente.'),
(3, 3, 3, 3, '2026-08-20 05:00:00', '2026-08-21 17:00:00', NULL, 12000.00, 5900.00, 'EM_TRANSPORTE', 'Carga de componentes eletrônicos.'),
(4, 4, 4, 4, '2026-08-21 06:00:00', '2026-08-22 20:00:00', NULL, 20000.00, 7200.00, 'AGENDADA', 'Aguardando liberação da carga.'),
(5, 5, 5, 5, '2026-08-22 08:00:00', '2026-08-23 18:00:00', NULL, 10000.00, 5100.00, 'AGENDADA', 'Materiais para construção civil.');

-- 6. MANUTENÇÕES
INSERT INTO manutencoes
(id_caminhao, tipo, data_manutencao, km_manutencao, descricao, custo, proxima_manutencao_km)
VALUES
(1, 'PREVENTIVA', '2026-07-10', 80000.00, 'Troca de óleo, filtros e revisão geral.', 1800.00, 100000.00),
(2, 'PREVENTIVA', '2026-07-20', 115000.00, 'Revisão dos freios e troca de filtros.', 2300.00, 135000.00),
(3, 'CORRETIVA', '2026-06-15', 140000.00, 'Substituição da bomba de combustível.', 4200.00, 160000.00),
(4, 'PREVENTIVA', '2026-08-01', 60000.00, 'Troca de óleo e inspeção dos pneus.', 1600.00, 80000.00),
(5, 'CORRETIVA', '2026-07-05', 175000.00, 'Reparo no sistema de transmissão.', 6800.00, 195000.00);

-- 7. ABASTECIMENTOS
INSERT INTO abastecimentos
(id_caminhao, id_motorista, data_abastecimento, litros, valor_total, km_odometro, posto)
VALUES
(1, 1, '2026-08-15 05:30:00', 300.00, 1830.00, 85050.00, 'Posto BR Fernão Dias'),
(2, 2, '2026-08-18 07:00:00', 280.00, 1708.00, 120100.00, 'Posto Shell Contagem'),
(3, 3, '2026-08-20 04:30:00', 320.00, 1984.00, 145150.00, 'Posto Ipiranga BR-381'),
(4, 4, '2026-08-19 09:00:00', 250.00, 1525.00, 65100.00, 'Posto Petrobras Betim'),
(5, 5, '2026-08-18 10:15:00', 290.00, 1769.00, 180200.00, 'Posto Graal Rodovia');

-- VERIFICAÇÃO DOS DADOS
SELECT * FROM clientes_b2b;
SELECT * FROM motoristas;
SELECT * FROM caminhoes;
SELECT * FROM rotas;
SELECT * FROM entregas;
SELECT * FROM manutencoes;
SELECT * FROM abastecimentos;