CREATE DATABASE TuneStream;
USE TuneStream;

CREATE TABLE Utilizador(
    IdUtilizador INT PRIMARY KEY AUTO_INCREMENT,
    NomeUtilizador VARCHAR(100),
    EmailUtilizador VARCHAR(150),
    SenhaUtilizador VARCHAR(255),
    TipoConta VARCHAR(20),
    DataRegistro DATE
);

CREATE TABLE Subscricao(
    IdSubscricao INT PRIMARY KEY AUTO_INCREMENT,
    IdUtilizador INT,
    TipoPlano VARCHAR(20),
    DataInicio DATE,
    DataFim DATE,
    ValorSubscricao DECIMAL,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE Artista(
    IdArtista INT PRIMARY KEY AUTO_INCREMENT,
    NomeArtista VARCHAR(100),
    BiografiaArtista VARCHAR(1000),
    PaisArtista VARCHAR(60)
);

CREATE TABLE Album(
    IdAlbum INT PRIMARY KEY AUTO_INCREMENT,
    IdArtista INT,
    TituloAlbum VARCHAR(150),
    DataLancamento DATE,
    GeneroAlbum VARCHAR(50),
    FOREIGN KEY (IdArtista) REFERENCES Artista(IdArtista)
);

CREATE TABLE Musica(
    IdMusica INT PRIMARY KEY AUTO_INCREMENT,
    IdAlbum INT,
    TituloMusica VARCHAR(150),
    DuracaoSegundos INT,
    TipoMusica VARCHAR(20),
    FOREIGN KEY (IdAlbum) REFERENCES Album(IdAlbum)
);

CREATE TABLE Playlist(
    IdPlaylist INT PRIMARY KEY AUTO_INCREMENT,
    IdUtilizador INT,
    NomePlaylist VARCHAR(100),
    DataCriacao DATE,
    PlaylistPublica BOOLEAN,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE PlaylistMusica(
    IdPlaylist INT,
    IdMusica INT,
    DataAdicionado DATE,
    OrdemMusica INT,
    PRIMARY KEY (IdPlaylist, IdMusica),
    FOREIGN KEY (IdPlaylist) REFERENCES Playlist(IdPlaylist),
    FOREIGN KEY (IdMusica) REFERENCES Musica(IdMusica)
);

CREATE TABLE HistoricoReproducao(
    IdHistorico INT PRIMARY KEY AUTO_INCREMENT,
    IdUtilizador INT,
    IdMusica INT,
    DataHora DATETIME,
    DuracaoOuvida INT,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador),
    FOREIGN KEY (IdMusica) REFERENCES Musica(IdMusica)
);

CREATE TABLE PagamentoRoyalties(
    IdPagamento INT PRIMARY KEY AUTO_INCREMENT,
    IdArtista INT,
    IdMusica INT,
    PeriodoReferencia VARCHAR(20),
    NumeroReproducoes INT,
    ValorPago DECIMAL(10,2),
    DataPagamento DATE,
    FOREIGN KEY (IdArtista) REFERENCES Artista(IdArtista),
    FOREIGN KEY (IdMusica) REFERENCES Musica(IdMusica)
);

 
-- Utilizador: registra o último acesso do utilizador
ALTER TABLE Utilizador
    ADD COLUMN UltimoLogin DATETIME NULL;
 
-- Subscricao: status atual da subscrição (Ativa, Expirada, Cancelada)
ALTER TABLE Subscricao
    ADD COLUMN StatusSubscricao VARCHAR(20) DEFAULT 'Ativa';
 
-- Artista: indica se o perfil do artista é verificado
ALTER TABLE Artista
    ADD COLUMN Verificado BOOLEAN DEFAULT FALSE;
 
-- Album: total de faixas do álbum (mantido em cache/atualizado por procedure)
ALTER TABLE Album
    ADD COLUMN TotalFaixas INT DEFAULT 0;
 
-- Musica: indica se a faixa possui conteúdo explícito
ALTER TABLE Musica
    ADD COLUMN ConteudoExplicito BOOLEAN DEFAULT FALSE;
 
-- Playlist: total de reproduções acumuladas da playlist
ALTER TABLE Playlist
    ADD COLUMN TotalReproducoes INT DEFAULT 0;
 
-- PlaylistMusica: marca se a faixa foi destacada como favorita na playlist
ALTER TABLE PlaylistMusica
    ADD COLUMN Favorita BOOLEAN DEFAULT FALSE;
 
-- HistoricoReproducao: dispositivo utilizado na reprodução
ALTER TABLE HistoricoReproducao
    ADD COLUMN Dispositivo VARCHAR(50) NULL;
 
-- PagamentoRoyalties: status do pagamento (Pago, Pendente, Estornado)
ALTER TABLE PagamentoRoyalties
    ADD COLUMN StatusPagamento VARCHAR(20) DEFAULT 'Pago';


-- =====================================================================
-- Utilizador
-- =====================================================================
INSERT INTO Utilizador (NomeUtilizador, EmailUtilizador, SenhaUtilizador, TipoConta, DataRegistro) VALUES
('Joao Silva', 'joao.silva@email.com', 'hash_senha_001', 'premium', '2024-01-15'),
('Maria Santos', 'maria.santos@email.com', 'hash_senha_002', 'free', '2024-02-10'),
('Carlos Oliveira', 'carlos.oliveira@email.com', 'hash_senha_003', 'premium', '2024-03-05'),
('Ana Costa', 'ana.costa@email.com', 'hash_senha_004', 'free', '2024-04-20'),
('Pedro Almeida', 'pedro.almeida@email.com', 'hash_senha_005', 'premium', '2024-05-01');


INSERT INTO Subscricao (IdUtilizador, TipoPlano, DataInicio, DataFim, ValorSubscricao) VALUES
(1, 'mensal', '2024-01-15', '2024-02-15', 9.99),
(3, 'anual', '2024-03-05', '2025-03-05', 89.99),
(5, 'mensal', '2024-05-01', '2024-06-01', 9.99);

INSERT INTO Artista (NomeArtista, BiografiaArtista, PaisArtista) VALUES
('Luana Prado', 'Cantora e compositora conhecida pelo estilo pop intimista.', 'Brasil'),
('The Sound Waves', 'Banda de rock formada em 2015, referencia da cena indie.', 'Estados Unidos'),
('Mariana Duarte', 'Fadista contemporanea com foco na renovacao do genero.', 'Portugal'),
('Rui Fernandes', 'Musico de MPB com carreira iniciada nos anos 2000.', 'Portugal');

INSERT INTO Album (IdArtista, TituloAlbum, DataLancamento, GeneroAlbum) VALUES
(1, 'Horizonte', '2022-06-10', 'Pop'),
(2, 'Electric Nights', '2021-11-05', 'Rock'),
(3, 'Raizes', '2023-02-18', 'Fado'),
(4, 'Manhas de Verao', '2020-07-22', 'MPB'),
(1, 'Reflexos', '2024-01-30', 'Pop');

INSERT INTO Musica (IdAlbum, TituloMusica, DuracaoSegundos, TipoMusica) VALUES
(1, 'Amanhecer', 210, 'musica'),
(1, 'Distante', 195, 'musica'),
(2, 'Night Drive', 240, 'musica'),
(2, 'Neon', 180, 'musica'),
(3, 'Fado do Rio', 260, 'musica'),
(4, 'Verao sem Fim', 200, 'musica'),
(5, 'Espelho', 190, 'musica'),
(3, 'Episodio 1 - Conversa sobre Fado', 1800, 'episodio_podcast');

INSERT INTO Playlist (IdUtilizador, NomePlaylist, DataCriacao, PlaylistPublica) VALUES
(1, 'Favoritas', '2024-01-20', TRUE),
(2, 'Treino', '2024-02-15', FALSE),
(3, 'Relax', '2024-03-10', TRUE),
(1, 'Podcasts', '2024-04-01', FALSE);

INSERT INTO PlaylistMusica (IdPlaylist, IdMusica, DataAdicionado, OrdemMusica) VALUES
(1, 1, '2024-01-20', 1),
(1, 3, '2024-01-21', 2),
(1, 7, '2024-01-22', 3),
(2, 4, '2024-02-16', 1),
(2, 6, '2024-02-17', 2),
(3, 5, '2024-03-11', 1),
(3, 2, '2024-03-12', 2),
(4, 8, '2024-04-02', 1);

INSERT INTO HistoricoReproducao (IdUtilizador, IdMusica, DataHora, DuracaoOuvida) VALUES
(1, 1, '2024-06-01 08:30:00', 210),
(1, 3, '2024-06-01 09:00:00', 240),
(2, 4, '2024-06-02 14:15:00', 150),
(3, 5, '2024-06-02 20:00:00', 260),
(4, 6, '2024-06-03 07:45:00', 200),
(5, 7, '2024-06-03 12:10:00', 190),
(1, 8, '2024-06-04 18:00:00', 1800),
(3, 2, '2024-06-04 21:30:00', 195);

INSERT INTO PagamentoRoyalties (IdArtista, IdMusica, PeriodoReferencia, NumeroReproducoes, ValorPago, DataPagamento) VALUES
(1, 1, '2024-05', 15000, 450.00, '2024-06-05'),
(1, 2, '2024-05', 9800, 294.00, '2024-06-05'),
(2, 3, '2024-05', 22000, 660.00, '2024-06-05'),
(3, 5, '2024-05', 5000, 150.00, '2024-06-05'),
(4, 6, '2024-05', 7000, 210.00, '2024-06-05'),
(1, 7, '2024-05', 11000, 330.00, '2024-06-05');

 
