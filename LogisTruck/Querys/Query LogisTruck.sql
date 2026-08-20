USE LogisTruck;

-- 1. TODOS OS CLIENTES
SELECT * FROM clientes_b2b;

-- 2. TODOS OS MOTORISTAS
SELECT * FROM motoristas;

-- 3. TODOS OS CAMINHÕES
SELECT * FROM caminhoes;

-- 4. TODAS AS ROTAS
SELECT * FROM rotas;

-- 5. TODAS AS ENTREGAS
SELECT * FROM entregas;

-- 6. TODAS AS MANUTENÇÕES
SELECT * FROM manutencoes;

-- 7. TODOS OS ABASTECIMENTOS
SELECT * FROM abastecimentos;

-- 8. CONSULTA COMPLETA DAS ENTREGAS
SELECT
    e.id_entrega,
    cli.razao_social AS cliente,
    cli.cnpj,
    m.nome AS motorista,
    m.cnh,
    c.placa,
    c.marca,
    c.modelo,
    r.origem,
    r.destino,
    r.distancia_km,
    e.data_saida,
    e.data_prevista,
    e.data_entrega,
    e.peso_carga_kg,
    e.valor_frete,
    e.status
FROM entregas e
INNER JOIN clientes_b2b cli ON cli.id_cliente = e.id_cliente
INNER JOIN motoristas m ON m.id_motorista = e.id_motorista
INNER JOIN caminhoes c ON c.id_caminhao = e.id_caminhao
INNER JOIN rotas r ON r.id_rota = e.id_rota
ORDER BY e.id_entrega;

-- 9. CAMINHÕES DISPONÍVEIS
SELECT id_caminhao, placa, marca, modelo, capacidade_kg, km_atual
FROM caminhoes
WHERE status = 'DISPONIVEL';

-- 10. CAMINHÕES EM ROTA
SELECT id_caminhao, placa, marca, modelo, km_atual, status
FROM caminhoes
WHERE status = 'EM_ROTA';

-- 11. CAMINHÕES EM MANUTENÇÃO
SELECT id_caminhao, placa, marca, modelo, km_atual, status
FROM caminhoes
WHERE status = 'MANUTENCAO';

-- 12. MOTORISTAS COM CNH VÁLIDA
SELECT id_motorista, nome, cpf, cnh, categoria_cnh, validade_cnh
FROM motoristas
WHERE validade_cnh >= CURDATE()
AND status_ativo = TRUE;

-- 13. MOTORISTAS COM CNH VENCIDA
SELECT id_motorista, nome, cnh, validade_cnh
FROM motoristas
WHERE validade_cnh < CURDATE();

-- 14. ENTREGAS EM TRANSPORTE
SELECT
    e.id_entrega,
    cli.razao_social AS cliente,
    m.nome AS motorista,
    c.placa,
    r.origem,
    r.destino,
    e.data_saida,
    e.data_prevista
FROM entregas e
INNER JOIN clientes_b2b cli ON cli.id_cliente = e.id_cliente
INNER JOIN motoristas m ON m.id_motorista = e.id_motorista
INNER JOIN caminhoes c ON c.id_caminhao = e.id_caminhao
INNER JOIN rotas r ON r.id_rota = e.id_rota
WHERE e.status = 'EM_TRANSPORTE';

-- 15. ENTREGAS FINALIZADAS
SELECT
    e.id_entrega,
    cli.razao_social AS cliente,
    e.data_saida,
    e.data_entrega,
    e.valor_frete
FROM entregas e
INNER JOIN clientes_b2b cli ON cli.id_cliente = e.id_cliente
WHERE e.status = 'ENTREGUE';

-- 16. ENTREGAS ATRASADAS
SELECT
    e.id_entrega,
    cli.razao_social AS cliente,
    m.nome AS motorista,
    c.placa,
    r.destino,
    e.data_prevista,
    e.status
FROM entregas e
INNER JOIN clientes_b2b cli ON cli.id_cliente = e.id_cliente
INNER JOIN motoristas m ON m.id_motorista = e.id_motorista
INNER JOIN caminhoes c ON c.id_caminhao = e.id_caminhao
INNER JOIN rotas r ON r.id_rota = e.id_rota
WHERE e.data_prevista < NOW()
AND e.status NOT IN ('ENTREGUE', 'CANCELADA');

