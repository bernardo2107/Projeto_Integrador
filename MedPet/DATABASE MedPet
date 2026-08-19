CREATE DATABASE MedPet;
USE MedPet;

CREATE TABLE Dono(
    IdDono INT PRIMARY KEY AUTO_INCREMENT,
    NomeDono VARCHAR(50),
    TelefoneDono VARCHAR(15),
    EmailDono VARCHAR(100),
    EnderecoDono VARCHAR(50)
);

CREATE TABLE Animal(
    IdAnimal INT PRIMARY KEY AUTO_INCREMENT,
    IdDono INT,
    NomeAnimal VARCHAR(50),
    EspecieAnimal VARCHAR(100),
    RacaAnimal VARCHAR(50),
    SexoAnimal VARCHAR(15),
    DataNascimento DATE,
    FOREIGN KEY (IdDono) REFERENCES Dono(IdDono)
);

CREATE TABLE Consulta(
    IdConsulta INT PRIMARY KEY AUTO_INCREMENT,
    IdAnimal INT,
    DataHora DATETIME,
    Motivo VARCHAR(255),
    Diagnostico VARCHAR(255),
    Observacoes TEXT,
    FOREIGN KEY (IdAnimal) REFERENCES Animal(IdAnimal)
);

CREATE TABLE Internamento(
    IdInternamento INT PRIMARY KEY AUTO_INCREMENT,
    IdAnimal INT,
    DataEntrada DATE,
    DataSaida DATE,
    Motivo VARCHAR(255),
    Observacoes TEXT,
    FOREIGN KEY (IdAnimal) REFERENCES Animal(IdAnimal)
);

CREATE TABLE HistoricoMedico(
    IdHistorico INT PRIMARY KEY AUTO_INCREMENT,
    IdAnimal INT,
    ObservacoesGerais VARCHAR(255),
    Alergias VARCHAR(90),
    FOREIGN KEY (IdAnimal) REFERENCES Animal(IdAnimal)
);

CREATE TABLE Fatura(
    IdFatura INT PRIMARY KEY AUTO_INCREMENT,
    IdConsulta INT,
    IdInternamento INT,
    NumeroFatura VARCHAR(50),
    DataEmissao DATE,
    Total DECIMAL(10,2),
    Estado VARCHAR(30),
    FOREIGN KEY (IdConsulta) REFERENCES Consulta(IdConsulta),
    FOREIGN KEY (IdInternamento) REFERENCES Internamento(IdInternamento)
);

CREATE TABLE Vacina(
    IdVacina INT PRIMARY KEY AUTO_INCREMENT,
    IdHistorico INT,
    NomeVacina VARCHAR(50),
    DataAplicacao DATE,
    Lote VARCHAR(80),
    ProximaDose DATE,
    FOREIGN KEY (IdHistorico) REFERENCES HistoricoMedico(IdHistorico)
);

CREATE TABLE Pagamento(
    IdPagamento INT PRIMARY KEY AUTO_INCREMENT,
    IdFatura INT,
    DataPagamento DATE,
    ValorPagamento DECIMAL(10,2),
    MetodoPagamento VARCHAR(50),
    Referencia VARCHAR(100),
    FOREIGN KEY (IdFatura) REFERENCES Fatura(IdFatura)
);

 
-- Dono: data em que o dono foi cadastrado no sistema
ALTER TABLE Dono
    ADD COLUMN DataCadastro DATE DEFAULT (CURRENT_DATE);
 
-- Animal: peso do animal (kg), útil para dosagens e histórico clínico
ALTER TABLE Animal
    ADD COLUMN Peso DECIMAL(5,2) NULL;
 
-- Consulta: veterinário responsável pelo atendimento
ALTER TABLE Consulta
    ADD COLUMN Veterinario VARCHAR(100) NULL;
 
-- Internamento: custo diário do internamento
ALTER TABLE Internamento
    ADD COLUMN CustoDiario DECIMAL(10,2) NULL;
 
-- HistoricoMedico: data da última atualização do histórico
ALTER TABLE HistoricoMedico
    ADD COLUMN DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP;
 
-- Fatura: data de vencimento da fatura
ALTER TABLE Fatura
    ADD COLUMN DataVencimento DATE NULL;
 
-- Vacina: veterinário responsável pela aplicação
ALTER TABLE Vacina
    ADD COLUMN Veterinario VARCHAR(100) NULL;
 
-- Pagamento: status detalhado do pagamento (ex: Confirmado, Estornado)
ALTER TABLE Pagamento
    ADD COLUMN StatusPagamento VARCHAR(30) DEFAULT 'Confirmado';
 
USE MedPet;

