CREATE DATABASE Bibliotech;

USE Bibliotech;

CREATE TABLE CUSTOMERS (
CustomerID INT PRIMARY KEY ,
CustomerName VARCHAR (100),
Phone VARCHAR (15),
Address VARCHAR (100),
PostalCode VARCHAR (10),
CPF char (11),
City VARCHAR (60),
Email VARCHAR (400)
);

CREATE TABLE EMPLOYEES(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR (20),
LastName VARCHAR (50),
Phone VARCHAR (15),
Address VARCHAR (100), 
CPF CHAR (11),
Email VARCHAR (400)
);

CREATE TABLE SUPPLIERS (
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR (100),
ContactName VARCHAR (50),
Phone VARCHAR (15),
Email VARCHAR (400),
Country VARCHAR (60)
);

CREATE TABLE SHIPPERS (
ShipperID INT PRIMARY KEY,
ShipperName VARCHAR (100),
Phone VARCHAR (15),
 Email VARCHAR (400)
);

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR (100),
Description VARCHAR (100)
);

CREATE TABLE BOOKS (
BookID INT PRIMARY KEY,
BOOKNAME VARCHAR (100),
CategoryID INT, 
SupplierID INT,
BookCondition VARCHAR (50),
FOREIGN KEY (categoryID) REFERENCES categories (CategoryID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);

CREATE TABLE BORROWING ( 
BorrowingID INT PRIMARY KEY,
LoanDATE DATETIME,
CollectionDATE DATETIME,
Price DECIMAL (10,2),
CustomeriD INT,
BookID INT,
EmployeeID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (BookID) REFERENCES Books (BookID),
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY ,
BookID INT, 
CustomerID INT ,
EmployeeID INT,
ShipperID INT,
OrderDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES (EMPLOYEEID),
FOREIGN KEY (SHIPPERID) REFERENCES SHIPPERS (SHIPPERID),
FOREIGN KEY (BOOKID) REFERENCES BOOKS (BOOKID)
);

CREATE TABLE FINES ( 
FineID INT PRIMARY KEY,
Value DECIMAL (10,2),
Customerid INT,
BORROWINGID INT,
BookID INT,
FOREIGN KEY (Customerid) REFERENCES customers (Customerid),
FOREIGN KEY (BorrowingID) REFERENCES BORROWING (Borrowingid),
FOREIGN KEY (BookID) REFERENCES Books (BookID)
);


INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (1, 'Literatura Brasileira', 'Obras clássicas e contemporâneas de autores brasileiros');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (2, 'Literatura Estrangeira', 'Romances e obras internacionais traduzidas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (3, 'Fantasia', 'Histórias com magia, mundos imaginários e aventuras');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (4, 'Ficção Científica', 'Narrativas sobre tecnologia, espaço e futuros possíveis');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (5, 'Romance', 'Histórias focadas em relações e conflitos afetivos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (6, 'Suspense', 'Livros com mistério, investigação e tensão');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (7, 'Terror', 'Obras de medo, horror psicológico e sobrenatural');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (8, 'Biografia', 'Relatos sobre a vida de pessoas reais');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (9, 'História', 'Livros sobre acontecimentos históricos e sociedades');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (10, 'Filosofia', 'Textos sobre pensamento, ética e conhecimento');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (11, 'Psicologia', 'Comportamento humano, mente e desenvolvimento pessoal');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (12, 'Educação', 'Didática, ensino, aprendizagem e práticas pedagógicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (13, 'Tecnologia', 'Computação, inovação, programação e cultura digital');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (14, 'Administração', 'Gestão, liderança, negócios e empreendedorismo');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (15, 'Economia', 'Mercado, finanças, sociedade e políticas econômicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (16, 'Infantil', 'Livros para crianças em fase inicial de leitura');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (17, 'Juvenil', 'Obras para adolescentes e jovens leitores');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (18, 'Poesia', 'Coletâneas poéticas e textos líricos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (19, 'Crônicas', 'Textos curtos sobre cotidiano e sociedade');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (20, 'Autoajuda', 'Desenvolvimento pessoal e hábitos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (21, 'Literatura Brasileira - Coleção 2', 'Obras clássicas e contemporâneas de autores brasileiros');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (22, 'Literatura Estrangeira - Coleção 2', 'Romances e obras internacionais traduzidas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (23, 'Fantasia - Coleção 2', 'Histórias com magia, mundos imaginários e aventuras');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (24, 'Ficção Científica - Coleção 2', 'Narrativas sobre tecnologia, espaço e futuros possíveis');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (25, 'Romance - Coleção 2', 'Histórias focadas em relações e conflitos afetivos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (26, 'Suspense - Coleção 2', 'Livros com mistério, investigação e tensão');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (27, 'Terror - Coleção 2', 'Obras de medo, horror psicológico e sobrenatural');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (28, 'Biografia - Coleção 2', 'Relatos sobre a vida de pessoas reais');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (29, 'História - Coleção 2', 'Livros sobre acontecimentos históricos e sociedades');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (30, 'Filosofia - Coleção 2', 'Textos sobre pensamento, ética e conhecimento');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (31, 'Psicologia - Coleção 2', 'Comportamento humano, mente e desenvolvimento pessoal');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (32, 'Educação - Coleção 2', 'Didática, ensino, aprendizagem e práticas pedagógicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (33, 'Tecnologia - Coleção 2', 'Computação, inovação, programação e cultura digital');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (34, 'Administração - Coleção 2', 'Gestão, liderança, negócios e empreendedorismo');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (35, 'Economia - Coleção 2', 'Mercado, finanças, sociedade e políticas econômicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (36, 'Infantil - Coleção 2', 'Livros para crianças em fase inicial de leitura');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (37, 'Juvenil - Coleção 2', 'Obras para adolescentes e jovens leitores');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (38, 'Poesia - Coleção 2', 'Coletâneas poéticas e textos líricos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (39, 'Crônicas - Coleção 2', 'Textos curtos sobre cotidiano e sociedade');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (40, 'Autoajuda - Coleção 2', 'Desenvolvimento pessoal e hábitos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (41, 'Literatura Brasileira - Coleção 3', 'Obras clássicas e contemporâneas de autores brasileiros');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (42, 'Literatura Estrangeira - Coleção 3', 'Romances e obras internacionais traduzidas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (43, 'Fantasia - Coleção 3', 'Histórias com magia, mundos imaginários e aventuras');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (44, 'Ficção Científica - Coleção 3', 'Narrativas sobre tecnologia, espaço e futuros possíveis');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (45, 'Romance - Coleção 3', 'Histórias focadas em relações e conflitos afetivos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (46, 'Suspense - Coleção 3', 'Livros com mistério, investigação e tensão');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (47, 'Terror - Coleção 3', 'Obras de medo, horror psicológico e sobrenatural');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (48, 'Biografia - Coleção 3', 'Relatos sobre a vida de pessoas reais');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (49, 'História - Coleção 3', 'Livros sobre acontecimentos históricos e sociedades');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (50, 'Filosofia - Coleção 3', 'Textos sobre pensamento, ética e conhecimento');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (51, 'Psicologia - Coleção 3', 'Comportamento humano, mente e desenvolvimento pessoal');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (52, 'Educação - Coleção 3', 'Didática, ensino, aprendizagem e práticas pedagógicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (53, 'Tecnologia - Coleção 3', 'Computação, inovação, programação e cultura digital');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (54, 'Administração - Coleção 3', 'Gestão, liderança, negócios e empreendedorismo');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (55, 'Economia - Coleção 3', 'Mercado, finanças, sociedade e políticas econômicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (56, 'Infantil - Coleção 3', 'Livros para crianças em fase inicial de leitura');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (57, 'Juvenil - Coleção 3', 'Obras para adolescentes e jovens leitores');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (58, 'Poesia - Coleção 3', 'Coletâneas poéticas e textos líricos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (59, 'Crônicas - Coleção 3', 'Textos curtos sobre cotidiano e sociedade');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (60, 'Autoajuda - Coleção 3', 'Desenvolvimento pessoal e hábitos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (61, 'Literatura Brasileira - Coleção 4', 'Obras clássicas e contemporâneas de autores brasileiros');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (62, 'Literatura Estrangeira - Coleção 4', 'Romances e obras internacionais traduzidas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (63, 'Fantasia - Coleção 4', 'Histórias com magia, mundos imaginários e aventuras');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (64, 'Ficção Científica - Coleção 4', 'Narrativas sobre tecnologia, espaço e futuros possíveis');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (65, 'Romance - Coleção 4', 'Histórias focadas em relações e conflitos afetivos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (66, 'Suspense - Coleção 4', 'Livros com mistério, investigação e tensão');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (67, 'Terror - Coleção 4', 'Obras de medo, horror psicológico e sobrenatural');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (68, 'Biografia - Coleção 4', 'Relatos sobre a vida de pessoas reais');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (69, 'História - Coleção 4', 'Livros sobre acontecimentos históricos e sociedades');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (70, 'Filosofia - Coleção 4', 'Textos sobre pensamento, ética e conhecimento');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (71, 'Psicologia - Coleção 4', 'Comportamento humano, mente e desenvolvimento pessoal');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (72, 'Educação - Coleção 4', 'Didática, ensino, aprendizagem e práticas pedagógicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (73, 'Tecnologia - Coleção 4', 'Computação, inovação, programação e cultura digital');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (74, 'Administração - Coleção 4', 'Gestão, liderança, negócios e empreendedorismo');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (75, 'Economia - Coleção 4', 'Mercado, finanças, sociedade e políticas econômicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (76, 'Infantil - Coleção 4', 'Livros para crianças em fase inicial de leitura');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (77, 'Juvenil - Coleção 4', 'Obras para adolescentes e jovens leitores');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (78, 'Poesia - Coleção 4', 'Coletâneas poéticas e textos líricos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (79, 'Crônicas - Coleção 4', 'Textos curtos sobre cotidiano e sociedade');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (80, 'Autoajuda - Coleção 4', 'Desenvolvimento pessoal e hábitos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (81, 'Literatura Brasileira - Coleção 5', 'Obras clássicas e contemporâneas de autores brasileiros');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (82, 'Literatura Estrangeira - Coleção 5', 'Romances e obras internacionais traduzidas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (83, 'Fantasia - Coleção 5', 'Histórias com magia, mundos imaginários e aventuras');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (84, 'Ficção Científica - Coleção 5', 'Narrativas sobre tecnologia, espaço e futuros possíveis');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (85, 'Romance - Coleção 5', 'Histórias focadas em relações e conflitos afetivos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (86, 'Suspense - Coleção 5', 'Livros com mistério, investigação e tensão');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (87, 'Terror - Coleção 5', 'Obras de medo, horror psicológico e sobrenatural');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (88, 'Biografia - Coleção 5', 'Relatos sobre a vida de pessoas reais');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (89, 'História - Coleção 5', 'Livros sobre acontecimentos históricos e sociedades');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (90, 'Filosofia - Coleção 5', 'Textos sobre pensamento, ética e conhecimento');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (91, 'Psicologia - Coleção 5', 'Comportamento humano, mente e desenvolvimento pessoal');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (92, 'Educação - Coleção 5', 'Didática, ensino, aprendizagem e práticas pedagógicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (93, 'Tecnologia - Coleção 5', 'Computação, inovação, programação e cultura digital');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (94, 'Administração - Coleção 5', 'Gestão, liderança, negócios e empreendedorismo');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (95, 'Economia - Coleção 5', 'Mercado, finanças, sociedade e políticas econômicas');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (96, 'Infantil - Coleção 5', 'Livros para crianças em fase inicial de leitura');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (97, 'Juvenil - Coleção 5', 'Obras para adolescentes e jovens leitores');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (98, 'Poesia - Coleção 5', 'Coletâneas poéticas e textos líricos');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (99, 'Crônicas - Coleção 5', 'Textos curtos sobre cotidiano e sociedade');
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES (100, 'Autoajuda - Coleção 5', 'Desenvolvimento pessoal e hábitos');


INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (1, 'Editora Aurora', 'Marina Lopes', '1196540001', 'editora.aurora1@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (2, 'Livraria Central Distribuidora', 'Roberto Dias', '1191140002', 'livraria.central.distribuidora2@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (3, 'Editora Horizonte', 'Camila Torres', '1190250003', 'editora.horizonte3@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (4, 'Distribuidora Atlântico', 'Fernando Alves', '1197590004', 'distribuidora.atlantico4@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (5, 'Editora Saber', 'Luciana Costa', '1192810005', 'editora.saber5@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (6, 'Grupo Editorial Primavera', 'André Martins', '1192500006', 'grupo.editorial.primavera6@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (7, 'BookWorld Importadora', 'Jessica Miller', '1192280007', 'bookworld.importadora7@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (8, 'Editora Lusitana', 'Pedro Almeida', '1191420008', 'editora.lusitana8@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (9, 'Global Books Supply', 'Emma Johnson', '1197540009', 'global.books.supply9@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (10, 'Editorial Río Plata', 'Sofía Méndez', '1191040010', 'editorial.rio.plata10@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (11, 'Editora Aurora - Filial 2', 'Marina Lopes', '1196920011', 'editora.aurora.211@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (12, 'Livraria Central Distribuidora - Filial 2', 'Roberto Dias', '1197580012', 'livraria.central.distribuidora.212@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (13, 'Editora Horizonte - Filial 2', 'Camila Torres', '1199130013', 'editora.horizonte.213@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (14, 'Distribuidora Atlântico - Filial 2', 'Fernando Alves', '1195580014', 'distribuidora.atlantico.214@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (15, 'Editora Saber - Filial 2', 'Luciana Costa', '1190890015', 'editora.saber.215@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (16, 'Grupo Editorial Primavera - Filial 2', 'André Martins', '1196040016', 'grupo.editorial.primavera.216@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (17, 'BookWorld Importadora - Filial 2', 'Jessica Miller', '1194320017', 'bookworld.importadora.217@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (18, 'Editora Lusitana - Filial 2', 'Pedro Almeida', '1190320018', 'editora.lusitana.218@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (19, 'Global Books Supply - Filial 2', 'Emma Johnson', '1190300019', 'global.books.supply.219@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (20, 'Editorial Río Plata - Filial 2', 'Sofía Méndez', '1190950020', 'editorial.rio.plata.220@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (21, 'Editora Aurora - Filial 3', 'Marina Lopes', '1192230021', 'editora.aurora.321@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (22, 'Livraria Central Distribuidora - Filial 3', 'Roberto Dias', '1192380022', 'livraria.central.distribuidora.322@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (23, 'Editora Horizonte - Filial 3', 'Camila Torres', '1195170023', 'editora.horizonte.323@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (24, 'Distribuidora Atlântico - Filial 3', 'Fernando Alves', '1196160024', 'distribuidora.atlantico.324@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (25, 'Editora Saber - Filial 3', 'Luciana Costa', '1190270025', 'editora.saber.325@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (26, 'Grupo Editorial Primavera - Filial 3', 'André Martins', '1195740026', 'grupo.editorial.primavera.326@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (27, 'BookWorld Importadora - Filial 3', 'Jessica Miller', '1192030027', 'bookworld.importadora.327@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (28, 'Editora Lusitana - Filial 3', 'Pedro Almeida', '1197330028', 'editora.lusitana.328@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (29, 'Global Books Supply - Filial 3', 'Emma Johnson', '1196650029', 'global.books.supply.329@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (30, 'Editorial Río Plata - Filial 3', 'Sofía Méndez', '1197180030', 'editorial.rio.plata.330@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (31, 'Editora Aurora - Filial 4', 'Marina Lopes', '1195580031', 'editora.aurora.431@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (32, 'Livraria Central Distribuidora - Filial 4', 'Roberto Dias', '1194290032', 'livraria.central.distribuidora.432@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (33, 'Editora Horizonte - Filial 4', 'Camila Torres', '1192250033', 'editora.horizonte.433@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (34, 'Distribuidora Atlântico - Filial 4', 'Fernando Alves', '1194590034', 'distribuidora.atlantico.434@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (35, 'Editora Saber - Filial 4', 'Luciana Costa', '1196030035', 'editora.saber.435@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (36, 'Grupo Editorial Primavera - Filial 4', 'André Martins', '1192840036', 'grupo.editorial.primavera.436@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (37, 'BookWorld Importadora - Filial 4', 'Jessica Miller', '1198280037', 'bookworld.importadora.437@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (38, 'Editora Lusitana - Filial 4', 'Pedro Almeida', '1198900038', 'editora.lusitana.438@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (39, 'Global Books Supply - Filial 4', 'Emma Johnson', '1190060039', 'global.books.supply.439@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (40, 'Editorial Río Plata - Filial 4', 'Sofía Méndez', '1197770040', 'editorial.rio.plata.440@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (41, 'Editora Aurora - Filial 5', 'Marina Lopes', '1198250041', 'editora.aurora.541@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (42, 'Livraria Central Distribuidora - Filial 5', 'Roberto Dias', '1191630042', 'livraria.central.distribuidora.542@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (43, 'Editora Horizonte - Filial 5', 'Camila Torres', '1197140043', 'editora.horizonte.543@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (44, 'Distribuidora Atlântico - Filial 5', 'Fernando Alves', '1194320044', 'distribuidora.atlantico.544@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (45, 'Editora Saber - Filial 5', 'Luciana Costa', '1193480045', 'editora.saber.545@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (46, 'Grupo Editorial Primavera - Filial 5', 'André Martins', '1192840046', 'grupo.editorial.primavera.546@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (47, 'BookWorld Importadora - Filial 5', 'Jessica Miller', '1191590047', 'bookworld.importadora.547@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (48, 'Editora Lusitana - Filial 5', 'Pedro Almeida', '1192200048', 'editora.lusitana.548@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (49, 'Global Books Supply - Filial 5', 'Emma Johnson', '1199800049', 'global.books.supply.549@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (50, 'Editorial Río Plata - Filial 5', 'Sofía Méndez', '1197810050', 'editorial.rio.plata.550@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (51, 'Editora Aurora - Filial 6', 'Marina Lopes', '1193440051', 'editora.aurora.651@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (52, 'Livraria Central Distribuidora - Filial 6', 'Roberto Dias', '1191040052', 'livraria.central.distribuidora.652@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (53, 'Editora Horizonte - Filial 6', 'Camila Torres', '1190940053', 'editora.horizonte.653@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (54, 'Distribuidora Atlântico - Filial 6', 'Fernando Alves', '1193890054', 'distribuidora.atlantico.654@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (55, 'Editora Saber - Filial 6', 'Luciana Costa', '1190990055', 'editora.saber.655@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (56, 'Grupo Editorial Primavera - Filial 6', 'André Martins', '1193670056', 'grupo.editorial.primavera.656@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (57, 'BookWorld Importadora - Filial 6', 'Jessica Miller', '1198670057', 'bookworld.importadora.657@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (58, 'Editora Lusitana - Filial 6', 'Pedro Almeida', '1193520058', 'editora.lusitana.658@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (59, 'Global Books Supply - Filial 6', 'Emma Johnson', '1196180059', 'global.books.supply.659@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (60, 'Editorial Río Plata - Filial 6', 'Sofía Méndez', '1192700060', 'editorial.rio.plata.660@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (61, 'Editora Aurora - Filial 7', 'Marina Lopes', '1198260061', 'editora.aurora.761@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (62, 'Livraria Central Distribuidora - Filial 7', 'Roberto Dias', '1190440062', 'livraria.central.distribuidora.762@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (63, 'Editora Horizonte - Filial 7', 'Camila Torres', '1197470063', 'editora.horizonte.763@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (64, 'Distribuidora Atlântico - Filial 7', 'Fernando Alves', '1194700064', 'distribuidora.atlantico.764@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (65, 'Editora Saber - Filial 7', 'Luciana Costa', '1195490065', 'editora.saber.765@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (66, 'Grupo Editorial Primavera - Filial 7', 'André Martins', '1191270066', 'grupo.editorial.primavera.766@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (67, 'BookWorld Importadora - Filial 7', 'Jessica Miller', '1199960067', 'bookworld.importadora.767@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (68, 'Editora Lusitana - Filial 7', 'Pedro Almeida', '1199440068', 'editora.lusitana.768@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (69, 'Global Books Supply - Filial 7', 'Emma Johnson', '1193870069', 'global.books.supply.769@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (70, 'Editorial Río Plata - Filial 7', 'Sofía Méndez', '1190800070', 'editorial.rio.plata.770@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (71, 'Editora Aurora - Filial 8', 'Marina Lopes', '1195650071', 'editora.aurora.871@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (72, 'Livraria Central Distribuidora - Filial 8', 'Roberto Dias', '1193000072', 'livraria.central.distribuidora.872@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (73, 'Editora Horizonte - Filial 8', 'Camila Torres', '1198490073', 'editora.horizonte.873@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (74, 'Distribuidora Atlântico - Filial 8', 'Fernando Alves', '1196430074', 'distribuidora.atlantico.874@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (75, 'Editora Saber - Filial 8', 'Luciana Costa', '1196330075', 'editora.saber.875@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (76, 'Grupo Editorial Primavera - Filial 8', 'André Martins', '1199060076', 'grupo.editorial.primavera.876@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (77, 'BookWorld Importadora - Filial 8', 'Jessica Miller', '1198820077', 'bookworld.importadora.877@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (78, 'Editora Lusitana - Filial 8', 'Pedro Almeida', '1193700078', 'editora.lusitana.878@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (79, 'Global Books Supply - Filial 8', 'Emma Johnson', '1195910079', 'global.books.supply.879@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (80, 'Editorial Río Plata - Filial 8', 'Sofía Méndez', '1191960080', 'editorial.rio.plata.880@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (81, 'Editora Aurora - Filial 9', 'Marina Lopes', '1197210081', 'editora.aurora.981@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (82, 'Livraria Central Distribuidora - Filial 9', 'Roberto Dias', '1190710082', 'livraria.central.distribuidora.982@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (83, 'Editora Horizonte - Filial 9', 'Camila Torres', '1190460083', 'editora.horizonte.983@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (84, 'Distribuidora Atlântico - Filial 9', 'Fernando Alves', '1196770084', 'distribuidora.atlantico.984@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (85, 'Editora Saber - Filial 9', 'Luciana Costa', '1192330085', 'editora.saber.985@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (86, 'Grupo Editorial Primavera - Filial 9', 'André Martins', '1197910086', 'grupo.editorial.primavera.986@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (87, 'BookWorld Importadora - Filial 9', 'Jessica Miller', '1192960087', 'bookworld.importadora.987@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (88, 'Editora Lusitana - Filial 9', 'Pedro Almeida', '1190810088', 'editora.lusitana.988@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (89, 'Global Books Supply - Filial 9', 'Emma Johnson', '1198750089', 'global.books.supply.989@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (90, 'Editorial Río Plata - Filial 9', 'Sofía Méndez', '1192380090', 'editorial.rio.plata.990@fornecedores.com.br', 'Argentina');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (91, 'Editora Aurora - Filial 10', 'Marina Lopes', '1198870091', 'editora.aurora.1091@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (92, 'Livraria Central Distribuidora - Filial 10', 'Roberto Dias', '1191030092', 'livraria.central.distribuidora.1092@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (93, 'Editora Horizonte - Filial 10', 'Camila Torres', '1193890093', 'editora.horizonte.1093@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (94, 'Distribuidora Atlântico - Filial 10', 'Fernando Alves', '1192840094', 'distribuidora.atlantico.1094@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (95, 'Editora Saber - Filial 10', 'Luciana Costa', '1194640095', 'editora.saber.1095@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (96, 'Grupo Editorial Primavera - Filial 10', 'André Martins', '1196500096', 'grupo.editorial.primavera.1096@fornecedores.com.br', 'Brasil');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (97, 'BookWorld Importadora - Filial 10', 'Jessica Miller', '1198540097', 'bookworld.importadora.1097@fornecedores.com.br', 'Estados Unidos');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (98, 'Editora Lusitana - Filial 10', 'Pedro Almeida', '1193730098', 'editora.lusitana.1098@fornecedores.com.br', 'Portugal');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (99, 'Global Books Supply - Filial 10', 'Emma Johnson', '1191660099', 'global.books.supply.1099@fornecedores.com.br', 'Reino Unido');
INSERT INTO SUPPLIERS (SupplierID, SupplierName, ContactName, Phone, Email, Country) VALUES (100, 'Editorial Río Plata - Filial 10', 'Sofía Méndez', '1193790100', 'editorial.rio.plata.10100@fornecedores.com.br', 'Argentina');


INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (1, 'Ana Souza', '1196860001', 'Rua das Acácias, 101', '6820-314', '10000000001', 'São Paulo', 'ana.souza1@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (2, 'Bruno Costa', '1196500002', 'Avenida Brasil, 102', '2169-723', '10000000002', 'Campinas', 'bruno.costa2@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (3, 'Carla Ribeiro', '1192500003', 'Rua Dom Pedro II, 103', '9751-846', '10000000003', 'Santos', 'carla.ribeiro3@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (4, 'Daniel Martins', '1192760004', 'Rua XV de Novembro, 104', '8573-488', '10000000004', 'Guarulhos', 'daniel.martins4@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (5, 'Eduarda Mendes', '1193320005', 'Alameda Santos, 105', '4598-801', '10000000005', 'Osasco', 'eduarda.mendes5@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (6, 'Felipe Cardoso', '1190320006', 'Rua das Flores, 106', '4752-941', '10000000006', 'Sorocaba', 'felipe.cardoso6@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (7, 'Gabriela Correia', '1190670007', 'Rua Padre Anchieta, 107', '7572-374', '10000000007', 'Jundiaí', 'gabriela.correia7@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (8, 'Henrique Cavalcanti', '1196710008', 'Avenida Paulista, 108', '6155-317', '10000000008', 'Ribeirão Preto', 'henrique.cavalcanti8@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (9, 'Isabela Campos', '1194690009', 'Rua Minas Gerais, 109', '7482-758', '10000000009', 'São José dos Campos', 'isabela.campos9@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (10, 'João Silva', '1192520010', 'Rua Bahia, 110', '5339-242', '10000000010', 'Belo Horizonte', 'joao.silva10@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (11, 'Larissa Souza', '1197640011', 'Rua das Acácias, 111', '9830-369', '10000000011', 'São Paulo', 'larissa.souza11@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (12, 'Marcos Costa', '1194080012', 'Avenida Brasil, 112', '8019-697', '10000000012', 'Campinas', 'marcos.costa12@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (13, 'Natália Ribeiro', '1195210013', 'Rua Dom Pedro II, 113', '4593-241', '10000000013', 'Santos', 'natalia.ribeiro13@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (14, 'Otávio Martins', '1190480014', 'Rua XV de Novembro, 114', '2489-873', '10000000014', 'Guarulhos', 'otavio.martins14@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (15, 'Patrícia Mendes', '1191630015', 'Alameda Santos, 115', '3504-742', '10000000015', 'Osasco', 'patricia.mendes15@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (16, 'Rafael Cardoso', '1193900016', 'Rua das Flores, 116', '2040-494', '10000000016', 'Sorocaba', 'rafael.cardoso16@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (17, 'Sofia Correia', '1192570017', 'Rua Padre Anchieta, 117', '8668-641', '10000000017', 'Jundiaí', 'sofia.correia17@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (18, 'Thiago Cavalcanti', '1197380018', 'Avenida Paulista, 118', '1188-796', '10000000018', 'Ribeirão Preto', 'thiago.cavalcanti18@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (19, 'Vanessa Campos', '1192730019', 'Rua Minas Gerais, 119', '9797-868', '10000000019', 'São José dos Campos', 'vanessa.campos19@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (20, 'William Silva', '1194450020', 'Rua Bahia, 120', '2827-400', '10000000020', 'Belo Horizonte', 'william.silva20@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (21, 'Beatriz Souza', '1199760021', 'Rua das Acácias, 121', '8433-103', '10000000021', 'São Paulo', 'beatriz.souza21@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (22, 'Caio Costa', '1191820022', 'Avenida Brasil, 122', '9201-880', '10000000022', 'Campinas', 'caio.costa22@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (23, 'Débora Ribeiro', '1196400023', 'Rua Dom Pedro II, 123', '2743-991', '10000000023', 'Santos', 'debora.ribeiro23@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (24, 'Enzo Martins', '1192030024', 'Rua XV de Novembro, 124', '9317-723', '10000000024', 'Guarulhos', 'enzo.martins24@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (25, 'Fernanda Mendes', '1191650025', 'Alameda Santos, 125', '7126-880', '10000000025', 'Osasco', 'fernanda.mendes25@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (26, 'Gustavo Cardoso', '1196130026', 'Rua das Flores, 126', '9689-100', '10000000026', 'Sorocaba', 'gustavo.cardoso26@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (27, 'Helena Correia', '1191140027', 'Rua Padre Anchieta, 127', '9005-119', '10000000027', 'Jundiaí', 'helena.correia27@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (28, 'Igor Cavalcanti', '1190590028', 'Avenida Paulista, 128', '6038-345', '10000000028', 'Ribeirão Preto', 'igor.cavalcanti28@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (29, 'Juliana Campos', '1197490029', 'Rua Minas Gerais, 129', '2290-187', '10000000029', 'São José dos Campos', 'juliana.campos29@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (30, 'Kleber Silva', '1195450030', 'Rua Bahia, 130', '2133-878', '10000000030', 'Belo Horizonte', 'kleber.silva30@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (31, 'Laura Souza', '1194860031', 'Rua das Acácias, 131', '3103-775', '10000000031', 'São Paulo', 'laura.souza31@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (32, 'Miguel Costa', '1195400032', 'Avenida Brasil, 132', '3705-371', '10000000032', 'Campinas', 'miguel.costa32@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (33, 'Nicole Ribeiro', '1199510033', 'Rua Dom Pedro II, 133', '7932-316', '10000000033', 'Santos', 'nicole.ribeiro33@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (34, 'Paulo Martins', '1193190034', 'Rua XV de Novembro, 134', '4295-830', '10000000034', 'Guarulhos', 'paulo.martins34@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (35, 'Renata Mendes', '1199210035', 'Alameda Santos, 135', '7118-548', '10000000035', 'Osasco', 'renata.mendes35@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (36, 'Samuel Cardoso', '1192530036', 'Rua das Flores, 136', '8397-223', '10000000036', 'Sorocaba', 'samuel.cardoso36@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (37, 'Talita Correia', '1190210037', 'Rua Padre Anchieta, 137', '2049-446', '10000000037', 'Jundiaí', 'talita.correia37@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (38, 'Vinícius Cavalcanti', '1192250038', 'Avenida Paulista, 138', '4770-702', '10000000038', 'Ribeirão Preto', 'vinicius.cavalcanti38@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (39, 'Yasmin Campos', '1196460039', 'Rua Minas Gerais, 139', '2163-824', '10000000039', 'São José dos Campos', 'yasmin.campos39@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (40, 'Zeca Silva', '1199270040', 'Rua Bahia, 140', '4750-169', '10000000040', 'Belo Horizonte', 'zeca.silva40@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (41, 'Ana Souza', '1195260041', 'Rua das Acácias, 141', '6413-172', '10000000041', 'São Paulo', 'ana.souza41@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (42, 'Bruno Costa', '1194970042', 'Avenida Brasil, 142', '5562-785', '10000000042', 'Campinas', 'bruno.costa42@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (43, 'Carla Ribeiro', '1197400043', 'Rua Dom Pedro II, 143', '9834-235', '10000000043', 'Santos', 'carla.ribeiro43@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (44, 'Daniel Martins', '1198030044', 'Rua XV de Novembro, 144', '8744-348', '10000000044', 'Guarulhos', 'daniel.martins44@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (45, 'Eduarda Mendes', '1190960045', 'Alameda Santos, 145', '7669-294', '10000000045', 'Osasco', 'eduarda.mendes45@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (46, 'Felipe Cardoso', '1194330046', 'Rua das Flores, 146', '8062-462', '10000000046', 'Sorocaba', 'felipe.cardoso46@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (47, 'Gabriela Correia', '1197460047', 'Rua Padre Anchieta, 147', '8651-984', '10000000047', 'Jundiaí', 'gabriela.correia47@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (48, 'Henrique Cavalcanti', '1194120048', 'Avenida Paulista, 148', '2612-162', '10000000048', 'Ribeirão Preto', 'henrique.cavalcanti48@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (49, 'Isabela Campos', '1191960049', 'Rua Minas Gerais, 149', '2790-354', '10000000049', 'São José dos Campos', 'isabela.campos49@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (50, 'João Silva', '1191430050', 'Rua Bahia, 150', '9786-559', '10000000050', 'Belo Horizonte', 'joao.silva50@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (51, 'Larissa Souza', '1194730051', 'Rua das Acácias, 151', '4006-385', '10000000051', 'São Paulo', 'larissa.souza51@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (52, 'Marcos Costa', '1198270052', 'Avenida Brasil, 152', '2235-553', '10000000052', 'Campinas', 'marcos.costa52@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (53, 'Natália Ribeiro', '1196670053', 'Rua Dom Pedro II, 153', '2604-151', '10000000053', 'Santos', 'natalia.ribeiro53@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (54, 'Otávio Martins', '1199480054', 'Rua XV de Novembro, 154', '1241-195', '10000000054', 'Guarulhos', 'otavio.martins54@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (55, 'Patrícia Mendes', '1194970055', 'Alameda Santos, 155', '3724-516', '10000000055', 'Osasco', 'patricia.mendes55@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (56, 'Rafael Cardoso', '1194100056', 'Rua das Flores, 156', '4502-985', '10000000056', 'Sorocaba', 'rafael.cardoso56@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (57, 'Sofia Correia', '1190020057', 'Rua Padre Anchieta, 157', '3697-488', '10000000057', 'Jundiaí', 'sofia.correia57@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (58, 'Thiago Cavalcanti', '1198030058', 'Avenida Paulista, 158', '5345-902', '10000000058', 'Ribeirão Preto', 'thiago.cavalcanti58@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (59, 'Vanessa Campos', '1197130059', 'Rua Minas Gerais, 159', '5673-533', '10000000059', 'São José dos Campos', 'vanessa.campos59@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (60, 'William Silva', '1191940060', 'Rua Bahia, 160', '8973-258', '10000000060', 'Belo Horizonte', 'william.silva60@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (61, 'Beatriz Souza', '1195930061', 'Rua das Acácias, 161', '4566-159', '10000000061', 'São Paulo', 'beatriz.souza61@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (62, 'Caio Costa', '1193210062', 'Avenida Brasil, 162', '1998-865', '10000000062', 'Campinas', 'caio.costa62@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (63, 'Débora Ribeiro', '1194880063', 'Rua Dom Pedro II, 163', '1821-698', '10000000063', 'Santos', 'debora.ribeiro63@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (64, 'Enzo Martins', '1190580064', 'Rua XV de Novembro, 164', '9701-261', '10000000064', 'Guarulhos', 'enzo.martins64@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (65, 'Fernanda Mendes', '1191900065', 'Alameda Santos, 165', '2312-971', '10000000065', 'Osasco', 'fernanda.mendes65@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (66, 'Gustavo Cardoso', '1198820066', 'Rua das Flores, 166', '2113-791', '10000000066', 'Sorocaba', 'gustavo.cardoso66@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (67, 'Helena Correia', '1199640067', 'Rua Padre Anchieta, 167', '7615-222', '10000000067', 'Jundiaí', 'helena.correia67@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (68, 'Igor Cavalcanti', '1196080068', 'Avenida Paulista, 168', '5033-692', '10000000068', 'Ribeirão Preto', 'igor.cavalcanti68@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (69, 'Juliana Campos', '1196730069', 'Rua Minas Gerais, 169', '2343-529', '10000000069', 'São José dos Campos', 'juliana.campos69@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (70, 'Kleber Silva', '1199570070', 'Rua Bahia, 170', '9565-423', '10000000070', 'Belo Horizonte', 'kleber.silva70@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (71, 'Laura Souza', '1197330071', 'Rua das Acácias, 171', '4346-785', '10000000071', 'São Paulo', 'laura.souza71@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (72, 'Miguel Costa', '1194050072', 'Avenida Brasil, 172', '4910-371', '10000000072', 'Campinas', 'miguel.costa72@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (73, 'Nicole Ribeiro', '1193230073', 'Rua Dom Pedro II, 173', '5915-568', '10000000073', 'Santos', 'nicole.ribeiro73@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (74, 'Paulo Martins', '1196360074', 'Rua XV de Novembro, 174', '1152-569', '10000000074', 'Guarulhos', 'paulo.martins74@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (75, 'Renata Mendes', '1195500075', 'Alameda Santos, 175', '2638-175', '10000000075', 'Osasco', 'renata.mendes75@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (76, 'Samuel Cardoso', '1191350076', 'Rua das Flores, 176', '9288-371', '10000000076', 'Sorocaba', 'samuel.cardoso76@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (77, 'Talita Correia', '1193780077', 'Rua Padre Anchieta, 177', '2127-350', '10000000077', 'Jundiaí', 'talita.correia77@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (78, 'Vinícius Cavalcanti', '1198530078', 'Avenida Paulista, 178', '3584-548', '10000000078', 'Ribeirão Preto', 'vinicius.cavalcanti78@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (79, 'Yasmin Campos', '1198260079', 'Rua Minas Gerais, 179', '5956-726', '10000000079', 'São José dos Campos', 'yasmin.campos79@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (80, 'Zeca Silva', '1198360080', 'Rua Bahia, 180', '1128-783', '10000000080', 'Belo Horizonte', 'zeca.silva80@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (81, 'Ana Souza', '1191060081', 'Rua das Acácias, 181', '5905-779', '10000000081', 'São Paulo', 'ana.souza81@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (82, 'Bruno Costa', '1199110082', 'Avenida Brasil, 182', '5333-218', '10000000082', 'Campinas', 'bruno.costa82@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (83, 'Carla Ribeiro', '1192880083', 'Rua Dom Pedro II, 183', '3546-378', '10000000083', 'Santos', 'carla.ribeiro83@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (84, 'Daniel Martins', '1193510084', 'Rua XV de Novembro, 184', '4450-834', '10000000084', 'Guarulhos', 'daniel.martins84@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (85, 'Eduarda Mendes', '1195000085', 'Alameda Santos, 185', '5325-617', '10000000085', 'Osasco', 'eduarda.mendes85@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (86, 'Felipe Cardoso', '1196490086', 'Rua das Flores, 186', '1832-194', '10000000086', 'Sorocaba', 'felipe.cardoso86@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (87, 'Gabriela Correia', '1190030087', 'Rua Padre Anchieta, 187', '5533-145', '10000000087', 'Jundiaí', 'gabriela.correia87@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (88, 'Henrique Cavalcanti', '1192680088', 'Avenida Paulista, 188', '3143-752', '10000000088', 'Ribeirão Preto', 'henrique.cavalcanti88@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (89, 'Isabela Campos', '1197220089', 'Rua Minas Gerais, 189', '8239-664', '10000000089', 'São José dos Campos', 'isabela.campos89@yahoo.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (90, 'João Silva', '1190770090', 'Rua Bahia, 190', '1158-214', '10000000090', 'Belo Horizonte', 'joao.silva90@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (91, 'Larissa Souza', '1198540091', 'Rua das Acácias, 191', '9938-136', '10000000091', 'São Paulo', 'larissa.souza91@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (92, 'Marcos Costa', '1191300092', 'Avenida Brasil, 192', '3426-540', '10000000092', 'Campinas', 'marcos.costa92@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (93, 'Natália Ribeiro', '1199200093', 'Rua Dom Pedro II, 193', '6050-473', '10000000093', 'Santos', 'natalia.ribeiro93@gmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (94, 'Otávio Martins', '1196980094', 'Rua XV de Novembro, 194', '6862-315', '10000000094', 'Guarulhos', 'otavio.martins94@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (95, 'Patrícia Mendes', '1197980095', 'Alameda Santos, 195', '2684-462', '10000000095', 'Osasco', 'patricia.mendes95@bibliomail.com.br');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (96, 'Rafael Cardoso', '1197670096', 'Rua das Flores, 196', '7658-735', '10000000096', 'Sorocaba', 'rafael.cardoso96@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (97, 'Sofia Correia', '1191660097', 'Rua Padre Anchieta, 197', '4878-985', '10000000097', 'Jundiaí', 'sofia.correia97@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (98, 'Thiago Cavalcanti', '1191830098', 'Avenida Paulista, 198', '7755-125', '10000000098', 'Ribeirão Preto', 'thiago.cavalcanti98@hotmail.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (99, 'Vanessa Campos', '1196850099', 'Rua Minas Gerais, 199', '7745-921', '10000000099', 'São José dos Campos', 'vanessa.campos99@outlook.com');
INSERT INTO CUSTOMERS (CustomerID, CustomerName, Phone, Address, PostalCode, CPF, City, Email) VALUES (100, 'William Silva', '1198060100', 'Rua Bahia, 200', '5371-263', '10000000100', 'Belo Horizonte', 'william.silva100@gmail.com');


INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (1, 'Isabela', 'Martins', '3193910001', 'Rua XV de Novembro, 201', '10000001001', 'isabela.martins1@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (2, 'João', 'Rocha', '3198930002', 'Alameda Santos, 202', '10000001002', 'joao.rocha2@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (3, 'Larissa', 'Barbosa', '3190390003', 'Rua das Flores, 203', '10000001003', 'larissa.barbosa3@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (4, 'Marcos', 'Mendes', '3198790004', 'Rua Padre Anchieta, 204', '10000001004', 'marcos.mendes4@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (5, 'Natália', 'Nunes', '3194810005', 'Avenida Paulista, 205', '10000001005', 'natalia.nunes5@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (6, 'Otávio', 'Araújo', '3192270006', 'Rua Minas Gerais, 206', '10000001006', 'otavio.araujo6@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (7, 'Patrícia', 'Cardoso', '3192040007', 'Rua Bahia, 207', '10000001007', 'patricia.cardoso7@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (8, 'Rafael', 'Teixeira', '3198360008', 'Rua das Acácias, 208', '10000001008', 'rafael.teixeira8@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (9, 'Sofia', 'Moreira', '3199400009', 'Avenida Brasil, 209', '10000001009', 'sofia.moreira9@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (10, 'Thiago', 'Correia', '3194710010', 'Rua Dom Pedro II, 210', '10000001010', 'thiago.correia10@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (11, 'Vanessa', 'Dias', '3193580011', 'Rua XV de Novembro, 211', '10000001011', 'vanessa.dias11@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (12, 'William', 'Freitas', '3193120012', 'Alameda Santos, 212', '10000001012', 'william.freitas12@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (13, 'Beatriz', 'Cavalcanti', '3198400013', 'Rua das Flores, 213', '10000001013', 'beatriz.cavalcanti13@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (14, 'Caio', 'Batista', '3198140014', 'Rua Padre Anchieta, 214', '10000001014', 'caio.batista14@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (15, 'Débora', 'Moura', '3198920015', 'Avenida Paulista, 215', '10000001015', 'debora.moura15@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (16, 'Enzo', 'Campos', '3192330016', 'Rua Minas Gerais, 216', '10000001016', 'enzo.campos16@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (17, 'Fernanda', 'Vieira', '3192280017', 'Rua Bahia, 217', '10000001017', 'fernanda.vieira17@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (18, 'Gustavo', 'Andrade', '3190240018', 'Rua das Acácias, 218', '10000001018', 'gustavo.andrade18@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (19, 'Helena', 'Silva', '3196750019', 'Avenida Brasil, 219', '10000001019', 'helena.silva19@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (20, 'Igor', 'Santos', '3191970020', 'Rua Dom Pedro II, 220', '10000001020', 'igor.santos20@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (21, 'Juliana', 'Oliveira', '3194080021', 'Rua XV de Novembro, 221', '10000001021', 'juliana.oliveira21@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (22, 'Kleber', 'Souza', '3193360022', 'Alameda Santos, 222', '10000001022', 'kleber.souza22@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (23, 'Laura', 'Pereira', '3192850023', 'Rua das Flores, 223', '10000001023', 'laura.pereira23@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (24, 'Miguel', 'Lima', '3198850024', 'Rua Padre Anchieta, 224', '10000001024', 'miguel.lima24@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (25, 'Nicole', 'Costa', '3190710025', 'Avenida Paulista, 225', '10000001025', 'nicole.costa25@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (26, 'Paulo', 'Ferreira', '3199900026', 'Rua Minas Gerais, 226', '10000001026', 'paulo.ferreira26@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (27, 'Renata', 'Almeida', '3197910027', 'Rua Bahia, 227', '10000001027', 'renata.almeida27@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (28, 'Samuel', 'Ribeiro', '3192850028', 'Rua das Acácias, 228', '10000001028', 'samuel.ribeiro28@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (29, 'Talita', 'Carvalho', '3193590029', 'Avenida Brasil, 229', '10000001029', 'talita.carvalho29@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (30, 'Vinícius', 'Gomes', '3196560030', 'Rua Dom Pedro II, 230', '10000001030', 'vinicius.gomes30@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (31, 'Yasmin', 'Martins', '3195210031', 'Rua XV de Novembro, 231', '10000001031', 'yasmin.martins31@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (32, 'Zeca', 'Rocha', '3194090032', 'Alameda Santos, 232', '10000001032', 'zeca.rocha32@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (33, 'Ana', 'Barbosa', '3196950033', 'Rua das Flores, 233', '10000001033', 'ana.barbosa33@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (34, 'Bruno', 'Mendes', '3198630034', 'Rua Padre Anchieta, 234', '10000001034', 'bruno.mendes34@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (35, 'Carla', 'Nunes', '3195490035', 'Avenida Paulista, 235', '10000001035', 'carla.nunes35@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (36, 'Daniel', 'Araújo', '3193390036', 'Rua Minas Gerais, 236', '10000001036', 'daniel.araujo36@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (37, 'Eduarda', 'Cardoso', '3199610037', 'Rua Bahia, 237', '10000001037', 'eduarda.cardoso37@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (38, 'Felipe', 'Teixeira', '3190280038', 'Rua das Acácias, 238', '10000001038', 'felipe.teixeira38@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (39, 'Gabriela', 'Moreira', '3191180039', 'Avenida Brasil, 239', '10000001039', 'gabriela.moreira39@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (40, 'Henrique', 'Correia', '3198980040', 'Rua Dom Pedro II, 240', '10000001040', 'henrique.correia40@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (41, 'Isabela', 'Dias', '3199930041', 'Rua XV de Novembro, 241', '10000001041', 'isabela.dias41@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (42, 'João', 'Freitas', '3192670042', 'Alameda Santos, 242', '10000001042', 'joao.freitas42@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (43, 'Larissa', 'Cavalcanti', '3191820043', 'Rua das Flores, 243', '10000001043', 'larissa.cavalcanti43@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (44, 'Marcos', 'Batista', '3195940044', 'Rua Padre Anchieta, 244', '10000001044', 'marcos.batista44@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (45, 'Natália', 'Moura', '3199850045', 'Avenida Paulista, 245', '10000001045', 'natalia.moura45@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (46, 'Otávio', 'Campos', '3192710046', 'Rua Minas Gerais, 246', '10000001046', 'otavio.campos46@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (47, 'Patrícia', 'Vieira', '3190390047', 'Rua Bahia, 247', '10000001047', 'patricia.vieira47@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (48, 'Rafael', 'Andrade', '3191110048', 'Rua das Acácias, 248', '10000001048', 'rafael.andrade48@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (49, 'Sofia', 'Silva', '3196100049', 'Avenida Brasil, 249', '10000001049', 'sofia.silva49@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (50, 'Thiago', 'Santos', '3194440050', 'Rua Dom Pedro II, 250', '10000001050', 'thiago.santos50@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (51, 'Vanessa', 'Oliveira', '3193530051', 'Rua XV de Novembro, 251', '10000001051', 'vanessa.oliveira51@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (52, 'William', 'Souza', '3197460052', 'Alameda Santos, 252', '10000001052', 'william.souza52@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (53, 'Beatriz', 'Pereira', '3198050053', 'Rua das Flores, 253', '10000001053', 'beatriz.pereira53@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (54, 'Caio', 'Lima', '3193210054', 'Rua Padre Anchieta, 254', '10000001054', 'caio.lima54@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (55, 'Débora', 'Costa', '3194460055', 'Avenida Paulista, 255', '10000001055', 'debora.costa55@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (56, 'Enzo', 'Ferreira', '3196200056', 'Rua Minas Gerais, 256', '10000001056', 'enzo.ferreira56@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (57, 'Fernanda', 'Almeida', '3195230057', 'Rua Bahia, 257', '10000001057', 'fernanda.almeida57@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (58, 'Gustavo', 'Ribeiro', '3191180058', 'Rua das Acácias, 258', '10000001058', 'gustavo.ribeiro58@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (59, 'Helena', 'Carvalho', '3193940059', 'Avenida Brasil, 259', '10000001059', 'helena.carvalho59@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (60, 'Igor', 'Gomes', '3199210060', 'Rua Dom Pedro II, 260', '10000001060', 'igor.gomes60@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (61, 'Juliana', 'Martins', '3195900061', 'Rua XV de Novembro, 261', '10000001061', 'juliana.martins61@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (62, 'Kleber', 'Rocha', '3191940062', 'Alameda Santos, 262', '10000001062', 'kleber.rocha62@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (63, 'Laura', 'Barbosa', '3192600063', 'Rua das Flores, 263', '10000001063', 'laura.barbosa63@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (64, 'Miguel', 'Mendes', '3190450064', 'Rua Padre Anchieta, 264', '10000001064', 'miguel.mendes64@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (65, 'Nicole', 'Nunes', '3197250065', 'Avenida Paulista, 265', '10000001065', 'nicole.nunes65@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (66, 'Paulo', 'Araújo', '3194460066', 'Rua Minas Gerais, 266', '10000001066', 'paulo.araujo66@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (67, 'Renata', 'Cardoso', '3190010067', 'Rua Bahia, 267', '10000001067', 'renata.cardoso67@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (68, 'Samuel', 'Teixeira', '3195320068', 'Rua das Acácias, 268', '10000001068', 'samuel.teixeira68@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (69, 'Talita', 'Moreira', '3199470069', 'Avenida Brasil, 269', '10000001069', 'talita.moreira69@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (70, 'Vinícius', 'Correia', '3198250070', 'Rua Dom Pedro II, 270', '10000001070', 'vinicius.correia70@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (71, 'Yasmin', 'Dias', '3195510071', 'Rua XV de Novembro, 271', '10000001071', 'yasmin.dias71@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (72, 'Zeca', 'Freitas', '3197030072', 'Alameda Santos, 272', '10000001072', 'zeca.freitas72@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (73, 'Ana', 'Cavalcanti', '3197360073', 'Rua das Flores, 273', '10000001073', 'ana.cavalcanti73@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (74, 'Bruno', 'Batista', '3199620074', 'Rua Padre Anchieta, 274', '10000001074', 'bruno.batista74@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (75, 'Carla', 'Moura', '3197590075', 'Avenida Paulista, 275', '10000001075', 'carla.moura75@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (76, 'Daniel', 'Campos', '3197540076', 'Rua Minas Gerais, 276', '10000001076', 'daniel.campos76@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (77, 'Eduarda', 'Vieira', '3196860077', 'Rua Bahia, 277', '10000001077', 'eduarda.vieira77@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (78, 'Felipe', 'Andrade', '3192010078', 'Rua das Acácias, 278', '10000001078', 'felipe.andrade78@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (79, 'Gabriela', 'Silva', '3193720079', 'Avenida Brasil, 279', '10000001079', 'gabriela.silva79@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (80, 'Henrique', 'Santos', '3194410080', 'Rua Dom Pedro II, 280', '10000001080', 'henrique.santos80@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (81, 'Isabela', 'Oliveira', '3190710081', 'Rua XV de Novembro, 281', '10000001081', 'isabela.oliveira81@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (82, 'João', 'Souza', '3199710082', 'Alameda Santos, 282', '10000001082', 'joao.souza82@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (83, 'Larissa', 'Pereira', '3196800083', 'Rua das Flores, 283', '10000001083', 'larissa.pereira83@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (84, 'Marcos', 'Lima', '3199420084', 'Rua Padre Anchieta, 284', '10000001084', 'marcos.lima84@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (85, 'Natália', 'Costa', '3193380085', 'Avenida Paulista, 285', '10000001085', 'natalia.costa85@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (86, 'Otávio', 'Ferreira', '3196380086', 'Rua Minas Gerais, 286', '10000001086', 'otavio.ferreira86@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (87, 'Patrícia', 'Almeida', '3193210087', 'Rua Bahia, 287', '10000001087', 'patricia.almeida87@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (88, 'Rafael', 'Ribeiro', '3196790088', 'Rua das Acácias, 288', '10000001088', 'rafael.ribeiro88@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (89, 'Sofia', 'Carvalho', '3198680089', 'Avenida Brasil, 289', '10000001089', 'sofia.carvalho89@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (90, 'Thiago', 'Gomes', '3191270090', 'Rua Dom Pedro II, 290', '10000001090', 'thiago.gomes90@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (91, 'Vanessa', 'Martins', '3197370091', 'Rua XV de Novembro, 291', '10000001091', 'vanessa.martins91@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (92, 'William', 'Rocha', '3199210092', 'Alameda Santos, 292', '10000001092', 'william.rocha92@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (93, 'Beatriz', 'Barbosa', '3193070093', 'Rua das Flores, 293', '10000001093', 'beatriz.barbosa93@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (94, 'Caio', 'Mendes', '3195190094', 'Rua Padre Anchieta, 294', '10000001094', 'caio.mendes94@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (95, 'Débora', 'Nunes', '3193160095', 'Avenida Paulista, 295', '10000001095', 'debora.nunes95@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (96, 'Enzo', 'Araújo', '3196820096', 'Rua Minas Gerais, 296', '10000001096', 'enzo.araujo96@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (97, 'Fernanda', 'Cardoso', '3194180097', 'Rua Bahia, 297', '10000001097', 'fernanda.cardoso97@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (98, 'Gustavo', 'Teixeira', '3193340098', 'Rua das Acácias, 298', '10000001098', 'gustavo.teixeira98@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (99, 'Helena', 'Moreira', '3194120099', 'Avenida Brasil, 299', '10000001099', 'helena.moreira99@bibliotech.com.br');
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Phone, Address, CPF, Email) VALUES (100, 'Igor', 'Correia', '3197130100', 'Rua Dom Pedro II, 300', '10000001100', 'igor.correia100@bibliotech.com.br');


INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (1, 'Correios', '2193020001', 'correios1@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (2, 'Jadlog', '2195670002', 'jadlog2@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (3, 'Loggi', '2191300003', 'loggi3@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (4, 'Azul Cargo', '2191960004', 'azul.cargo4@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (5, 'Total Express', '2194300005', 'total.express5@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (6, 'Braspress', '2196800006', 'braspress6@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (7, 'FedEx Brasil', '2199620007', 'fedex.brasil7@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (8, 'DHL Express', '2193880008', 'dhl.express8@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (9, 'Sequoia Logística', '2196930009', 'sequoia.logistica9@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (10, 'Motoboy Local', '2197660010', 'motoboy.local10@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (11, 'Correios Unidade 2', '2199240011', 'correios.unidade.211@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (12, 'Jadlog Unidade 2', '2191780012', 'jadlog.unidade.212@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (13, 'Loggi Unidade 2', '2196300013', 'loggi.unidade.213@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (14, 'Azul Cargo Unidade 2', '2195820014', 'azul.cargo.unidade.214@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (15, 'Total Express Unidade 2', '2193080015', 'total.express.unidade.215@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (16, 'Braspress Unidade 2', '2194150016', 'braspress.unidade.216@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (17, 'FedEx Brasil Unidade 2', '2195610017', 'fedex.brasil.unidade.217@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (18, 'DHL Express Unidade 2', '2198530018', 'dhl.express.unidade.218@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (19, 'Sequoia Logística Unidade 2', '2190000019', 'sequoia.logistica.unidade.219@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (20, 'Motoboy Local Unidade 2', '2193110020', 'motoboy.local.unidade.220@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (21, 'Correios Unidade 3', '2192930021', 'correios.unidade.321@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (22, 'Jadlog Unidade 3', '2192150022', 'jadlog.unidade.322@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (23, 'Loggi Unidade 3', '2194400023', 'loggi.unidade.323@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (24, 'Azul Cargo Unidade 3', '2198040024', 'azul.cargo.unidade.324@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (25, 'Total Express Unidade 3', '2195930025', 'total.express.unidade.325@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (26, 'Braspress Unidade 3', '2196210026', 'braspress.unidade.326@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (27, 'FedEx Brasil Unidade 3', '2196700027', 'fedex.brasil.unidade.327@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (28, 'DHL Express Unidade 3', '2193290028', 'dhl.express.unidade.328@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (29, 'Sequoia Logística Unidade 3', '2194760029', 'sequoia.logistica.unidade.329@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (30, 'Motoboy Local Unidade 3', '2194520030', 'motoboy.local.unidade.330@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (31, 'Correios Unidade 4', '2194520031', 'correios.unidade.431@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (32, 'Jadlog Unidade 4', '2196910032', 'jadlog.unidade.432@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (33, 'Loggi Unidade 4', '2192180033', 'loggi.unidade.433@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (34, 'Azul Cargo Unidade 4', '2195230034', 'azul.cargo.unidade.434@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (35, 'Total Express Unidade 4', '2194840035', 'total.express.unidade.435@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (36, 'Braspress Unidade 4', '2198120036', 'braspress.unidade.436@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (37, 'FedEx Brasil Unidade 4', '2199220037', 'fedex.brasil.unidade.437@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (38, 'DHL Express Unidade 4', '2199820038', 'dhl.express.unidade.438@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (39, 'Sequoia Logística Unidade 4', '2198150039', 'sequoia.logistica.unidade.439@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (40, 'Motoboy Local Unidade 4', '2197530040', 'motoboy.local.unidade.440@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (41, 'Correios Unidade 5', '2191730041', 'correios.unidade.541@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (42, 'Jadlog Unidade 5', '2196740042', 'jadlog.unidade.542@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (43, 'Loggi Unidade 5', '2190860043', 'loggi.unidade.543@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (44, 'Azul Cargo Unidade 5', '2192900044', 'azul.cargo.unidade.544@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (45, 'Total Express Unidade 5', '2195270045', 'total.express.unidade.545@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (46, 'Braspress Unidade 5', '2196790046', 'braspress.unidade.546@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (47, 'FedEx Brasil Unidade 5', '2196480047', 'fedex.brasil.unidade.547@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (48, 'DHL Express Unidade 5', '2196340048', 'dhl.express.unidade.548@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (49, 'Sequoia Logística Unidade 5', '2193430049', 'sequoia.logistica.unidade.549@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (50, 'Motoboy Local Unidade 5', '2190950050', 'motoboy.local.unidade.550@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (51, 'Correios Unidade 6', '2198380051', 'correios.unidade.651@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (52, 'Jadlog Unidade 6', '2199740052', 'jadlog.unidade.652@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (53, 'Loggi Unidade 6', '2197690053', 'loggi.unidade.653@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (54, 'Azul Cargo Unidade 6', '2192400054', 'azul.cargo.unidade.654@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (55, 'Total Express Unidade 6', '2196880055', 'total.express.unidade.655@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (56, 'Braspress Unidade 6', '2193170056', 'braspress.unidade.656@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (57, 'FedEx Brasil Unidade 6', '2192300057', 'fedex.brasil.unidade.657@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (58, 'DHL Express Unidade 6', '2198250058', 'dhl.express.unidade.658@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (59, 'Sequoia Logística Unidade 6', '2192030059', 'sequoia.logistica.unidade.659@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (60, 'Motoboy Local Unidade 6', '2191500060', 'motoboy.local.unidade.660@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (61, 'Correios Unidade 7', '2190250061', 'correios.unidade.761@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (62, 'Jadlog Unidade 7', '2190470062', 'jadlog.unidade.762@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (63, 'Loggi Unidade 7', '2192500063', 'loggi.unidade.763@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (64, 'Azul Cargo Unidade 7', '2194860064', 'azul.cargo.unidade.764@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (65, 'Total Express Unidade 7', '2196250065', 'total.express.unidade.765@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (66, 'Braspress Unidade 7', '2198700066', 'braspress.unidade.766@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (67, 'FedEx Brasil Unidade 7', '2197860067', 'fedex.brasil.unidade.767@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (68, 'DHL Express Unidade 7', '2190740068', 'dhl.express.unidade.768@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (69, 'Sequoia Logística Unidade 7', '2194660069', 'sequoia.logistica.unidade.769@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (70, 'Motoboy Local Unidade 7', '2194240070', 'motoboy.local.unidade.770@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (71, 'Correios Unidade 8', '2199070071', 'correios.unidade.871@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (72, 'Jadlog Unidade 8', '2196440072', 'jadlog.unidade.872@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (73, 'Loggi Unidade 8', '2195890073', 'loggi.unidade.873@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (74, 'Azul Cargo Unidade 8', '2191990074', 'azul.cargo.unidade.874@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (75, 'Total Express Unidade 8', '2197350075', 'total.express.unidade.875@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (76, 'Braspress Unidade 8', '2197130076', 'braspress.unidade.876@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (77, 'FedEx Brasil Unidade 8', '2193930077', 'fedex.brasil.unidade.877@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (78, 'DHL Express Unidade 8', '2195060078', 'dhl.express.unidade.878@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (79, 'Sequoia Logística Unidade 8', '2194090079', 'sequoia.logistica.unidade.879@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (80, 'Motoboy Local Unidade 8', '2192490080', 'motoboy.local.unidade.880@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (81, 'Correios Unidade 9', '2191510081', 'correios.unidade.981@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (82, 'Jadlog Unidade 9', '2196710082', 'jadlog.unidade.982@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (83, 'Loggi Unidade 9', '2197040083', 'loggi.unidade.983@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (84, 'Azul Cargo Unidade 9', '2190050084', 'azul.cargo.unidade.984@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (85, 'Total Express Unidade 9', '2199140085', 'total.express.unidade.985@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (86, 'Braspress Unidade 9', '2197680086', 'braspress.unidade.986@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (87, 'FedEx Brasil Unidade 9', '2198810087', 'fedex.brasil.unidade.987@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (88, 'DHL Express Unidade 9', '2197880088', 'dhl.express.unidade.988@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (89, 'Sequoia Logística Unidade 9', '2199060089', 'sequoia.logistica.unidade.989@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (90, 'Motoboy Local Unidade 9', '2191090090', 'motoboy.local.unidade.990@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (91, 'Correios Unidade 10', '2197970091', 'correios.unidade.1091@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (92, 'Jadlog Unidade 10', '2194350092', 'jadlog.unidade.1092@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (93, 'Loggi Unidade 10', '2192240093', 'loggi.unidade.1093@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (94, 'Azul Cargo Unidade 10', '2191800094', 'azul.cargo.unidade.1094@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (95, 'Total Express Unidade 10', '2198230095', 'total.express.unidade.1095@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (96, 'Braspress Unidade 10', '2199800096', 'braspress.unidade.1096@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (97, 'FedEx Brasil Unidade 10', '2197120097', 'fedex.brasil.unidade.1097@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (98, 'DHL Express Unidade 10', '2195300098', 'dhl.express.unidade.1098@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (99, 'Sequoia Logística Unidade 10', '2194750099', 'sequoia.logistica.unidade.1099@logistica.com.br');
INSERT INTO SHIPPERS (ShipperID, ShipperName, Phone, Email) VALUES (100, 'Motoboy Local Unidade 10', '2190510100', 'motoboy.local.unidade.10100@logistica.com.br');


INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (1, 'Memórias Póstumas de Brás Cubas', 1, 1, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (2, 'Dom Casmurro', 2, 2, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (3, 'O Cortiço', 3, 3, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (4, 'Capitães da Areia', 4, 4, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (5, 'Vidas Secas', 5, 5, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (6, 'A Hora da Estrela', 6, 6, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (7, 'Grande Sertão: Veredas', 7, 7, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (8, 'Iracema', 8, 8, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (9, 'O Guarani', 9, 9, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (10, 'Quincas Borba', 10, 10, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (11, '1984', 11, 11, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (12, 'A Revolução dos Bichos', 12, 12, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (13, 'O Pequeno Príncipe', 13, 13, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (14, 'Orgulho e Preconceito', 14, 14, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (15, 'Jane Eyre', 15, 15, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (16, 'O Morro dos Ventos Uivantes', 16, 16, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (17, 'Crime e Castigo', 17, 17, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (18, 'Os Miseráveis', 18, 18, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (19, 'O Conde de Monte Cristo', 19, 19, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (20, 'Drácula', 20, 20, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (21, 'Frankenstein', 21, 21, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (22, 'Duna', 22, 22, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (23, 'Fundação', 23, 23, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (24, 'Neuromancer', 24, 24, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (25, 'Eu, Robô', 25, 25, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (26, 'Fahrenheit 451', 26, 26, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (27, 'Admirável Mundo Novo', 27, 27, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (28, 'A Máquina do Tempo', 28, 28, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (29, 'Solaris', 29, 29, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (30, 'O Fim da Infância', 30, 30, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (31, 'Harry Potter e a Pedra Filosofal', 31, 31, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (32, 'O Hobbit', 32, 32, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (33, 'O Senhor dos Anéis', 33, 33, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (34, 'As Crônicas de Nárnia', 34, 34, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (35, 'A Bússola de Ouro', 35, 35, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (36, 'Percy Jackson e o Ladrão de Raios', 36, 36, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (37, 'A Guerra dos Tronos', 37, 37, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (38, 'O Nome do Vento', 38, 38, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (39, 'Mistborn', 39, 39, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (40, 'A Roda do Tempo', 40, 40, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (41, 'O Código Da Vinci', 41, 41, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (42, 'Garota Exemplar', 42, 42, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (43, 'Assassinato no Expresso do Oriente', 43, 43, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (44, 'O Silêncio dos Inocentes', 44, 44, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (45, 'A Paciente Silenciosa', 45, 45, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (46, 'It: A Coisa', 46, 46, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (47, 'O Iluminado', 47, 47, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (48, 'Cemitério Maldito', 48, 48, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (49, 'A Assombração da Casa da Colina', 49, 49, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (50, 'Coraline', 50, 50, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (51, 'Steve Jobs', 51, 51, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (52, 'Longa Caminhada até a Liberdade', 52, 52, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (53, 'Minha História', 53, 53, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (54, 'Anne Frank: O Diário', 54, 54, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (55, 'Leonardo da Vinci', 55, 55, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (56, 'Sapiens', 56, 56, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (57, 'Homo Deus', 57, 57, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (58, 'Uma Breve História do Tempo', 58, 58, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (59, 'O Mundo de Sofia', 59, 59, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (60, 'A República', 60, 60, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (61, 'Ética a Nicômaco', 61, 61, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (62, 'Meditações', 62, 62, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (63, 'O Príncipe', 63, 63, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (64, 'O Capital', 64, 64, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (65, 'A Riqueza das Nações', 65, 65, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (66, 'Rápido e Devagar', 66, 66, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (67, 'Inteligência Emocional', 67, 67, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (68, 'Mindset', 68, 68, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (69, 'O Poder do Hábito', 69, 69, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (70, 'Hábitos Atômicos', 70, 70, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (71, 'Pedagogia do Oprimido', 71, 71, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (72, 'Didática', 72, 72, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (73, 'Como Aprendemos', 73, 73, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (74, 'Ensino Híbrido', 74, 74, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (75, 'Avaliação da Aprendizagem', 75, 75, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (76, 'Clean Code', 76, 76, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (77, 'Código Limpo no Python', 77, 77, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (78, 'Algoritmos: Teoria e Prática', 78, 78, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (79, 'Introdução à Programação', 79, 79, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (80, 'Banco de Dados', 80, 80, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (81, 'Engenharia de Software', 81, 81, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (82, 'Redes de Computadores', 82, 82, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (83, 'Sistemas Operacionais', 83, 83, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (84, 'Inteligência Artificial', 84, 84, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (85, 'Segurança da Informação', 85, 85, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (86, 'Pai Rico, Pai Pobre', 86, 86, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (87, 'O Homem Mais Rico da Babilônia', 87, 87, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (88, 'A Startup Enxuta', 88, 88, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (89, 'Empresas Feitas para Vencer', 89, 89, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (90, 'De Zero a Um', 90, 90, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (91, 'O Menino Maluquinho', 91, 91, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (92, 'Reinações de Narizinho', 92, 92, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (93, 'A Bolsa Amarela', 93, 93, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (94, 'Marcelo, Marmelo, Martelo', 94, 94, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (95, 'O Meu Pé de Laranja Lima', 95, 95, 'Capa levemente desgastada');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (96, 'Extraordinário', 96, 96, 'Novo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (97, 'A Culpa é das Estrelas', 97, 97, 'Seminovo');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (98, 'Jogos Vorazes', 98, 98, 'Bom estado');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (99, 'Divergente', 99, 99, 'Com marcas de uso');
INSERT INTO BOOKS (BookID, BOOKNAME, CategoryID, SupplierID, BookCondition) VALUES (100, 'Cidade dos Ossos', 100, 100, 'Capa levemente desgastada');


INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (1, '2026-01-06 10:00:00', '2026-01-21 16:00:00', 10.00, 1, 2, 3);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (2, '2026-01-07 10:00:00', '2026-01-28 16:00:00', 8.00, 2, 4, 6);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (3, '2026-01-08 10:00:00', '2026-01-22 16:00:00', 10.00, 3, 6, 9);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (4, '2026-01-09 10:00:00', '2026-01-28 16:00:00', 15.00, 4, 8, 12);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (5, '2026-01-10 10:00:00', '2026-01-27 16:00:00', 18.00, 5, 10, 15);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (6, '2026-01-11 10:00:00', '2026-01-26 16:00:00', 18.00, 6, 12, 18);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (7, '2026-01-12 10:00:00', '2026-01-24 16:00:00', 15.00, 7, 14, 21);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (8, '2026-01-13 10:00:00', '2026-01-29 16:00:00', 20.00, 8, 16, 24);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (9, '2026-01-14 10:00:00', '2026-02-04 16:00:00', 18.00, 9, 18, 27);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (10, '2026-01-15 10:00:00', '2026-01-28 16:00:00', 18.00, 10, 20, 30);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (11, '2026-01-16 10:00:00', '2026-01-30 16:00:00', 10.00, 11, 22, 33);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (12, '2026-01-17 10:00:00', '2026-02-04 16:00:00', 15.00, 12, 24, 36);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (13, '2026-01-18 10:00:00', '2026-02-01 16:00:00', 12.50, 13, 26, 39);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (14, '2026-01-19 10:00:00', '2026-02-07 16:00:00', 10.00, 14, 28, 42);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (15, '2026-01-20 10:00:00', '2026-02-09 16:00:00', 20.00, 15, 30, 45);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (16, '2026-01-21 10:00:00', '2026-02-01 16:00:00', 18.00, 16, 32, 48);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (17, '2026-01-22 10:00:00', '2026-02-05 16:00:00', 20.00, 17, 34, 51);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (18, '2026-01-23 10:00:00', '2026-02-02 16:00:00', 12.50, 18, 36, 54);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (19, '2026-01-24 10:00:00', '2026-02-07 16:00:00', 8.00, 19, 38, 57);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (20, '2026-01-25 10:00:00', '2026-02-12 16:00:00', 12.50, 20, 40, 60);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (21, '2026-01-26 10:00:00', '2026-02-05 16:00:00', 12.50, 21, 42, 63);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (22, '2026-01-27 10:00:00', '2026-02-08 16:00:00', 12.50, 22, 44, 66);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (23, '2026-01-28 10:00:00', '2026-02-18 16:00:00', 18.00, 23, 46, 69);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (24, '2026-01-29 10:00:00', '2026-02-06 16:00:00', 10.00, 24, 48, 72);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (25, '2026-01-30 10:00:00', '2026-02-08 16:00:00', 10.00, 25, 50, 75);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (26, '2026-01-31 10:00:00', '2026-02-13 16:00:00', 20.00, 26, 52, 78);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (27, '2026-02-01 10:00:00', '2026-02-10 16:00:00', 20.00, 27, 54, 81);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (28, '2026-02-02 10:00:00', '2026-02-12 16:00:00', 8.00, 28, 56, 84);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (29, '2026-02-03 10:00:00', '2026-02-16 16:00:00', 15.00, 29, 58, 87);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (30, '2026-02-04 10:00:00', '2026-02-16 16:00:00', 18.00, 30, 60, 90);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (31, '2026-02-05 10:00:00', '2026-02-19 16:00:00', 15.00, 31, 62, 93);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (32, '2026-02-06 10:00:00', '2026-02-13 16:00:00', 10.00, 32, 64, 96);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (33, '2026-02-07 10:00:00', '2026-02-27 16:00:00', 15.00, 33, 66, 99);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (34, '2026-02-08 10:00:00', '2026-02-21 16:00:00', 18.00, 34, 68, 2);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (35, '2026-02-09 10:00:00', '2026-02-27 16:00:00', 8.00, 35, 70, 5);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (36, '2026-02-10 10:00:00', '2026-03-02 16:00:00', 18.00, 36, 72, 8);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (37, '2026-02-11 10:00:00', '2026-02-24 16:00:00', 15.00, 37, 74, 11);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (38, '2026-02-12 10:00:00', '2026-02-19 16:00:00', 12.50, 38, 76, 14);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (39, '2026-02-13 10:00:00', '2026-02-24 16:00:00', 15.00, 39, 78, 17);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (40, '2026-02-14 10:00:00', '2026-03-06 16:00:00', 15.00, 40, 80, 20);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (41, '2026-02-15 10:00:00', '2026-03-02 16:00:00', 20.00, 41, 82, 23);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (42, '2026-02-16 10:00:00', '2026-03-06 16:00:00', 18.00, 42, 84, 26);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (43, '2026-02-17 10:00:00', '2026-03-08 16:00:00', 18.00, 43, 86, 29);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (44, '2026-02-18 10:00:00', '2026-03-11 16:00:00', 10.00, 44, 88, 32);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (45, '2026-02-19 10:00:00', '2026-03-05 16:00:00', 10.00, 45, 90, 35);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (46, '2026-02-20 10:00:00', '2026-03-03 16:00:00', 15.00, 46, 92, 38);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (47, '2026-02-21 10:00:00', '2026-03-07 16:00:00', 8.00, 47, 94, 41);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (48, '2026-02-22 10:00:00', '2026-03-07 16:00:00', 12.50, 48, 96, 44);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (49, '2026-02-23 10:00:00', '2026-03-12 16:00:00', 20.00, 49, 98, 47);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (50, '2026-02-24 10:00:00', '2026-03-15 16:00:00', 15.00, 50, 100, 50);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (51, '2026-02-25 10:00:00', '2026-03-15 16:00:00', 10.00, 51, 2, 53);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (52, '2026-02-26 10:00:00', '2026-03-18 16:00:00', 15.00, 52, 4, 56);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (53, '2026-02-27 10:00:00', '2026-03-20 16:00:00', 10.00, 53, 6, 59);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (54, '2026-02-28 10:00:00', '2026-03-16 16:00:00', 18.00, 54, 8, 62);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (55, '2026-03-01 10:00:00', '2026-03-08 16:00:00', 15.00, 55, 10, 65);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (56, '2026-03-02 10:00:00', '2026-03-18 16:00:00', 18.00, 56, 12, 68);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (57, '2026-03-03 10:00:00', '2026-03-20 16:00:00', 8.00, 57, 14, 71);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (58, '2026-03-04 10:00:00', '2026-03-12 16:00:00', 20.00, 58, 16, 74);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (59, '2026-03-05 10:00:00', '2026-03-18 16:00:00', 10.00, 59, 18, 77);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (60, '2026-03-06 10:00:00', '2026-03-26 16:00:00', 15.00, 60, 20, 80);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (61, '2026-03-07 10:00:00', '2026-03-16 16:00:00', 8.00, 61, 22, 83);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (62, '2026-03-08 10:00:00', '2026-03-19 16:00:00', 15.00, 62, 24, 86);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (63, '2026-03-09 10:00:00', '2026-03-21 16:00:00', 10.00, 63, 26, 89);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (64, '2026-03-10 10:00:00', '2026-03-24 16:00:00', 12.50, 64, 28, 92);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (65, '2026-03-11 10:00:00', '2026-03-23 16:00:00', 15.00, 65, 30, 95);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (66, '2026-03-12 10:00:00', '2026-03-23 16:00:00', 15.00, 66, 32, 98);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (67, '2026-03-13 10:00:00', '2026-03-24 16:00:00', 8.00, 67, 34, 1);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (68, '2026-03-14 10:00:00', '2026-03-28 16:00:00', 8.00, 68, 36, 4);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (69, '2026-03-15 10:00:00', '2026-04-02 16:00:00', 18.00, 69, 38, 7);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (70, '2026-03-16 10:00:00', '2026-03-23 16:00:00', 12.50, 70, 40, 10);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (71, '2026-03-17 10:00:00', '2026-03-27 16:00:00', 20.00, 71, 42, 13);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (72, '2026-03-18 10:00:00', '2026-03-26 16:00:00', 20.00, 72, 44, 16);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (73, '2026-03-19 10:00:00', '2026-03-26 16:00:00', 8.00, 73, 46, 19);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (74, '2026-03-20 10:00:00', '2026-03-30 16:00:00', 10.00, 74, 48, 22);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (75, '2026-03-21 10:00:00', '2026-04-10 16:00:00', 8.00, 75, 50, 25);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (76, '2026-03-22 10:00:00', '2026-04-07 16:00:00', 10.00, 76, 52, 28);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (77, '2026-03-23 10:00:00', '2026-04-02 16:00:00', 10.00, 77, 54, 31);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (78, '2026-03-24 10:00:00', '2026-04-07 16:00:00', 20.00, 78, 56, 34);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (79, '2026-03-25 10:00:00', '2026-04-02 16:00:00', 18.00, 79, 58, 37);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (80, '2026-03-26 10:00:00', '2026-04-05 16:00:00', 15.00, 80, 60, 40);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (81, '2026-03-27 10:00:00', '2026-04-14 16:00:00', 12.50, 81, 62, 43);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (82, '2026-03-28 10:00:00', '2026-04-16 16:00:00', 12.50, 82, 64, 46);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (83, '2026-03-29 10:00:00', '2026-04-07 16:00:00', 18.00, 83, 66, 49);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (84, '2026-03-30 10:00:00', '2026-04-15 16:00:00', 20.00, 84, 68, 52);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (85, '2026-03-31 10:00:00', '2026-04-18 16:00:00', 8.00, 85, 70, 55);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (86, '2026-04-01 10:00:00', '2026-04-20 16:00:00', 10.00, 86, 72, 58);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (87, '2026-04-02 10:00:00', '2026-04-13 16:00:00', 8.00, 87, 74, 61);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (88, '2026-04-03 10:00:00', '2026-04-19 16:00:00', 8.00, 88, 76, 64);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (89, '2026-04-04 10:00:00', '2026-04-25 16:00:00', 12.50, 89, 78, 67);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (90, '2026-04-05 10:00:00', '2026-04-21 16:00:00', 20.00, 90, 80, 70);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (91, '2026-04-06 10:00:00', '2026-04-27 16:00:00', 15.00, 91, 82, 73);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (92, '2026-04-07 10:00:00', '2026-04-20 16:00:00', 20.00, 92, 84, 76);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (93, '2026-04-08 10:00:00', '2026-04-18 16:00:00', 8.00, 93, 86, 79);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (94, '2026-04-09 10:00:00', '2026-04-25 16:00:00', 20.00, 94, 88, 82);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (95, '2026-04-10 10:00:00', '2026-04-30 16:00:00', 20.00, 95, 90, 85);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (96, '2026-04-11 10:00:00', '2026-04-21 16:00:00', 8.00, 96, 92, 88);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (97, '2026-04-12 10:00:00', '2026-04-30 16:00:00', 12.50, 97, 94, 91);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (98, '2026-04-13 10:00:00', '2026-05-03 16:00:00', 20.00, 98, 96, 94);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (99, '2026-04-14 10:00:00', '2026-04-30 16:00:00', 8.00, 99, 98, 97);
INSERT INTO BORROWING (BorrowingID, LoanDATE, CollectionDATE, Price, CustomerID, BookID, EmployeeID) VALUES (100, '2026-04-15 10:00:00', '2026-05-04 16:00:00', 18.00, 100, 100, 100);


INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (1, 5, 7, 4, 6, '2026-02-02');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (2, 10, 14, 8, 12, '2026-02-03');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (3, 15, 21, 12, 18, '2026-02-04');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (4, 20, 28, 16, 24, '2026-02-05');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (5, 25, 35, 20, 30, '2026-02-06');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (6, 30, 42, 24, 36, '2026-02-07');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (7, 35, 49, 28, 42, '2026-02-08');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (8, 40, 56, 32, 48, '2026-02-09');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (9, 45, 63, 36, 54, '2026-02-10');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (10, 50, 70, 40, 60, '2026-02-11');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (11, 55, 77, 44, 66, '2026-02-12');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (12, 60, 84, 48, 72, '2026-02-13');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (13, 65, 91, 52, 78, '2026-02-14');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (14, 70, 98, 56, 84, '2026-02-15');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (15, 75, 5, 60, 90, '2026-02-16');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (16, 80, 12, 64, 96, '2026-02-17');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (17, 85, 19, 68, 2, '2026-02-18');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (18, 90, 26, 72, 8, '2026-02-19');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (19, 95, 33, 76, 14, '2026-02-20');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (20, 100, 40, 80, 20, '2026-02-21');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (21, 5, 47, 84, 26, '2026-02-22');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (22, 10, 54, 88, 32, '2026-02-23');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (23, 15, 61, 92, 38, '2026-02-24');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (24, 20, 68, 96, 44, '2026-02-25');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (25, 25, 75, 100, 50, '2026-02-26');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (26, 30, 82, 4, 56, '2026-02-27');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (27, 35, 89, 8, 62, '2026-02-28');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (28, 40, 96, 12, 68, '2026-03-01');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (29, 45, 3, 16, 74, '2026-03-02');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (30, 50, 10, 20, 80, '2026-03-03');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (31, 55, 17, 24, 86, '2026-03-04');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (32, 60, 24, 28, 92, '2026-03-05');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (33, 65, 31, 32, 98, '2026-03-06');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (34, 70, 38, 36, 4, '2026-03-07');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (35, 75, 45, 40, 10, '2026-03-08');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (36, 80, 52, 44, 16, '2026-03-09');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (37, 85, 59, 48, 22, '2026-03-10');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (38, 90, 66, 52, 28, '2026-03-11');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (39, 95, 73, 56, 34, '2026-03-12');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (40, 100, 80, 60, 40, '2026-03-13');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (41, 5, 87, 64, 46, '2026-03-14');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (42, 10, 94, 68, 52, '2026-03-15');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (43, 15, 1, 72, 58, '2026-03-16');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (44, 20, 8, 76, 64, '2026-03-17');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (45, 25, 15, 80, 70, '2026-03-18');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (46, 30, 22, 84, 76, '2026-03-19');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (47, 35, 29, 88, 82, '2026-03-20');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (48, 40, 36, 92, 88, '2026-03-21');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (49, 45, 43, 96, 94, '2026-03-22');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (50, 50, 50, 100, 100, '2026-03-23');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (51, 55, 57, 4, 6, '2026-03-24');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (52, 60, 64, 8, 12, '2026-03-25');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (53, 65, 71, 12, 18, '2026-03-26');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (54, 70, 78, 16, 24, '2026-03-27');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (55, 75, 85, 20, 30, '2026-03-28');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (56, 80, 92, 24, 36, '2026-03-29');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (57, 85, 99, 28, 42, '2026-03-30');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (58, 90, 6, 32, 48, '2026-03-31');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (59, 95, 13, 36, 54, '2026-04-01');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (60, 100, 20, 40, 60, '2026-04-02');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (61, 5, 27, 44, 66, '2026-04-03');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (62, 10, 34, 48, 72, '2026-04-04');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (63, 15, 41, 52, 78, '2026-04-05');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (64, 20, 48, 56, 84, '2026-04-06');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (65, 25, 55, 60, 90, '2026-04-07');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (66, 30, 62, 64, 96, '2026-04-08');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (67, 35, 69, 68, 2, '2026-04-09');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (68, 40, 76, 72, 8, '2026-04-10');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (69, 45, 83, 76, 14, '2026-04-11');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (70, 50, 90, 80, 20, '2026-04-12');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (71, 55, 97, 84, 26, '2026-04-13');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (72, 60, 4, 88, 32, '2026-04-14');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (73, 65, 11, 92, 38, '2026-04-15');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (74, 70, 18, 96, 44, '2026-04-16');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (75, 75, 25, 100, 50, '2026-04-17');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (76, 80, 32, 4, 56, '2026-04-18');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (77, 85, 39, 8, 62, '2026-04-19');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (78, 90, 46, 12, 68, '2026-04-20');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (79, 95, 53, 16, 74, '2026-04-21');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (80, 100, 60, 20, 80, '2026-04-22');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (81, 5, 67, 24, 86, '2026-04-23');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (82, 10, 74, 28, 92, '2026-04-24');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (83, 15, 81, 32, 98, '2026-04-25');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (84, 20, 88, 36, 4, '2026-04-26');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (85, 25, 95, 40, 10, '2026-04-27');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (86, 30, 2, 44, 16, '2026-04-28');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (87, 35, 9, 48, 22, '2026-04-29');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (88, 40, 16, 52, 28, '2026-04-30');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (89, 45, 23, 56, 34, '2026-05-01');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (90, 50, 30, 60, 40, '2026-05-02');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (91, 55, 37, 64, 46, '2026-05-03');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (92, 60, 44, 68, 52, '2026-05-04');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (93, 65, 51, 72, 58, '2026-05-05');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (94, 70, 58, 76, 64, '2026-05-06');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (95, 75, 65, 80, 70, '2026-05-07');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (96, 80, 72, 84, 76, '2026-05-08');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (97, 85, 79, 88, 82, '2026-05-09');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (98, 90, 86, 92, 88, '2026-05-10');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (99, 95, 93, 96, 94, '2026-05-11');
INSERT INTO Orders (OrderID, BookID, CustomerID, EmployeeID, ShipperID, OrderDate) VALUES (100, 100, 100, 100, 100, '2026-05-12');


INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (1, 20.00, 1, 1, 2);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (2, 3.50, 2, 2, 4);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (3, 7.50, 3, 3, 6);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (4, 12.00, 4, 4, 8);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (5, 10.00, 5, 5, 10);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (6, 15.00, 6, 6, 12);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (7, 7.50, 7, 7, 14);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (8, 3.50, 8, 8, 16);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (9, 12.00, 9, 9, 18);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (10, 15.00, 10, 10, 20);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (11, 7.50, 11, 11, 22);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (12, 3.50, 12, 12, 24);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (13, 20.00, 13, 13, 26);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (14, 10.00, 14, 14, 28);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (15, 20.00, 15, 15, 30);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (16, 10.00, 16, 16, 32);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (17, 3.50, 17, 17, 34);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (18, 10.00, 18, 18, 36);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (19, 7.50, 19, 19, 38);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (20, 15.00, 20, 20, 40);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (21, 20.00, 21, 21, 42);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (22, 10.00, 22, 22, 44);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (23, 15.00, 23, 23, 46);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (24, 5.00, 24, 24, 48);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (25, 10.00, 25, 25, 50);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (26, 5.00, 26, 26, 52);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (27, 15.00, 27, 27, 54);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (28, 12.00, 28, 28, 56);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (29, 15.00, 29, 29, 58);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (30, 7.50, 30, 30, 60);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (31, 12.00, 31, 31, 62);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (32, 20.00, 32, 32, 64);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (33, 12.00, 33, 33, 66);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (34, 20.00, 34, 34, 68);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (35, 10.00, 35, 35, 70);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (36, 10.00, 36, 36, 72);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (37, 10.00, 37, 37, 74);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (38, 20.00, 38, 38, 76);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (39, 15.00, 39, 39, 78);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (40, 12.00, 40, 40, 80);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (41, 7.50, 41, 41, 82);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (42, 7.50, 42, 42, 84);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (43, 20.00, 43, 43, 86);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (44, 5.00, 44, 44, 88);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (45, 20.00, 45, 45, 90);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (46, 3.50, 46, 46, 92);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (47, 7.50, 47, 47, 94);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (48, 10.00, 48, 48, 96);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (49, 5.00, 49, 49, 98);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (50, 20.00, 50, 50, 100);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (51, 10.00, 51, 51, 2);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (52, 12.00, 52, 52, 4);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (53, 12.00, 53, 53, 6);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (54, 15.00, 54, 54, 8);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (55, 10.00, 55, 55, 10);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (56, 7.50, 56, 56, 12);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (57, 3.50, 57, 57, 14);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (58, 10.00, 58, 58, 16);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (59, 20.00, 59, 59, 18);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (60, 7.50, 60, 60, 20);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (61, 5.00, 61, 61, 22);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (62, 10.00, 62, 62, 24);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (63, 5.00, 63, 63, 26);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (64, 7.50, 64, 64, 28);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (65, 20.00, 65, 65, 30);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (66, 7.50, 66, 66, 32);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (67, 7.50, 67, 67, 34);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (68, 7.50, 68, 68, 36);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (69, 12.00, 69, 69, 38);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (70, 15.00, 70, 70, 40);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (71, 7.50, 71, 71, 42);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (72, 12.00, 72, 72, 44);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (73, 3.50, 73, 73, 46);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (74, 12.00, 74, 74, 48);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (75, 5.00, 75, 75, 50);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (76, 3.50, 76, 76, 52);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (77, 5.00, 77, 77, 54);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (78, 15.00, 78, 78, 56);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (79, 10.00, 79, 79, 58);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (80, 10.00, 80, 80, 60);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (81, 12.00, 81, 81, 62);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (82, 20.00, 82, 82, 64);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (83, 5.00, 83, 83, 66);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (84, 15.00, 84, 84, 68);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (85, 10.00, 85, 85, 70);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (86, 15.00, 86, 86, 72);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (87, 15.00, 87, 87, 74);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (88, 10.00, 88, 88, 76);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (89, 10.00, 89, 89, 78);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (90, 20.00, 90, 90, 80);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (91, 3.50, 91, 91, 82);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (92, 3.50, 92, 92, 84);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (93, 7.50, 93, 93, 86);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (94, 5.00, 94, 94, 88);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (95, 10.00, 95, 95, 90);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (96, 15.00, 96, 96, 92);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (97, 5.00, 97, 97, 94);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (98, 7.50, 98, 98, 96);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (99, 15.00, 99, 99, 98);
INSERT INTO FINES (FineID, Value, CustomerID, BorrowingID, BookID) VALUES (100, 12.00, 100, 100, 100);


USE Bibliotech;




ALTER TABLE CUSTOMERS
ADD COLUMN CustomerStatus VARCHAR(20) DEFAULT 'ACTIVE';

ALTER TABLE EMPLOYEES
ADD COLUMN EmployeeStatus VARCHAR(20) DEFAULT 'ACTIVE';

ALTER TABLE SUPPLIERS
ADD COLUMN SupplierStatus VARCHAR(20) DEFAULT 'ACTIVE';

ALTER TABLE SHIPPERS
ADD COLUMN ShipperStatus VARCHAR(20) DEFAULT 'ACTIVE';

ALTER TABLE Categories
ADD COLUMN CategoryStatus VARCHAR(20) DEFAULT 'ACTIVE';

ALTER TABLE BOOKS
ADD COLUMN Available BOOLEAN DEFAULT TRUE;

ALTER TABLE BORROWING
ADD COLUMN BorrowingStatus VARCHAR(20) DEFAULT 'OPEN';

ALTER TABLE Orders
ADD COLUMN OrderStatus VARCHAR(20) DEFAULT 'OPEN';

ALTER TABLE FINES
ADD COLUMN Paid BOOLEAN DEFAULT FALSE;



DELIMITER $$



DROP PROCEDURE IF EXISTS sp_ConsultarCliente $$

CREATE PROCEDURE sp_ConsultarCliente(
    IN p_CustomerID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Borrowings INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM CUSTOMERS
    WHERE CustomerID = p_CustomerID;

    IF v_Exists = 0 THEN

        SELECT 'Cliente não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Borrowings
        FROM BORROWING b
        INNER JOIN CUSTOMERS c
            ON b.CustomerID = c.CustomerID
        WHERE c.CustomerID = p_CustomerID;

        IF v_Borrowings > 0 THEN

            SELECT
                c.CustomerID,
                c.CustomerName,
                c.Phone,
                c.Email,
                c.CustomerStatus,
                v_Borrowings AS TotalEmprestimos
            FROM CUSTOMERS c
            WHERE c.CustomerID = p_CustomerID;

        ELSE

            SELECT
                c.CustomerID,
                c.CustomerName,
                c.Phone,
                c.Email,
                c.CustomerStatus,
                0 AS TotalEmprestimos
            FROM CUSTOMERS c
            WHERE c.CustomerID = p_CustomerID;

        END IF;

    END IF;

END $$




DROP PROCEDURE IF EXISTS sp_ConsultarFuncionario $$

CREATE PROCEDURE sp_ConsultarFuncionario(
    IN p_EmployeeID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Borrowings INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM EMPLOYEES
    WHERE EmployeeID = p_EmployeeID;

    IF v_Exists = 0 THEN

        SELECT 'Funcionário não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Borrowings
        FROM BORROWING b
        INNER JOIN EMPLOYEES e
            ON b.EmployeeID = e.EmployeeID
        WHERE e.EmployeeID = p_EmployeeID;

        SELECT
            e.EmployeeID,
            e.FirstName,
            e.LastName,
            e.Phone,
            e.Email,
            e.EmployeeStatus,
            v_Borrowings AS TotalEmprestimos
        FROM EMPLOYEES e
        WHERE e.EmployeeID = p_EmployeeID;

    END IF;

END $$



DROP PROCEDURE IF EXISTS sp_ConsultarFornecedor $$

CREATE PROCEDURE sp_ConsultarFornecedor(
    IN p_SupplierID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Books INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM SUPPLIERS
    WHERE SupplierID = p_SupplierID;

    IF v_Exists = 0 THEN

        SELECT 'Fornecedor não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Books
        FROM BOOKS b
        INNER JOIN SUPPLIERS s
            ON b.SupplierID = s.SupplierID
        WHERE s.SupplierID = p_SupplierID;

        IF v_Books > 0 THEN

            SELECT
                s.SupplierID,
                s.SupplierName,
                s.ContactName,
                s.Phone,
                s.Email,
                s.SupplierStatus,
                v_Books AS TotalLivros
            FROM SUPPLIERS s
            WHERE s.SupplierID = p_SupplierID;

        ELSE

            SELECT
                s.SupplierID,
                s.SupplierName,
                s.ContactName,
                s.Phone,
                s.Email,
                s.SupplierStatus,
                0 AS TotalLivros
            FROM SUPPLIERS s
            WHERE s.SupplierID = p_SupplierID;

        END IF;

    END IF;

END $$




DROP PROCEDURE IF EXISTS sp_ConsultarTransportadora $$

CREATE PROCEDURE sp_ConsultarTransportadora(
    IN p_ShipperID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Orders INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM SHIPPERS
    WHERE ShipperID = p_ShipperID;

    IF v_Exists = 0 THEN

        SELECT 'Transportadora não encontrada.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Orders
        FROM Orders o
        INNER JOIN SHIPPERS s
            ON o.ShipperID = s.ShipperID
        WHERE s.ShipperID = p_ShipperID;

        SELECT
            s.ShipperID,
            s.ShipperName,
            s.Phone,
            s.Email,
            s.ShipperStatus,
            v_Orders AS TotalPedidos
        FROM SHIPPERS s
        WHERE s.ShipperID = p_ShipperID;

    END IF;

END $$




DROP PROCEDURE IF EXISTS sp_ConsultarCategoria $$

CREATE PROCEDURE sp_ConsultarCategoria(
    IN p_CategoryID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Books INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM Categories
    WHERE CategoryID = p_CategoryID;

    IF v_Exists = 0 THEN

        SELECT 'Categoria não encontrada.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Books
        FROM BOOKS b
        INNER JOIN Categories c
            ON b.CategoryID = c.CategoryID
        WHERE c.CategoryID = p_CategoryID;

        IF v_Books > 0 THEN

            SELECT
                c.CategoryID,
                c.CategoryName,
                c.Description,
                c.CategoryStatus,
                v_Books AS TotalLivros
            FROM Categories c
            WHERE c.CategoryID = p_CategoryID;

        ELSE

            SELECT
                c.CategoryID,
                c.CategoryName,
                c.Description,
                c.CategoryStatus,
                0 AS TotalLivros
            FROM Categories c
            WHERE c.CategoryID = p_CategoryID;

        END IF;

    END IF;

END $$



DROP PROCEDURE IF EXISTS sp_ConsultarLivro $$

CREATE PROCEDURE sp_ConsultarLivro(
    IN p_BookID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Borrowings INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM BOOKS
    WHERE BookID = p_BookID;

    IF v_Exists = 0 THEN

        SELECT 'Livro não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Borrowings
        FROM BORROWING b
        INNER JOIN BOOKS bk
            ON b.BookID = bk.BookID
        WHERE bk.BookID = p_BookID;

        SELECT
            bk.BookID,
            bk.BOOKNAME,
            c.CategoryName,
            s.SupplierName,
            bk.BookCondition,
            bk.Available,
            v_Borrowings AS TotalEmprestimos
        FROM BOOKS bk
        INNER JOIN Categories c
            ON bk.CategoryID = c.CategoryID
        INNER JOIN SUPPLIERS s
            ON bk.SupplierID = s.SupplierID
        WHERE bk.BookID = p_BookID;

    END IF;

END $$




DROP PROCEDURE IF EXISTS sp_FinalizarEmprestimo $$

CREATE PROCEDURE sp_FinalizarEmprestimo(
    IN p_BorrowingID INT,
    IN p_CollectionDate DATETIME
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_BookID INT;
    DECLARE v_CustomerName VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SELECT
            'Erro ao finalizar empréstimo. Operação revertida.'
            AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_Exists
    FROM BORROWING
    WHERE BorrowingID = p_BorrowingID;

    IF v_Exists = 0 THEN

        SELECT 'Empréstimo não encontrado.' AS Mensagem;

    ELSE

        SELECT
            b.BookID,
            c.CustomerName
        INTO
            v_BookID,
            v_CustomerName
        FROM BORROWING b
        INNER JOIN CUSTOMERS c
            ON b.CustomerID = c.CustomerID
        WHERE b.BorrowingID = p_BorrowingID;

        START TRANSACTION;

        UPDATE BORROWING
        SET CollectionDATE = p_CollectionDate,
            BorrowingStatus = 'CLOSED'
        WHERE BorrowingID = p_BorrowingID;

        UPDATE BOOKS
        SET Available = TRUE
        WHERE BookID = v_BookID;

        COMMIT;

        SELECT CONCAT(
            'Empréstimo finalizado para o cliente: ',
            v_CustomerName
        ) AS Mensagem;

    END IF;

END $$




DROP PROCEDURE IF EXISTS sp_ConsultarPedido $$

CREATE PROCEDURE sp_ConsultarPedido(
    IN p_OrderID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM Orders
    WHERE OrderID = p_OrderID;

    IF v_Exists = 0 THEN

        SELECT 'Pedido não encontrado.' AS Mensagem;

    ELSE

        SELECT
            o.OrderID,
            b.BOOKNAME,
            c.CustomerName,
            CONCAT(
                e.FirstName,
                ' ',
                e.LastName
            ) AS EmployeeName,
            s.ShipperName,
            o.OrderDate,
            o.OrderStatus
        FROM Orders o
        INNER JOIN BOOKS b
            ON o.BookID = b.BookID
        INNER JOIN CUSTOMERS c
            ON o.CustomerID = c.CustomerID
        INNER JOIN EMPLOYEES e
            ON o.EmployeeID = e.EmployeeID
        INNER JOIN SHIPPERS s
            ON o.ShipperID = s.ShipperID
        WHERE o.OrderID = p_OrderID;

    END IF;

END $$



DROP PROCEDURE IF EXISTS sp_ConsultarMulta $$

CREATE PROCEDURE sp_ConsultarMulta(
    IN p_FineID INT
)
BEGIN

    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Value DECIMAL(10,2);

    SELECT COUNT(*)
    INTO v_Exists
    FROM FINES
    WHERE FineID = p_FineID;

    IF v_Exists = 0 THEN

        SELECT 'Multa não encontrada.' AS Mensagem;

    ELSE

        SELECT Value
        INTO v_Value
        FROM FINES
        WHERE FineID = p_FineID;

        IF v_Value > 0 THEN

            SELECT
                f.FineID,
                c.CustomerName,
                b.BOOKNAME,
                f.Value,
                f.Paid
            FROM FINES f
            INNER JOIN CUSTOMERS c
                ON f.Customerid = c.CustomerID
            INNER JOIN BOOKS b
                ON f.BookID = b.BookID
            WHERE f.FineID = p_FineID;

        ELSE

            SELECT
                'A multa possui valor igual a zero.'
                AS Mensagem;

        END IF;

    END IF;

END $$


DELIMITER ;




DROP TRIGGER IF EXISTS trg_customers_before_insert;

CREATE TRIGGER trg_customers_before_insert
BEFORE INSERT ON CUSTOMERS
FOR EACH ROW
SET NEW.CustomerStatus =
IF(
    NEW.CustomerStatus IS NULL,
    'ACTIVE',
    NEW.CustomerStatus
);



DROP TRIGGER IF EXISTS trg_employees_before_insert;

CREATE TRIGGER trg_employees_before_insert
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
SET NEW.EmployeeStatus =
IF(
    NEW.EmployeeStatus IS NULL,
    'ACTIVE',
    NEW.EmployeeStatus
);




DROP TRIGGER IF EXISTS trg_suppliers_before_insert;

CREATE TRIGGER trg_suppliers_before_insert
BEFORE INSERT ON SUPPLIERS
FOR EACH ROW
SET NEW.SupplierStatus =
IF(
    NEW.SupplierStatus IS NULL,
    'ACTIVE',
    NEW.SupplierStatus
);



DROP TRIGGER IF EXISTS trg_shippers_before_insert;

CREATE TRIGGER trg_shippers_before_insert
BEFORE INSERT ON SHIPPERS
FOR EACH ROW
SET NEW.ShipperStatus =
IF(
    NEW.ShipperStatus IS NULL,
    'ACTIVE',
    NEW.ShipperStatus
);




DROP TRIGGER IF EXISTS trg_categories_before_insert;

CREATE TRIGGER trg_categories_before_insert
BEFORE INSERT ON Categories
FOR EACH ROW
SET NEW.CategoryStatus =
IF(
    NEW.CategoryStatus IS NULL,
    'ACTIVE',
    NEW.CategoryStatus
);




DROP TRIGGER IF EXISTS trg_books_before_insert;

CREATE TRIGGER trg_books_before_insert
BEFORE INSERT ON BOOKS
FOR EACH ROW
SET NEW.Available =
IF(
    NEW.Available IS NULL,
    TRUE,
    NEW.Available
);




DROP TRIGGER IF EXISTS trg_borrowing_before_insert;

CREATE TRIGGER trg_borrowing_before_insert
BEFORE INSERT ON BORROWING
FOR EACH ROW
SET NEW.BorrowingStatus =
IF(
    NEW.BorrowingStatus IS NULL,
    'OPEN',
    NEW.BorrowingStatus
);




DROP TRIGGER IF EXISTS trg_orders_before_insert;

CREATE TRIGGER trg_orders_before_insert
BEFORE INSERT ON Orders
FOR EACH ROW
SET NEW.OrderStatus =
IF(
    NEW.OrderStatus IS NULL,
    'OPEN',
    NEW.OrderStatus
);



DROP TRIGGER IF EXISTS trg_fines_before_insert;

CREATE TRIGGER trg_fines_before_insert
BEFORE INSERT ON FINES
FOR EACH ROW
SET NEW.Paid =
IF(
    NEW.Paid IS NULL,
    FALSE,
    NEW.Paid
);