-- 17. TOTAL DE ENTREGAS POR CLIENTE
SELECT
    cli.id_cliente,
    cli.razao_social,
    COUNT(e.id_entrega) AS total_entregas
FROM clientes_b2b cli
LEFT JOIN entregas e ON e.id_cliente = cli.id_cliente
GROUP BY cli.id_cliente, cli.razao_social
ORDER BY total_entregas DESC;

-- 18. FATURAMENTO POR CLIENTE
SELECT
    cli.razao_social,
    COUNT(e.id_entrega) AS quantidade_entregas,
    SUM(e.valor_frete) AS faturamento_total
FROM clientes_b2b cli
INNER JOIN entregas e ON e.id_cliente = cli.id_cliente
GROUP BY cli.id_cliente, cli.razao_social
ORDER BY faturamento_total DESC;

-- 19. FATURAMENTO TOTAL
SELECT
    COUNT(*) AS total_entregas,
    SUM(valor_frete) AS faturamento_total,
    AVG(valor_frete) AS valor_medio_frete
FROM entregas
WHERE status <> 'CANCELADA';

-- 20. TOTAL DE ENTREGAS POR MOTORISTA
SELECT
    m.id_motorista,
    m.nome,
    COUNT(e.id_entrega) AS total_entregas
FROM motoristas m
LEFT JOIN entregas e ON e.id_motorista = m.id_motorista
GROUP BY m.id_motorista, m.nome
ORDER BY total_entregas DESC;

-- 21. TOTAL DE ENTREGAS POR CAMINHÃO
SELECT
    c.id_caminhao,
    c.placa,
    c.marca,
    c.modelo,
    COUNT(e.id_entrega) AS total_entregas
FROM caminhoes c
LEFT JOIN entregas e ON e.id_caminhao = c.id_caminhao
GROUP BY c.id_caminhao, c.placa, c.marca, c.modelo
ORDER BY total_entregas DESC;

-- 22. ROTAS MAIS UTILIZADAS
SELECT
    r.id_rota,
    r.origem,
    r.destino,
    r.distancia_km,
    COUNT(e.id_entrega) AS total_utilizacoes
FROM rotas r
LEFT JOIN entregas e ON e.id_rota = r.id_rota
GROUP BY r.id_rota, r.origem, r.destino, r.distancia_km
ORDER BY total_utilizacoes DESC;

-- 23. HISTÓRICO DE MANUTENÇÕES
SELECT
    m.id_manutencao,
    c.placa,
    c.marca,
    c.modelo,
    m.tipo,
    m.data_manutencao,
    m.km_manutencao,
    m.descricao,
    m.custo,
    m.proxima_manutencao_km
FROM manutencoes m
INNER JOIN caminhoes c ON c.id_caminhao = m.id_caminhao
ORDER BY m.data_manutencao DESC;

-- 24. CUSTO TOTAL DE MANUTENÇÃO POR CAMINHÃO
SELECT
    c.id_caminhao,
    c.placa,
    c.modelo,
    COUNT(m.id_manutencao) AS quantidade_manutencoes,
    COALESCE(SUM(m.custo), 0) AS custo_total_manutencoes
FROM caminhoes c
LEFT JOIN manutencoes m ON m.id_caminhao = c.id_caminhao
GROUP BY c.id_caminhao, c.placa, c.modelo
ORDER BY custo_total_manutencoes DESC;

-- 25. CAMINHÕES PRÓXIMOS DA MANUTENÇÃO
SELECT
    c.id_caminhao,
    c.placa,
    c.km_atual,
    m.proxima_manutencao_km,
    (m.proxima_manutencao_km - c.km_atual) AS km_restantes
FROM caminhoes c
INNER JOIN manutencoes m ON m.id_caminhao = c.id_caminhao
WHERE m.proxima_manutencao_km IS NOT NULL
AND (m.proxima_manutencao_km - c.km_atual) BETWEEN 0 AND 1000
ORDER BY km_restantes;

-- 26. HISTÓRICO DE ABASTECIMENTOS
SELECT
    a.id_abastecimento,
    c.placa,
    m.nome AS motorista,
    a.data_abastecimento,
    a.litros,
    a.valor_total,
    ROUND(a.valor_total / a.litros, 2) AS valor_litro,
    a.km_odometro,
    a.posto