-- ================= DONO =================
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Ana Silva', '(31) 92824-1409', 'ana.silva1@email.com', 'Rua São José, 260');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Bruno Costa', '(31) 94657-3286', 'bruno.costa2@email.com', 'Av. Central, 702');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Carla Mendes', '(31) 99935-2424', 'carla.mendes3@email.com', 'Rua das Palmeiras, 442');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Daniel Alves', '(31) 91520-1488', 'daniel.alves4@email.com', 'Av. Central, 233');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Eduarda Rocha', '(31) 94811-9279', 'eduarda.rocha5@email.com', 'Rua das Palmeiras, 37');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Fábio Nunes', '(31) 94257-9928', 'fabio.nunes6@email.com', 'Rua da Liberdade, 235');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Gabriela Lima', '(31) 98359-5557', 'gabriela.lima7@email.com', 'Rua das Flores, 787');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Hugo Ferreira', '(31) 93615-7924', 'hugo.ferreira8@email.com', 'Av. Brasil, 294');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Inês Carvalho', '(31) 93547-4527', 'inês.carvalho9@email.com', 'Av. Brasil, 114');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('João Pereira', '(31) 92519-7224', 'joao.pereira10@email.com', 'Av. Central, 377');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Karina Souza', '(31) 96635-5333', 'karina.souza11@email.com', 'Rua das Flores, 757');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Leonardo Dias', '(31) 98527-9785', 'leonardo.dias12@email.com', 'Av. Central, 954');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Mariana Gomes', '(31) 97201-2291', 'mariana.gomes13@email.com', 'Rua XV de Novembro, 310');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Nuno Ribeiro', '(31) 96925-4150', 'nuno.ribeiro14@email.com', 'Av. Central, 56');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Otávio Santos', '(31) 94733-5741', 'otavio.santos15@email.com', 'Av. Central, 885');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Paula Martins', '(31) 94814-2654', 'paula.martins16@email.com', 'Rua da Liberdade, 294');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Quintino Barros', '(31) 98428-6977', 'quintino.barros17@email.com', 'Rua do Comércio, 389');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Rita Fonseca', '(31) 96820-4432', 'rita.fonseca18@email.com', 'Rua São José, 728');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Sérgio Teixeira', '(31) 92169-3803', 'sergio.teixeira19@email.com', 'Rua XV de Novembro, 756');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Tânia Cardoso', '(31) 95010-3677', 'tânia.cardoso20@email.com', 'Alameda Santos, 398');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Ulisses Moreira', '(31) 95422-4598', 'ulisses.moreira21@email.com', 'Av. Brasil, 873');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Vera Pinto', '(31) 91916-4752', 'vera.pinto22@email.com', 'Rua das Flores, 834');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('William Castro', '(31) 96168-7572', 'william.castro23@email.com', 'Rua São José, 77');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Ximena Duarte', '(31) 94456-6155', 'ximena.duarte24@email.com', 'Travessa da Paz, 681');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Yara Correia', '(31) 99179-7482', 'yara.correia25@email.com', 'Alameda Santos, 156');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Zeca Almeida', '(31) 95339-3287', 'zeca.almeida26@email.com', 'Travessa da Paz, 772');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Adriana Reis', '(31) 99830-5304', 'adriana.reis27@email.com', 'Rua das Palmeiras, 448');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Bernardo Vieira', '(31) 97543-6930', 'bernardo.vieira28@email.com', 'Travessa da Paz, 151');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Cátia Lopes', '(31) 99348-9085', 'catia.lopes29@email.com', 'Av. Central, 783');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Diogo Marques', '(31) 91771-2796', 'diogo.marques30@email.com', 'Rua do Comércio, 652');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Elisa Batista', '(31) 93621-7916', 'elisa.batista31@email.com', 'Rua das Palmeiras, 75');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Filipe Cunha', '(31) 97304-7252', 'filipe.cunha32@email.com', 'Rua das Palmeiras, 489');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Graça Neves', '(31) 99669-5119', 'graca.neves33@email.com', 'Rua XV de Novembro, 891');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Henrique Sá', '(31) 91188-2876', 'henrique.sa34@email.com', 'Rua XV de Novembro, 778');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Ivone Xavier', '(31) 95371-6573', 'ivone.xavier35@email.com', 'Av. Central, 310');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('José Antunes', '(31) 98123-3591', 'jose.antunes36@email.com', 'Alameda Santos, 13');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Luísa Campos', '(31) 95315-9201', 'luisa.campos37@email.com', 'Rua do Comércio, 529');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Marcelo Freitas', '(31) 92743-5889', 'marcelo.freitas38@email.com', 'Rua XV de Novembro, 633');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Natália Borges', '(31) 94258-3504', 'natalia.borges39@email.com', 'Av. Brasil, 790');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Orlando Machado', '(31) 93646-9837', 'orlando.machado40@email.com', 'Rua XV de Novembro, 950');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Patrícia Guerra', '(31) 91009-6310', 'patricia.guerra41@email.com', 'Alameda Santos, 29');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Quirino Tavares', '(31) 92832-6947', 'quirino.tavares42@email.com', 'Rua São José, 255');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Raquel Peixoto', '(31) 91949-4946', 'raquel.peixoto43@email.com', 'Rua das Palmeiras, 979');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Simão Coelho', '(31) 92290-2403', 'simao.coelho44@email.com', 'Alameda Santos, 845');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Teresa Amaral', '(31) 92133-9727', 'teresa.amaral45@email.com', 'Rua do Comércio, 141');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Ubaldo Salgado', '(31) 98787-3705', 'ubaldo.salgado46@email.com', 'Rua São José, 550');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Vanessa Brito', '(31) 97932-4470', 'vanessa.brito47@email.com', 'Rua XV de Novembro, 783');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Wesley Pacheco', '(31) 94295-6107', 'wesley.pacheco48@email.com', 'Rua da Liberdade, 697');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Xavier Monteiro', '(31) 97118-8177', 'xavier.monteiro49@email.com', 'Rua XV de Novembro, 472');
INSERT INTO Dono (NomeDono, TelefoneDono, EmailDono, EnderecoDono) VALUES ('Yasmin Rosa', '(31) 92982-5061', 'yasmin.rosa50@email.com', 'Travessa da Paz, 75');

