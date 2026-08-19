USE escola_academica;

DELIMITER $$


-- =========================================================
-- 1. TRIGGER - ALUNO
-- Tabela: aluno
--
-- Remove espaços desnecessários do nome e impede
-- o cadastro de um aluno sem nome.
-- =========================================================

CREATE TRIGGER trg_aluno_validar_nome
BEFORE INSERT ON aluno
FOR EACH ROW
BEGIN

    SET NEW.nome = TRIM(NEW.nome);

    IF NEW.nome IS NULL OR NEW.nome = '' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O nome do aluno não pode ficar vazio.';

    END IF;

END $$


-- =========================================================
-- 2. TRIGGER - NOTA
-- Tabela: nota
--
-- Verifica se a nota está entre 0 e 10.
-- Também impede que o peso seja menor ou igual a zero.
-- =========================================================

CREATE TRIGGER trg_nota_validar_valores
BEFORE INSERT ON nota
FOR EACH ROW
BEGIN

    IF NEW.valor < 0 OR NEW.valor > 10 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A nota deve estar entre 0 e 10.';

    END IF;

    IF NEW.peso <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O peso da avaliação deve ser maior que zero.';

    END IF;

END $$


-- =========================================================
-- 3. TRIGGER - MENSALIDADE
-- Tabela: mensalidade
--
-- Define o desconto como 0 caso não seja informado
-- e impede valores negativos.
-- =========================================================

CREATE TRIGGER trg_mensalidade_validar_valores
BEFORE INSERT ON mensalidade
FOR EACH ROW
BEGIN

    IF NEW.valor < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor da mensalidade não pode ser negativo.';

    END IF;

    IF NEW.desconto IS NULL THEN

        SET NEW.desconto = 0.00;

    ELSEIF NEW.desconto < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O desconto não pode ser negativo.';

    ELSEIF NEW.desconto > NEW.valor THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'O desconto não pode ser maior que o valor da mensalidade.';

    END IF;

END $$


DELIMITER ;