FROM abastecimentos a
INNER JOIN caminhoes c ON c.id_caminhao = a.id_caminhao
INNER JOIN motoristas m ON m.id_motorista = a.id_motorista
ORDER BY a.data_abastecimento DESC;

-- 27. GASTO TOTAL COM COMBUSTÍVEL POR CAMINHÃO
SELECT
    c.id_caminhao,
    c.placa,
    c.modelo,
    COUNT(a.id_abastecimento) AS quantidade_abastecimentos,
    COALESCE(SUM(a.litros), 0) AS litros_abastecidos,
    COALESCE(SUM(a.valor_total), 0) AS gasto_total_combustivel
FROM caminhoes c
LEFT JOIN abastecimentos a ON a.id_caminhao = c.id_caminhao
GROUP BY c.id_caminhao, c.placa, c.modelo
ORDER BY gasto_total_combustivel DESC;

-- 28. PREÇO MÉDIO DO LITRO
SELECT
    ROUND(SUM(valor_total) / NULLIF(SUM(litros), 0), 2) AS preco_medio_litro
FROM abastecimentos;

-- 29. CONSUMO MÉDIO DOS CAMINHÕES
SELECT
    c.id_caminhao,
    c.placa,
    ROUND(
        (MAX(a.km_odometro) - MIN(a.km_odometro))
        / NULLIF(SUM(a.litros), 0),
        2
    ) AS consumo_estimado_km_l
FROM caminhoes c
INNER JOIN abastecimentos a ON a.id_caminhao = c.id_caminhao
GROUP BY c.id_caminhao, c.placa
HAVING COUNT(a.id_abastecimento) >= 2;

-- 30. CUSTO OPERACIONAL POR CAMINHÃO
SELECT
    c.id_caminhao,
    c.placa,
    c.modelo,
    COALESCE((
        SELECT SUM(a.valor_total)
        FROM abastecimentos a
        WHERE a.id_caminhao = c.id_caminhao
    ), 0) AS custo_combustivel,
    COALESCE((
        SELECT SUM(m.custo)
        FROM manutencoes m
        WHERE m.id_caminhao = c.id_caminhao
    ), 0) AS custo_manutencao,
    COALESCE((
        SELECT SUM(a.valor_total)
        FROM abastecimentos a
        WHERE a.id_caminhao = c.id_caminhao
    ), 0)
    +
    COALESCE((
        SELECT SUM(m.custo)
        FROM manutencoes m
        WHERE m.id_caminhao = c.id_caminhao
    ), 0) AS custo_operacional_total
FROM caminhoes c
ORDER BY custo_operacional_total DESC;

-- 31. RESUMO GERAL
SELECT
    (SELECT COUNT(*) FROM clientes_b2b) AS total_clientes,
    (SELECT COUNT(*) FROM motoristas) AS total_motoristas,
    (SELECT COUNT(*) FROM caminhoes) AS total_caminhoes,
    (SELECT COUNT(*) FROM rotas) AS total_rotas,
    (SELECT COUNT(*) FROM entregas) AS total_entregas,
    (SELECT COUNT(*) FROM manutencoes) AS total_manutencoes,
    (SELECT COUNT(*) FROM abastecimentos) AS total_abastecimentos;

-- 32. RESUMO FINANCEIRO
SELECT
    COALESCE((
        SELECT SUM(valor_frete)
        FROM entregas
        WHERE status <> 'CANCELADA'
    ), 0) AS receita_fretes,
    COALESCE((
        SELECT SUM(valor_total)
        FROM abastecimentos
    ), 0) AS gasto_combustivel,
    COALESCE((
        SELECT SUM(custo)
        FROM manutencoes
    ), 0) AS gasto_manutencoes,
    COALESCE((
        SELECT SUM(valor_frete)
        FROM entregas
        WHERE status <> 'CANCELADA'
    ), 0)
    -
    (
        COALESCE((SELECT SUM(valor_total) FROM abastecimentos), 0)
        +
        COALESCE((SELECT SUM(custo) FROM manutencoes), 0)
    ) AS resultado_operacional;