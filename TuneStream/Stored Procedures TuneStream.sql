DROP PROCEDURE IF EXISTS sp_RegistrarUtilizador;
DROP PROCEDURE IF EXISTS sp_RenovarSubscricao;
DROP PROCEDURE IF EXISTS sp_CadastrarArtista;
DROP PROCEDURE IF EXISTS sp_CadastrarAlbum;
DROP PROCEDURE IF EXISTS sp_AdicionarMusica;
DROP PROCEDURE IF EXISTS sp_CriarPlaylist;
DROP PROCEDURE IF EXISTS sp_AdicionarMusicaPlaylist;
DROP PROCEDURE IF EXISTS sp_RegistrarReproducao;
DROP PROCEDURE IF EXISTS sp_ProcessarPagamentoRoyalties;
 
DELIMITER $$
 
-- ---------------------------------------------------------------------
-- 1) Utilizador: regista um novo utilizador, validando e-mail duplicado
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RegistrarUtilizador(
    IN  p_Nome           VARCHAR(100),
    IN  p_Email          VARCHAR(150),
    IN  p_Senha          VARCHAR(255),
    IN  p_TipoConta      VARCHAR(20),
    OUT p_IdUtilizador   INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Utilizador WHERE EmailUtilizador = p_Email) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe um utilizador com este e-mail.';
    ELSE
        INSERT INTO Utilizador (NomeUtilizador, EmailUtilizador, SenhaUtilizador, TipoConta, DataRegistro, UltimoLogin)
        VALUES (p_Nome, p_Email, p_Senha, p_TipoConta, CURDATE(), NOW());
 
        SET p_IdUtilizador = LAST_INSERT_ID();
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 2) Subscricao: renova/cria subscrição, expira a anterior e calcula
--    a data de fim conforme o tipo de plano
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RenovarSubscricao(
    IN p_IdUtilizador     INT,
    IN p_TipoPlano        VARCHAR(20),
    IN p_ValorSubscricao  DECIMAL(10,2)
)
BEGIN
    DECLARE v_DataFim DATE;
 
    IF NOT EXISTS (SELECT 1 FROM Utilizador WHERE IdUtilizador = p_IdUtilizador) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Utilizador não encontrado.';
    ELSE
        -- Expira quaisquer subscrições ativas anteriores
        UPDATE Subscricao
        SET StatusSubscricao = 'Expirada'
        WHERE IdUtilizador = p_IdUtilizador
          AND StatusSubscricao = 'Ativa';
 
        IF p_TipoPlano = 'mensal' THEN
            SET v_DataFim = DATE_ADD(CURDATE(), INTERVAL 1 MONTH);
        ELSEIF p_TipoPlano = 'anual' THEN
            SET v_DataFim = DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
        ELSE
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Tipo de plano inválido. Utilize "mensal" ou "anual".';
        END IF;
 
        INSERT INTO Subscricao (IdUtilizador, TipoPlano, DataInicio, DataFim, ValorSubscricao, StatusSubscricao)
        VALUES (p_IdUtilizador, p_TipoPlano, CURDATE(), v_DataFim, p_ValorSubscricao, 'Ativa');
 
        UPDATE Utilizador SET TipoConta = 'premium' WHERE IdUtilizador = p_IdUtilizador;
 
        SELECT LAST_INSERT_ID() AS IdSubscricaoGerada, v_DataFim AS DataFimCalculada;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 3) Artista: cadastra artista evitando duplicidade (nome + país)
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_CadastrarArtista(
    IN  p_Nome        VARCHAR(100),
    IN  p_Biografia   VARCHAR(1000),
    IN  p_Pais        VARCHAR(60),
    OUT p_IdArtista   INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Artista WHERE NomeArtista = p_Nome AND PaisArtista = p_Pais) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe um artista com este nome neste país.';
    ELSE
        INSERT INTO Artista (NomeArtista, BiografiaArtista, PaisArtista, Verificado)
        VALUES (p_Nome, p_Biografia, p_Pais, FALSE);
 
        SET p_IdArtista = LAST_INSERT_ID();
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 4) Album: cadastra álbum validando existência do artista
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_CadastrarAlbum(
    IN p_IdArtista       INT,
    IN p_Titulo          VARCHAR(150),
    IN p_DataLancamento  DATE,
    IN p_Genero          VARCHAR(50)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Artista WHERE IdArtista = p_IdArtista) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Artista não encontrado.';
    ELSE
        INSERT INTO Album (IdArtista, TituloAlbum, DataLancamento, GeneroAlbum, TotalFaixas)
        VALUES (p_IdArtista, p_Titulo, p_DataLancamento, p_Genero, 0);
 
        SELECT LAST_INSERT_ID() AS IdAlbumGerado;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 5) Musica: adiciona faixa a um álbum e atualiza o total de faixas
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_AdicionarMusica(
    IN p_IdAlbum     INT,
    IN p_Titulo      VARCHAR(150),
    IN p_Duracao     INT,
    IN p_Tipo        VARCHAR(20),
    IN p_Explicito   BOOLEAN
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Album WHERE IdAlbum = p_IdAlbum) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Álbum não encontrado.';
    ELSEIF p_Duracao <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A duração da música deve ser maior que zero.';
    ELSE
        INSERT INTO Musica (IdAlbum, TituloMusica, DuracaoSegundos, TipoMusica, ConteudoExplicito)
        VALUES (p_IdAlbum, p_Titulo, p_Duracao, p_Tipo, p_Explicito);
 
        UPDATE Album SET TotalFaixas = TotalFaixas + 1 WHERE IdAlbum = p_IdAlbum;
 
        SELECT LAST_INSERT_ID() AS IdMusicaGerada;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 6) Playlist: cria playlist evitando nomes duplicados para o mesmo
