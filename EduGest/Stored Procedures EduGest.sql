USE escola_academica;

DELIMITER $$

-- =========================================================
-- 1. CURSO
-- =========================================================
CREATE PROCEDURE sp_detalhes_curso(
    IN p_curso_id INT
)
BEGIN
    SELECT
        c.curso_id,
        c.nome AS curso,
        c.codigo,
        c.carga_horaria,
        c.nivel,
        c.modalidade,
        COUNT(a.aluno_id) AS quantidade_alunos
    FROM curso c
    LEFT JOIN aluno a
        ON c.curso_id = a.curso_id
    WHERE c.curso_id = p_curso_id
    GROUP BY
        c.curso_id,
        c.nome,
        c.codigo,
        c.carga_horaria,
        c.nivel,
        c.modalidade;
END $$


-- =========================================================
-- 2. ALUNO
-- =========================================================
CREATE PROCEDURE sp_historico_aluno(
    IN p_aluno_id INT
)
BEGIN
    SELECT
        a.aluno_id,
        a.nome AS aluno,
        a.email,
        a.telefone,
        a.status,
        c.nome AS curso,
        COUNT(DISTINCT m.matricula_id) AS quantidade_disciplinas,
        COALESCE(SUM(f.aulas_perdidas), 0) AS total_faltas
    FROM aluno a
    INNER JOIN curso c
        ON a.curso_id = c.curso_id
    LEFT JOIN matricula m
        ON a.aluno_id = m.aluno_id
    LEFT JOIN falta f
        ON m.matricula_id = f.matricula_id
    WHERE a.aluno_id = p_aluno_id
    GROUP BY
        a.aluno_id,
        a.nome,
        a.email,
        a.telefone,
        a.status,
        c.nome;
END $$


-- =========================================================
-- 3. PROFESSOR
-- =========================================================
CREATE PROCEDURE sp_detalhes_professor(
    IN p_professor_id INT
)
BEGIN
    SELECT
        professor_id,
        nome,
        email,
        cpf,
        area,
        status,
        telefone
    FROM professor
    WHERE professor_id = p_professor_id;
END $$


-- =========================================================
-- 4. DISCIPLINA
-- =========================================================
CREATE PROCEDURE sp_detalhes_disciplina(
    IN p_disciplina_id INT
)
BEGIN
    SELECT
        d.disciplina_id,
        d.nome AS disciplina,
        d.codigo,
        d.carga_horaria,
        d.semestre,
        c.nome AS curso,
        c.nivel
    FROM disciplina d
    INNER JOIN curso c
        ON d.curso_id = c.curso_id
    WHERE d.disciplina_id = p_disciplina_id;
END $$


-- =========================================================
-- 5. MATRICULA
-- =========================================================
CREATE PROCEDURE sp_detalhes_matricula(
    IN p_matricula_id INT
)
BEGIN
    SELECT
        m.matricula_id,
        a.nome AS aluno,
        d.nome AS disciplina,
        d.codigo AS codigo_disciplina,
        m.data_matricula,
        m.situacao,
        m.observacao,
        c.nome AS curso
    FROM matricula m
    INNER JOIN aluno a
        ON m.aluno_id = a.aluno_id
    INNER JOIN disciplina d
        ON m.disciplina_id = d.disciplina_id
    INNER JOIN curso c
        ON a.curso_id = c.curso_id
    WHERE m.matricula_id = p_matricula_id;
END $$


-- =========================================================
-- 6. NOTA
-- =========================================================
CREATE PROCEDURE sp_media_aluno(
    IN p_matricula_id INT
)
BEGIN
    SELECT
        m.matricula_id,
        a.nome AS aluno,
        d.nome AS disciplina,
        COALESCE(
            SUM(n.valor * n.peso) / NULLIF(SUM(n.peso), 0),
            0
        ) AS media_ponderada,
        COUNT(n.nota_id) AS quantidade_avaliacoes
    FROM matricula m
    INNER JOIN aluno a
        ON m.aluno_id = a.aluno_id
    INNER JOIN disciplina d
        ON m.disciplina_id = d.disciplina_id
    LEFT JOIN nota n
        ON m.matricula_id = n.matricula_id
    WHERE m.matricula_id = p_matricula_id
    GROUP BY
        m.matricula_id,
        a.nome,
        d.nome;
END $$


-- =========================================================
-- 7. FALTA
-- =========================================================
CREATE PROCEDURE sp_frequencia_aluno(
    IN p_matricula_id INT
)
BEGIN
    SELECT
        m.matricula_id,
        a.nome AS aluno,
        d.nome AS disciplina,
        COALESCE(SUM(f.aulas_perdidas), 0) AS total_aulas_perdidas,
        SUM(
            CASE
                WHEN f.abono = TRUE THEN f.aulas_perdidas
                ELSE 0
            END
        ) AS faltas_abonadas,
        SUM(
            CASE
                WHEN f.abono = FALSE THEN f.aulas_perdidas
                ELSE 0
            END
        ) AS faltas_nao_abonadas
    FROM matricula m
    INNER JOIN aluno a
        ON m.aluno_id = a.aluno_id
    INNER JOIN disciplina d
        ON m.disciplina_id = d.disciplina_id
    LEFT JOIN falta f
        ON m.matricula_id = f.matricula_id
    WHERE m.matricula_id = p_matricula_id
    GROUP BY
        m.matricula_id,
        a.nome,
        d.nome;
END $$


-- =========================================================
-- 8. MENSALIDADE
-- =========================================================
CREATE PROCEDURE sp_financeiro_aluno(
    IN p_aluno_id INT
)
BEGIN
    SELECT
        m.mensalidade_id,
        a.nome AS aluno,
        m.competencia,
        m.valor,
        m.desconto,
        (
            m.valor - COALESCE(m.desconto, 0)
        ) AS valor_com_desconto,
        m.vencimento,
        m.status
    FROM mensalidade m
    INNER JOIN aluno a
        ON m.aluno_id = a.aluno_id
    WHERE m.aluno_id = p_aluno_id
    ORDER BY m.vencimento DESC;
END $$


-- =========================================================
-- 9. PAGAMENTO
-- =========================================================
CREATE PROCEDURE sp_pagamento_mensalidade(
    IN p_mensalidade_id INT
)
BEGIN
    SELECT
        pg.pagamento_id,
        pg.mensalidade_id,
        a.nome AS aluno,
        m.competencia,
        m.valor AS valor_mensalidade,
        pg.valor_pago,
        pg.data_pagamento,
        pg.metodo,
        pg.status_pagamento,
        (
            m.valor - pg.valor_pago
        ) AS valor_pendente
    FROM pagamento pg
    INNER JOIN mensalidade m
        ON pg.mensalidade_id = m.mensalidade_id
    INNER JOIN aluno a
        ON m.aluno_id = a.aluno_id
    WHERE pg.mensalidade_id = p_mensalidade_id
    ORDER BY pg.data_pagamento DESC;
END $$

DELIMITER ;