-- ================= ANIMAL =================
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (22, 'Rex', 'Cão', 'Pastor Alemão', 'Macho', '2015-02-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (41, 'Mia', 'Cão', 'Pastor Alemão', 'Macho', '2015-06-03');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (33, 'Thor', 'Gato', 'Maine Coon', 'Fêmea', '2018-09-05');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (47, 'Luna', 'Papagaio', 'SRD', 'Fêmea', '2018-08-26');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (27, 'Bidu', 'Gato', 'Persa', 'Macho', '2025-07-12');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (28, 'Nina', 'Hamster', 'SRD', 'Fêmea', '2015-11-21');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (42, 'Max', 'Cão', 'Labrador', 'Fêmea', '2020-02-08');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (13, 'Bella', 'Gato', 'Angorá', 'Fêmea', '2017-07-06');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (18, 'Bob', 'Hamster', 'SRD', 'Macho', '2016-08-26');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (36, 'Lola', 'Cão', 'Labrador', 'Macho', '2016-04-06');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (27, 'Simba', 'Hamster', 'SRD', 'Fêmea', '2018-07-02');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (11, 'Amora', 'Hamster', 'SRD', 'Macho', '2021-05-26');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (30, 'Zeus', 'Coelho', 'SRD', 'Fêmea', '2023-11-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (32, 'Mel', 'Gato', 'Siamês', 'Fêmea', '2018-01-19');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (48, 'Duke', 'Papagaio', 'SRD', 'Macho', '2020-01-02');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (38, 'Nala', 'Hamster', 'SRD', 'Macho', '2015-09-03');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (12, 'Toby', 'Cão', 'Poodle', 'Macho', '2021-02-19');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (16, 'Kiki', 'Papagaio', 'SRD', 'Macho', '2024-02-14');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (43, 'Bento', 'Papagaio', 'SRD', 'Fêmea', '2019-04-22');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (46, 'Frida', 'Coelho', 'SRD', 'Macho', '2019-07-05');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (43, 'Apolo', 'Tartaruga', 'SRD', 'Fêmea', '2022-06-25');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (5, 'Pandora', 'Cão', 'Golden Retriever', 'Macho', '2016-09-07');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (33, 'Fred', 'Coelho', 'SRD', 'Macho', '2020-02-08');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (24, 'Sofia', 'Coelho', 'SRD', 'Macho', '2022-09-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (20, 'Rocky', 'Papagaio', 'SRD', 'Macho', '2025-09-10');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (43, 'Belinha', 'Cão', 'Bulldog', 'Fêmea', '2016-02-24');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (36, 'Leo', 'Gato', 'Maine Coon', 'Fêmea', '2024-04-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (22, 'Alice', 'Gato', 'Maine Coon', 'Fêmea', '2019-01-03');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (41, 'Bolt', 'Hamster', 'SRD', 'Fêmea', '2015-01-11');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (50, 'Mimi', 'Gato', 'Maine Coon', 'Macho', '2022-09-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (28, 'Pingo', 'Papagaio', 'SRD', 'Macho', '2016-02-23');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (10, 'Chiquinha', 'Papagaio', 'SRD', 'Macho', '2020-10-18');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (10, 'Buddy', 'Hamster', 'SRD', 'Macho', '2015-05-12');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (3, 'Amora', 'Coelho', 'SRD', 'Macho', '2025-04-22');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (7, 'Tom', 'Coelho', 'SRD', 'Fêmea', '2024-12-05');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (16, 'Gata', 'Gato', 'Siamês', 'Fêmea', '2015-03-24');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (22, 'Bill', 'Hamster', 'SRD', 'Macho', '2019-03-26');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (45, 'Princesa', 'Cão', 'Beagle', 'Macho', '2022-04-07');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (30, 'Jack', 'Coelho', 'SRD', 'Fêmea', '2018-04-01');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (43, 'Lili', 'Gato', 'SRD', 'Fêmea', '2019-02-25');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (18, 'Baguera', 'Coelho', 'SRD', 'Fêmea', '2025-09-11');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (2, 'Fofo', 'Cão', 'Shih Tzu', 'Macho', '2024-05-02');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (7, 'Spike', 'Papagaio', 'SRD', 'Fêmea', '2020-12-26');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (21, 'Estrela', 'Hamster', 'SRD', 'Macho', '2021-10-07');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (17, 'Snoopy', 'Cão', 'Beagle', 'Macho', '2023-09-22');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (47, 'Perola', 'Tartaruga', 'SRD', 'Macho', '2020-07-03');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (43, 'Pipoca', 'Coelho', 'SRD', 'Fêmea', '2025-02-24');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (20, 'Trufa', 'Papagaio', 'SRD', 'Fêmea', '2025-07-11');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (26, 'Odin', 'Tartaruga', 'SRD', 'Fêmea', '2023-03-07');
INSERT INTO Animal (IdDono, NomeAnimal, EspecieAnimal, RacaAnimal, SexoAnimal, DataNascimento) VALUES (27, 'Gaia', 'Tartaruga', 'SRD', 'Fêmea', '2025-12-06');

-- ================= CONSULTA =================
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (40, '2025-07-18 08:30:00', 'Ferimento na pata', 'Gastroenterite', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (38, '2025-08-15 15:15:00', 'Tosse persistente', 'Estresse', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (43, '2023-05-17 18:30:00', 'Vacinação', 'Artrose', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (44, '2025-04-26 11:15:00', 'Consulta de rotina', 'Saudável', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (31, '2023-08-14 18:15:00', 'Exame de sangue', 'Insuficiência renal leve', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (32, '2026-04-05 18:00:00', 'Conjuntivite', 'Obesidade', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (50, '2026-04-06 16:45:00', 'Consulta de rotina', 'Sem alterações', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (8, '2026-03-26 15:30:00', 'Castração - avaliação', 'Parasitose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (40, '2026-09-15 10:45:00', 'Avaliação pós-cirúrgica', 'Otite externa', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (41, '2025-09-16 18:15:00', 'Ferimento na pata', 'Estresse', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (46, '2025-04-09 13:30:00', 'Conjuntivite', 'Sem alterações', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (9, '2024-04-13 10:15:00', 'Vacinação', 'Verminose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (22, '2026-07-02 11:45:00', 'Dor abdominal', 'Parasitose', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (49, '2026-08-01 13:30:00', 'Castração - avaliação', 'Verminose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (35, '2024-08-08 12:45:00', 'Avaliação pós-cirúrgica', 'Saudável', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (22, '2026-12-06 15:15:00', 'Perda de apetite', 'Sem alterações', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (26, '2023-02-21 14:15:00', 'Febre', 'Estresse', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (4, '2025-07-11 11:45:00', 'Dermatite', 'Dermatite atópica', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (18, '2026-05-27 09:45:00', 'Consulta de rotina', 'Insuficiência renal leve', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (23, '2024-11-03 18:00:00', 'Castração - avaliação', 'Saudável', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (13, '2023-10-05 11:15:00', 'Avaliação pós-cirúrgica', 'Conjuntivite viral', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (37, '2024-08-23 12:30:00', 'Vômito e diarreia', 'Fratura leve', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (50, '2024-05-04 17:00:00', 'Conjuntivite', 'Otite externa', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (26, '2024-02-19 18:15:00', 'Vacinação', 'Insuficiência renal leve', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (44, '2023-10-26 08:30:00', 'Tosse persistente', 'Verminose', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (5, '2025-01-28 14:45:00', 'Vacinação', 'Verminose', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (41, '2026-12-05 14:15:00', 'Exame de sangue', 'Sem alterações', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (40, '2026-08-14 17:30:00', 'Dermatite', 'Artrose', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (6, '2025-08-08 15:45:00', 'Dermatite', 'Saudável', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (21, '2024-08-07 13:30:00', 'Dermatite', 'Otite externa', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (36, '2023-09-07 09:15:00', 'Exame de sangue', 'Verminose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (36, '2024-12-16 18:45:00', 'Avaliação pós-cirúrgica', 'Obesidade', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (6, '2025-04-13 11:30:00', 'Otite', 'Fratura leve', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (31, '2025-07-24 16:30:00', 'Dermatite', 'Insuficiência renal leve', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (18, '2025-05-08 09:15:00', 'Dermatite', 'Infecção bacteriana', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (13, '2024-12-16 12:30:00', 'Vacinação', 'Artrose', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (19, '2024-06-06 12:00:00', 'Exame de sangue', 'Sem alterações', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (18, '2023-01-18 12:15:00', 'Otite', 'Artrose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (7, '2023-10-10 15:45:00', 'Avaliação pós-cirúrgica', 'Dermatite atópica', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (4, '2025-08-04 09:45:00', 'Avaliação pós-cirúrgica', 'Infecção bacteriana', 'Paciente avaliado, retorno em 15 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (10, '2024-10-10 09:15:00', 'Vacinação', 'Sem alterações', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (39, '2024-09-13 15:45:00', 'Ferimento na pata', 'Artrose', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (20, '2023-10-24 09:15:00', 'Otite', 'Gastroenterite', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (43, '2023-03-08 10:00:00', 'Vômito e diarreia', 'Saudável', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (29, '2026-05-02 11:30:00', 'Exame de sangue', 'Otite externa', 'Paciente avaliado, retorno em 7 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (5, '2024-05-26 18:15:00', 'Dor abdominal', 'Infecção bacteriana', 'Paciente avaliado, retorno em 30 dias.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (42, '2024-05-27 10:00:00', 'Consulta de rotina', 'Alergia alimentar', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (39, '2025-08-04 15:30:00', 'Exame de sangue', 'Verminose', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (33, '2026-08-03 17:00:00', 'Conjuntivite', 'Verminose', 'Paciente avaliado, retorno se necessário.');
INSERT INTO Consulta (IdAnimal, DataHora, Motivo, Diagnostico, Observacoes) VALUES (39, '2025-01-03 11:00:00', 'Castração - avaliação', 'Conjuntivite viral', 'Paciente avaliado, retorno se necessário.');

-- ================= INTERNAMENTO =================
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (37, '2023-03-16', '2023-03-25', 'Cirurgia ortopédica', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (12, '2026-11-16', '2026-11-18', 'Cirurgia ortopédica', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (27, '2025-06-04', '2025-06-07', 'Parto complicado', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (45, '2026-05-13', '2026-05-22', 'Cirurgia de castração', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (6, '2025-05-11', '2025-05-13', 'Desidratação severa', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (43, '2026-07-02', '2026-07-06', 'Convulsões', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (40, '2026-11-15', '2026-11-16', 'Insuficiência renal aguda', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (36, '2024-05-15', '2024-05-23', 'Observação pós-trauma', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (41, '2024-12-06', '2024-12-11', 'Convulsões', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (36, '2026-02-08', '2026-02-10', 'Cirurgia ortopédica', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (42, '2024-08-10', '2024-08-19', 'Fratura exposta', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (31, '2026-04-15', '2026-04-24', 'Intoxicação alimentar', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (13, '2024-02-09', '2024-02-16', 'Parto complicado', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (1, '2025-12-10', '2025-12-20', 'Pancreatite aguda', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (10, '2026-09-16', '2026-09-22', 'Parto complicado', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (30, '2025-04-08', '2025-04-18', 'Desidratação severa', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (50, '2026-01-11', '2026-01-19', 'Desidratação severa', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (43, '2024-08-02', '2024-08-05', 'Convulsões', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (7, '2026-02-17', '2026-02-25', 'Cirurgia de castração', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (27, '2024-02-16', '2024-02-21', 'Parto complicado', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (42, '2023-06-18', '2023-06-25', 'Parto complicado', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (35, '2023-10-03', '2023-10-07', 'Fratura exposta', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (48, '2023-07-04', '2023-07-06', 'Cirurgia ortopédica', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (45, '2025-01-02', '2025-01-08', 'Cirurgia de castração', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (23, '2025-07-05', '2025-07-09', 'Convulsões', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (37, '2024-03-06', '2024-03-08', 'Pancreatite aguda', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (40, '2024-08-19', '2024-08-22', 'Insuficiência renal aguda', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (41, '2025-08-09', '2025-08-10', 'Cirurgia ortopédica', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (44, '2024-02-15', '2024-02-21', 'Pancreatite aguda', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (41, '2026-12-09', '2026-12-17', 'Fratura exposta', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (25, '2026-02-08', '2026-02-15', 'Pancreatite aguda', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (37, '2025-12-10', '2025-12-11', 'Desidratação severa', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (1, '2023-10-16', '2023-10-21', 'Insuficiência renal aguda', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (15, '2024-10-09', '2024-10-12', 'Observação pós-trauma', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (20, '2026-01-19', '2026-01-25', 'Intoxicação alimentar', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (19, '2025-12-14', '2025-12-17', 'Insuficiência renal aguda', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (35, '2025-09-17', '2025-09-22', 'Intoxicação alimentar', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (31, '2025-12-11', '2025-12-13', 'Cirurgia ortopédica', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (10, '2024-11-13', '2024-11-22', 'Parto complicado', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (26, '2023-05-18', '2023-05-20', 'Cirurgia ortopédica', 'Evolução com intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (44, '2025-10-13', '2025-10-19', 'Observação pós-trauma', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (31, '2023-10-18', '2023-10-24', 'Pancreatite aguda', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (42, '2023-11-15', '2023-11-20', 'Desidratação severa', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (9, '2023-01-10', '2023-01-18', 'Observação pós-trauma', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (16, '2024-07-15', '2024-07-21', 'Convulsões', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (38, '2024-07-04', '2024-07-12', 'Pancreatite aguda', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (18, '2023-12-12', '2023-12-16', 'Cirurgia ortopédica', 'Evolução sem intercorrências durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (16, '2025-02-12', '2025-02-21', 'Parto complicado', 'Evolução estável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (26, '2025-04-04', '2025-04-12', 'Observação pós-trauma', 'Evolução favorável durante internamento.');
INSERT INTO Internamento (IdAnimal, DataEntrada, DataSaida, Motivo, Observacoes) VALUES (42, '2023-01-11', '2023-01-15', 'Intoxicação alimentar', 'Evolução favorável durante internamento.');

-- ================= HISTORICOMEDICO =================
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (5, 'Histórico de cirurgia ortopédica', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (14, 'Histórico de cirurgia ortopédica', 'Corticoide');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (50, 'Tratamento contínuo para artrose', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (1, 'Sem antecedentes de doenças graves', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (9, 'Sem antecedentes de doenças graves', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (8, 'Animal saudável, sem histórico relevante', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (1, 'Acompanhamento nutricional recomendado', 'Ácaros');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (38, 'Acompanhamento nutricional recomendado', 'Nenhuma');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (12, 'Sem antecedentes de doenças graves', 'Nenhuma');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (9, 'Histórico de problemas dermatológicos', 'Nenhuma conhecida');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (8, 'Histórico de alergias respiratórias', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (29, 'Acompanhamento nutricional recomendado', 'Nenhuma conhecida');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (38, 'Histórico de alergias respiratórias', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (33, 'Histórico de cirurgia ortopédica', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (3, 'Sem antecedentes de doenças graves', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (42, 'Animal saudável, sem histórico relevante', 'Nenhuma');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (31, 'Histórico de problemas dermatológicos', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (44, 'Histórico de alergias respiratórias', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (46, 'Sem particularidades', 'Frango');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (6, 'Acompanhamento nutricional recomendado', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (10, 'Histórico de alergias respiratórias', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (18, 'Acompanhamento nutricional recomendado', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (39, 'Sem antecedentes de doenças graves', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (33, 'Histórico de problemas dermatológicos', 'Frango');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (45, 'Histórico de alergias respiratórias', 'Nenhuma conhecida');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (47, 'Histórico de cirurgia ortopédica', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (29, 'Histórico de cirurgia ortopédica', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (22, 'Sem particularidades', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (27, 'Histórico de alergias respiratórias', 'Corticoide');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (28, 'Acompanhamento nutricional recomendado', 'Pólen');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (24, 'Tratamento contínuo para artrose', 'Glúten');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (5, 'Histórico de alergias respiratórias', 'Frango');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (6, 'Histórico de problemas dermatológicos', 'Frango');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (48, 'Acompanhamento nutricional recomendado', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (36, 'Animal saudável, sem histórico relevante', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (36, 'Acompanhamento nutricional recomendado', 'Frango');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (27, 'Acompanhamento nutricional recomendado', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (47, 'Animal saudável, sem histórico relevante', 'Pólen');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (39, 'Sem antecedentes de doenças graves', 'Corticoide');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (7, 'Histórico de cirurgia ortopédica', 'Lactose');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (43, 'Sem particularidades', 'Ácaros');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (7, 'Acompanhamento nutricional recomendado', 'Nenhuma conhecida');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (24, 'Histórico de alergias respiratórias', 'Pólen');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (37, 'Histórico de cirurgia ortopédica', 'Pulgas');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (36, 'Animal saudável, sem histórico relevante', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (43, 'Sem antecedentes de doenças graves', 'Nenhuma');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (12, 'Sem antecedentes de doenças graves', 'Pólen');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (22, 'Acompanhamento nutricional recomendado', 'Nenhuma');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (12, 'Tratamento contínuo para artrose', 'Poeira');
INSERT INTO HistoricoMedico (IdAnimal, ObservacoesGerais, Alergias) VALUES (43, 'Histórico de problemas dermatológicos', 'Frango');

-- ================= FATURA =================
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (10, 48, 'FAT-20260001', '2023-02-24', 819.2, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (27, 30, 'FAT-20260002', '2025-03-12', 501.87, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (50, 37, 'FAT-20260003', '2023-01-05', 278.24, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (44, 6, 'FAT-20260004', '2025-08-22', 664.82, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (27, 18, 'FAT-20260005', '2024-09-04', 550.5, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (19, 44, 'FAT-20260006', '2026-09-22', 497.21, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (26, 39, 'FAT-20260007', '2023-01-07', 487.06, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (50, 9, 'FAT-20260008', '2025-05-11', 223.98, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (48, 28, 'FAT-20260009', '2024-03-13', 822.24, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (33, 36, 'FAT-20260010', '2025-02-13', 1299.56, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (28, 2, 'FAT-20260011', '2026-02-28', 503.94, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (37, 26, 'FAT-20260012', '2026-05-04', 637.3, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (11, 40, 'FAT-20260013', '2026-12-12', 177.79, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (16, 28, 'FAT-20260014', '2026-09-03', 623.86, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (48, 22, 'FAT-20260015', '2024-06-25', 293.79, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (34, 33, 'FAT-20260016', '2024-06-12', 1104.7, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (16, 7, 'FAT-20260017', '2024-05-07', 301.57, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (49, 49, 'FAT-20260018', '2023-03-25', 960.53, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (49, 37, 'FAT-20260019', '2026-11-19', 982.34, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (41, 21, 'FAT-20260020', '2024-08-03', 729.94, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (18, 38, 'FAT-20260021', '2023-06-17', 157.58, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (29, 3, 'FAT-20260022', '2023-06-27', 466.26, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (40, 39, 'FAT-20260023', '2026-08-19', 853.76, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (29, 37, 'FAT-20260024', '2024-06-20', 739.66, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (4, 29, 'FAT-20260025', '2023-06-23', 172.28, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (3, 16, 'FAT-20260026', '2026-08-17', 807.98, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (24, 24, 'FAT-20260027', '2025-07-14', 1172.97, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (41, 42, 'FAT-20260028', '2025-02-11', 187.03, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (19, 17, 'FAT-20260029', '2024-06-03', 894.97, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (23, 20, 'FAT-20260030', '2026-03-20', 1077.81, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (20, 36, 'FAT-20260031', '2026-11-26', 526.29, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (43, 45, 'FAT-20260032', '2023-11-22', 663.94, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (2, 24, 'FAT-20260033', '2025-03-07', 545.51, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (13, 15, 'FAT-20260034', '2024-03-03', 478.9, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (33, 50, 'FAT-20260035', '2023-11-11', 1320.77, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (39, 25, 'FAT-20260036', '2024-03-06', 1255.45, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (47, 29, 'FAT-20260037', '2023-07-12', 1030.73, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (29, 40, 'FAT-20260038', '2025-12-26', 700.95, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (20, 31, 'FAT-20260039', '2024-06-22', 1423.34, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (30, 50, 'FAT-20260040', '2025-07-17', 814.82, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (13, 39, 'FAT-20260041', '2024-05-02', 979.71, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (36, 7, 'FAT-20260042', '2023-05-03', 1156.52, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (29, 33, 'FAT-20260043', '2024-07-03', 1422.3, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (29, 23, 'FAT-20260044', '2023-07-02', 624.86, 'Cancelada');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (16, 25, 'FAT-20260045', '2023-06-08', 90.87, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (46, 42, 'FAT-20260046', '2025-03-05', 105.54, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (45, 9, 'FAT-20260047', '2026-08-20', 57.61, 'Paga');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (2, 17, 'FAT-20260048', '2024-03-18', 1413.33, 'Em atraso');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (8, 50, 'FAT-20260049', '2025-04-10', 226.68, 'Pendente');
INSERT INTO Fatura (IdConsulta, IdInternamento, NumeroFatura, DataEmissao, Total, Estado) VALUES (27, 41, 'FAT-20260050', '2026-02-04', 1263.2, 'Em atraso');

-- ================= VACINA =================
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (39, 'Bordetella', '2023-11-17', 'L4963-B', '2024-11-17');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (19, 'Tríplice Felina', '2023-10-12', 'L4941-D', '2024-10-12');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (12, 'V8', '2025-02-17', 'L9914-A', '2026-02-17');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (25, 'Leucemia Felina', '2023-11-13', 'L7116-C', '2024-11-13');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (48, 'V10', '2025-02-12', 'L4950-A', '2026-02-12');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (50, 'Quíntupla', '2025-03-02', 'L6772-C', '2026-03-02');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (42, 'Antirrábica', '2026-12-16', 'L3986-B', '2027-12-16');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (5, 'Leucemia Felina', '2023-05-07', 'L1717-B', '2024-05-07');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (3, 'Leishmaniose', '2025-09-13', 'L9897-D', '2026-09-13');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (17, 'V10', '2024-05-12', 'L1783-C', '2025-05-12');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (18, 'V8', '2025-07-13', 'L8204-D', '2026-07-13');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (22, 'Antirrábica', '2026-12-16', 'L7018-C', '2027-12-16');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (6, 'Tríplice Felina', '2023-07-20', 'L3956-C', '2024-07-20');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (21, 'V8', '2023-06-22', 'L5843-C', '2024-06-22');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (29, 'Quíntupla', '2026-03-23', 'L8272-C', '2027-03-23');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (29, 'V10', '2025-10-14', 'L5498-A', '2026-10-14');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (5, 'Tríplice Felina', '2025-09-26', 'L3621-A', '2026-09-26');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (10, 'Quíntupla', '2026-01-05', 'L2101-B', '2027-01-05');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (50, 'Leishmaniose', '2025-07-19', 'L1530-B', '2026-07-19');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (44, 'Leucemia Felina', '2025-06-15', 'L2259-B', '2026-06-15');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (34, 'Leishmaniose', '2026-06-21', 'L5566-B', '2027-06-21');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (8, 'V10', '2024-08-17', 'L7340-A', '2025-08-17');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (17, 'Gripe Canina', '2026-04-20', 'L5678-D', '2027-04-20');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (13, 'V8', '2024-02-15', 'L3828-D', '2025-02-15');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (6, 'Leishmaniose', '2025-12-03', 'L9882-C', '2026-12-03');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (20, 'Antirrábica', '2024-06-17', 'L4673-A', '2025-06-17');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (13, 'Antirrábica', '2024-08-01', 'L6912-C', '2025-08-01');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (30, 'Bordetella', '2024-10-03', 'L2077-C', '2025-10-03');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (26, 'Leucemia Felina', '2026-07-27', 'L2208-B', '2027-07-27');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (21, 'V8', '2026-08-22', 'L9476-C', '2027-08-22');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (9, 'Bordetella', '2024-03-14', 'L9238-A', '2025-03-14');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (8, 'Bordetella', '2024-05-06', 'L3653-C', '2025-05-06');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (46, 'Giárdia', '2025-09-10', 'L2292-C', '2026-09-10');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (13, 'Bordetella', '2025-03-21', 'L5961-A', '2026-03-21');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (33, 'Antirrábica', '2024-03-22', 'L6531-A', '2025-03-22');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (2, 'V8', '2023-11-25', 'L5336-B', '2024-11-25');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (50, 'Quíntupla', '2026-10-21', 'L1496-D', '2027-10-21');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (41, 'Bordetella', '2025-11-10', 'L8912-B', '2026-11-10');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (44, 'Tríplice Felina', '2025-08-03', 'L1981-B', '2026-08-03');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (29, 'Tríplice Felina', '2026-08-07', 'L6573-B', '2027-08-07');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (21, 'Leishmaniose', '2025-07-05', 'L7070-A', '2026-07-05');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (21, 'Giárdia', '2026-02-09', 'L8366-B', '2027-02-09');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (10, 'V8', '2023-05-13', 'L7850-B', '2024-05-13');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (11, 'Leishmaniose', '2025-04-25', 'L3610-D', '2026-04-25');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (33, 'Leucemia Felina', '2026-05-16', 'L1379-A', '2027-05-16');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (26, 'Bordetella', '2026-04-07', 'L6781-A', '2027-04-07');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (4, 'Gripe Canina', '2026-10-27', 'L8710-C', '2027-10-27');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (35, 'V10', '2023-07-05', 'L5333-C', '2024-07-05');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (49, 'Tríplice Felina', '2025-01-13', 'L1838-B', '2026-01-13');
INSERT INTO Vacina (IdHistorico, NomeVacina, DataAplicacao, Lote, ProximaDose) VALUES (24, 'Bordetella', '2025-02-13', 'L9261-D', '2026-02-13');

-- ================= PAGAMENTO =================
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (49, '2025-10-22', 936.01, 'Cartão de Crédito', 'REF201377');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (26, '2025-06-18', 1411.48, 'Cartão de Crédito', 'REF308727');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (39, '2026-09-02', 115.69, 'Cartão de Crédito', 'REF848255');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (22, '2026-09-15', 265.96, 'Transferência Bancária', 'REF246570');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (21, '2025-03-13', 1486.39, 'Cheque', 'REF983532');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (20, '2025-09-27', 789.09, 'Pix', 'REF843167');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (37, '2025-08-27', 74.12, 'Cartão de Débito', 'REF806537');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (8, '2026-10-10', 1205.29, 'Cheque', 'REF821466');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (41, '2023-10-16', 435.02, 'Cheque', 'REF920934');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (50, '2024-12-02', 896.11, 'Cartão de Crédito', 'REF649697');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (41, '2026-03-27', 1037.05, 'Dinheiro', 'REF700383');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (45, '2023-04-01', 689.51, 'Pix', 'REF258787');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (27, '2024-07-17', 1173.71, 'Pix', 'REF989587');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (48, '2023-12-05', 802.09, 'Transferência Bancária', 'REF440839');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (43, '2026-09-13', 504.94, 'Cartão de Crédito', 'REF581992');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (35, '2025-09-12', 1030.01, 'Cheque', 'REF813813');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (42, '2025-10-16', 328.78, 'Cartão de Crédito', 'REF392559');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (36, '2025-04-10', 1168.2, 'Cheque', 'REF317346');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (45, '2026-06-16', 555.76, 'Cheque', 'REF386741');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (19, '2023-10-22', 837.63, 'Pix', 'REF958130');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (23, '2024-05-02', 467.06, 'Cheque', 'REF182868');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (23, '2026-11-09', 1133.64, 'Cartão de Crédito', 'REF311883');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (35, '2025-09-23', 443.85, 'Dinheiro', 'REF745584');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (48, '2024-04-02', 1021.26, 'Transferência Bancária', 'REF336633');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (41, '2024-01-04', 649.29, 'Cheque', 'REF595351');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (7, '2024-01-18', 1467.97, 'Cartão de Crédito', 'REF526673');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (42, '2026-08-21', 339.21, 'Cartão de Débito', 'REF436768');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (19, '2023-02-21', 882.49, 'Transferência Bancária', 'REF874568');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (47, '2023-03-14', 1329.26, 'Cartão de Crédito', 'REF138105');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (26, '2026-03-24', 1445.09, 'Cartão de Débito', 'REF139286');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (1, '2025-10-20', 205.59, 'Cartão de Débito', 'REF398384');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (30, '2026-03-28', 781.11, 'Cartão de Débito', 'REF302177');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (8, '2025-03-24', 715.43, 'Cartão de Débito', 'REF853504');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (12, '2023-12-11', 1196.61, 'Transferência Bancária', 'REF807160');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (49, '2024-03-20', 1291.41, 'Pix', 'REF967161');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (28, '2025-02-13', 1020.42, 'Cartão de Crédito', 'REF247442');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (31, '2025-04-01', 428.14, 'Cartão de Crédito', 'REF568436');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (49, '2025-06-10', 894.57, 'Transferência Bancária', 'REF111991');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (17, '2025-12-08', 140.08, 'Dinheiro', 'REF588002');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (20, '2024-07-22', 778.65, 'Cheque', 'REF907236');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (20, '2023-11-10', 582.94, 'Cartão de Crédito', 'REF329772');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (9, '2026-03-15', 1134.22, 'Transferência Bancária', 'REF491774');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (27, '2026-09-26', 1012.94, 'Cartão de Crédito', 'REF898867');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (16, '2023-09-15', 815.85, 'Cartão de Débito', 'REF181896');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (37, '2023-01-27', 844.09, 'Transferência Bancária', 'REF311976');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (37, '2024-03-11', 1289.0, 'Pix', 'REF221886');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (44, '2024-12-19', 758.8, 'Transferência Bancária', 'REF567122');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (4, '2026-03-17', 652.37, 'Transferência Bancária', 'REF160541');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (36, '2026-11-26', 496.85, 'Dinheiro', 'REF515182');
INSERT INTO Pagamento (IdFatura, DataPagamento, ValorPagamento, MetodoPagamento, Referencia) VALUES (17, '2023-12-07', 888.55, 'Dinheiro', 'REF544278');