--    utilizador
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_CriarPlaylist(
    IN p_IdUtilizador  INT,
    IN p_Nome          VARCHAR(100),
    IN p_Publica       BOOLEAN
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Utilizador WHERE IdUtilizador = p_IdUtilizador) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Utilizador não encontrado.';
    ELSEIF EXISTS (
        SELECT 1 FROM Playlist WHERE IdUtilizador = p_IdUtilizador AND NomePlaylist = p_Nome
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Este utilizador já possui uma playlist com este nome.';
    ELSE
        INSERT INTO Playlist (IdUtilizador, NomePlaylist, DataCriacao, PlaylistPublica, TotalReproducoes)
        VALUES (p_IdUtilizador, p_Nome, CURDATE(), p_Publica, 0);
 
        SELECT LAST_INSERT_ID() AS IdPlaylistGerada;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 7) PlaylistMusica: adiciona música à playlist, evitando duplicidade
--    e calculando automaticamente a próxima posição (OrdemMusica)
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_AdicionarMusicaPlaylist(
    IN p_IdPlaylist  INT,
    IN p_IdMusica    INT
)
BEGIN
    DECLARE v_ProximaOrdem INT;
 
    IF EXISTS (
        SELECT 1 FROM PlaylistMusica WHERE IdPlaylist = p_IdPlaylist AND IdMusica = p_IdMusica
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Esta música já está nesta playlist.';
    ELSE
        SELECT IFNULL(MAX(OrdemMusica), 0) + 1 INTO v_ProximaOrdem
        FROM PlaylistMusica
        WHERE IdPlaylist = p_IdPlaylist;
 
        INSERT INTO PlaylistMusica (IdPlaylist, IdMusica, DataAdicionado, OrdemMusica, Favorita)
        VALUES (p_IdPlaylist, p_IdMusica, CURDATE(), v_ProximaOrdem, FALSE);
 
        SELECT v_ProximaOrdem AS OrdemAtribuida;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 8) HistoricoReproducao: regista uma reprodução, validando a duração
--    ouvida e classificando como completa ou parcial
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_RegistrarReproducao(
    IN p_IdUtilizador   INT,
    IN p_IdMusica       INT,
    IN p_DuracaoOuvida  INT,
    IN p_Dispositivo    VARCHAR(50)
)
BEGIN
    DECLARE v_DuracaoTotal INT;
 
    SELECT DuracaoSegundos INTO v_DuracaoTotal
    FROM Musica
    WHERE IdMusica = p_IdMusica;
 
    IF v_DuracaoTotal IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Música não encontrada.';
    ELSEIF p_DuracaoOuvida > v_DuracaoTotal THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A duração ouvida não pode ser maior que a duração da música.';
    ELSE
        INSERT INTO HistoricoReproducao (IdUtilizador, IdMusica, DataHora, DuracaoOuvida, Dispositivo)
        VALUES (p_IdUtilizador, p_IdMusica, NOW(), p_DuracaoOuvida, p_Dispositivo);
 
        -- Considera reprodução "Completa" quando ouviu >= 80% da faixa
        SELECT
            LAST_INSERT_ID() AS IdHistoricoGerado,
            IF(p_DuracaoOuvida >= v_DuracaoTotal * 0.8, 'Completa', 'Parcial') AS TipoReproducao;
    END IF;
END $$
 
-- ---------------------------------------------------------------------
-- 9) PagamentoRoyalties: calcula reproduções do período a partir do
--    HistoricoReproducao e processa o pagamento, evitando duplicidade
-- ---------------------------------------------------------------------
CREATE PROCEDURE sp_ProcessarPagamentoRoyalties(
    IN p_IdArtista           INT,
    IN p_IdMusica            INT,
    IN p_PeriodoReferencia   VARCHAR(20),   -- formato 'YYYY-MM'
    IN p_ValorPorReproducao  DECIMAL(10,4)
)
BEGIN
    DECLARE v_NumReproducoes INT;
    DECLARE v_ValorPago DECIMAL(10,2);
 
    IF EXISTS (
        SELECT 1 FROM PagamentoRoyalties
        WHERE IdArtista = p_IdArtista
          AND IdMusica = p_IdMusica
          AND PeriodoReferencia = p_PeriodoReferencia
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Já existe pagamento processado para este artista/música/período.';
    ELSE
        SELECT COUNT(*) INTO v_NumReproducoes
        FROM HistoricoReproducao h
        WHERE h.IdMusica = p_IdMusica
          AND DATE_FORMAT(h.DataHora, '%Y-%m') = p_PeriodoReferencia;
 
        SET v_ValorPago = v_NumReproducoes * p_ValorPorReproducao;
 
        INSERT INTO PagamentoRoyalties
            (IdArtista, IdMusica, PeriodoReferencia, NumeroReproducoes, ValorPago, DataPagamento, StatusPagamento)
        VALUES
            (p_IdArtista, p_IdMusica, p_PeriodoReferencia, v_NumReproducoes, v_ValorPago, CURDATE(), 'Pago');
 
        SELECT
            LAST_INSERT_ID() AS IdPagamentoGerado,
            v_NumReproducoes AS Reproducoes,
            v_ValorPago AS ValorCalculado;
    END IF;
END $$
 
DELIMITER ;
 