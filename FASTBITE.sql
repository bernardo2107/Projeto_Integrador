CREATE DATABASE FASTBITE;

USE FASTBITE;

CREATE TABLE RESTAURANTS (
Restaurant INT PRIMARY KEY AUTO_INCREMENT,
RESTAURANTNAME VARCHAR (100),
TAXID VARCHAR (10),
PHONE CHAR (15),
ADDRESS VARCHAR (100),
OPENINGHOUERS VARCHAR (10),
RestaurantStatus ENUM ('OPEN','CLOSED')
);

CREATE TABLE CUSTOMERS (
CUSTOMERID INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR (100),
PHONE CHAR (15),
ADDRESS VARCHAR (100)
);

ALTER TABLE CUSTOMERS 
ADD COLUMN EMAIL VARCHAR (300) UNIQUE;

CREATE TABLE MENU (
menuID INT PRIMARY KEY AUTO_INCREMENT,
MenuName VARCHAR (20),
Description VARCHAR (400),
MenuStatus ENUM ('AVAIBLE','SOLD OUT'),
CREATED DATETIME,
Restaurantid INT, 
FOREIGN KEY (Restaurantid) REFERENCES Restaurants(Restaurantid)
);

CREATE TABLE MenuCategory (
CategoryID INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR (50),
Description VARCHAR (400),
Menuid INT,
FOREIGN KEY (Menuid) REFERENCES Menu(Menuid)
);

CREATE TABLE MenuItem (
ItemID INT PRIMARY KEY AUTO_INCREMENT,
ItemName VARCHAR (100),
Description VARCHAR (400),
Price DECIMAL(10,2),
IMAGE BLOB,
categoryID INT,
FOREIGN KEY (CategoryID) REFERENCES MenuCategory(CategoryID)
);

CREATE TABLE DELIVERYWORKERS (
WorkerID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR (100),
PHONE CHAR (15),
VEHICLE VARCHAR (100),
PLATE CHAR (7),
WORKERSTATUS ENUM ('AVAIBLE','NOT AVAIBLE')
);

CREATE TABLE ORDERS (
ORDERID INT PRIMARY KEY AUTO_INCREMENT,
ORDERDATE DATETIME,
OrderStatus ENUM ('PREPARING REQUEST', 'ON THE WAY' ,'DELIVERED' ,'COLLECTING REQUEST'),
Quantity INT,
PaymentMethode VARCHAR (100),
Notes VARCHAR (200),
CUSTOMERID INT,
RESTAURANTID INT,
WorkerID INT,
FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS (CUSTOMERID),
FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANTS (RESTAURANTID),
FOREIGN KEY (WorkerID) REFERENCES DeliveryWorkers (WorkerID)
);

CREATE TABLE ORDERITEM (
ORDERITEMID INT PRIMARY KEY AUTO_INCREMENT,
QUANTITY INT,
UnitPrice DECIMAL (10,2),
Subtotal DECIMAL (10,2),
ORDERID INT,
ITEMID INT,
FOREIGN KEY (ORDERID) REFERENCES ORDERS (ORDERID),
FOREIGN KEY (ITEMID) REFERENCES MenuItem (ITEMID)
);

CREATE TABLE REVIEW (
ReviewID INT PRIMARY KEY AUTO_INCREMENT,
RATING ENUM ('1 STAR', '2 STARS', '3 STARS' , '4 STARS' , '5 STARS'),
COMMENT VARCHAR (150),
REVIEWDATE DATETIME,
CUSTOMERID INT,
RESTAURANTID INT,
FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS (CustomerID),
FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANTS (RESTAURANTID)
);

CREATE TABLE DISCOUNTCOUPON (
CouponID INT PRIMARY KEY AUTO_INCREMENT,
Code VARCHAR (20),
DescountType VARCHAR (50),
DiscountValue DECIMAL (10,2),
StartDate DATE ,
EndDate DATE,
MaxUses INT,
Active BOOL
);

ALTER TABLE RESTAURANTS 
CHANGE COLUMN Restaurant RestaurantID INT NOT NULL AUTO_INCREMENT;





INSERT INTO RESTAURANTS 
(RestaurantID, RESTAURANTNAME, TAXID, PHONE, ADDRESS, OPENINGHOUERS, RestaurantStatus)
VALUES
(1, 'Burger House', '1234567890', '(11)99999-1001', 'Rua das Flores, 120', '10-23', 'OPEN'),
(2, 'Pizza Prime', '2345678901', '(11)99999-1002', 'Av Paulista, 900', '18-00', 'OPEN'),
(3, 'Sushi Tokyo', '3456789012', '(11)99999-1003', 'Rua Japão, 45', '12-22', 'OPEN'),
(4, 'Taco Fiesta', '4567890123', '(11)99999-1004', 'Rua México, 87', '11-23', 'OPEN'),
(5, 'Pasta Bella', '5678901234', '(11)99999-1005', 'Av Itália, 300', '11-22', 'OPEN'),
(6, 'Veggie Life', '6789012345', '(11)99999-1006', 'Rua Verde, 215', '09-21', 'OPEN'),
(7, 'Chicken Mania', '7890123456', '(11)99999-1007', 'Rua Central, 600', '10-22', 'CLOSED'),
(8, 'Açaí Tropical', '8901234567', '(11)99999-1008', 'Av Brasil, 1500', '08-20', 'OPEN');


INSERT INTO CUSTOMERS 
(CustomerID, CustomerName, PHONE, ADDRESS, EMAIL)
VALUES
(1, 'Lucas Almeida', '(11)98888-0001', 'Rua A, 101', 'lucas.almeida@email.com'),
(2, 'Mariana Costa', '(11)98888-0002', 'Rua B, 202', 'mariana.costa@email.com'),
(3, 'Pedro Henrique', '(11)98888-0003', 'Rua C, 303', 'pedro.henrique@email.com'),
(4, 'Ana Beatriz', '(11)98888-0004', 'Rua D, 404', 'ana.beatriz@email.com'),
(5, 'João Victor', '(11)98888-0005', 'Rua E, 505', 'joao.victor@email.com'),
(6, 'Camila Rocha', '(11)98888-0006', 'Rua F, 606', 'camila.rocha@email.com'),
(7, 'Rafael Martins', '(11)98888-0007', 'Rua G, 707', 'rafael.martins@email.com'),
(8, 'Fernanda Lima', '(11)98888-0008', 'Rua H, 808', 'fernanda.lima@email.com'),
(9, 'Gustavo Pereira', '(11)98888-0009', 'Rua I, 909', 'gustavo.pereira@email.com'),
(10, 'Larissa Souza', '(11)98888-0010', 'Rua J, 100', 'larissa.souza@email.com'),
(11, 'Bruno Oliveira', '(11)98888-0011', 'Rua K, 111', 'bruno.oliveira@email.com'),
(12, 'Patrícia Mendes', '(11)98888-0012', 'Rua L, 222', 'patricia.mendes@email.com');


INSERT INTO MENU 
(MenuID, MenuName, Description, MenuStatus, CREATED, Restaurantid)
VALUES
(1, 'Burgers', 'Cardápio principal de hambúrgueres artesanais', 'AVAIBLE', '2026-07-01 10:00:00', 1),
(2, 'Pizzas', 'Pizzas tradicionais e especiais', 'AVAIBLE', '2026-07-01 18:00:00', 2),
(3, 'Sushi', 'Combinados japoneses e pratos orientais', 'AVAIBLE', '2026-07-02 12:00:00', 3),
(4, 'Mexicano', 'Tacos, burritos e nachos', 'AVAIBLE', '2026-07-02 11:00:00', 4),
(5, 'Massas', 'Massas frescas e molhos especiais', 'AVAIBLE', '2026-07-03 11:00:00', 5),
(6, 'Vegano', 'Opções saudáveis sem ingredientes de origem animal', 'AVAIBLE', '2026-07-03 09:00:00', 6),
(7, 'Frangos', 'Pratos com frango frito, grelhado e empanado', 'SOLD OUT', '2026-07-04 10:00:00', 7),
(8, 'Açaí', 'Açaís, smoothies e sobremesas geladas', 'AVAIBLE', '2026-07-04 08:00:00', 8);


INSERT INTO MenuCategory 
(CategoryID, CategoryName, Description, Menuid)
VALUES
(1, 'Hambúrgueres', 'Lanches com carne bovina artesanal', 1),
(2, 'Combos Burger', 'Hambúrguer com batata e bebida', 1),
(3, 'Pizzas Salgadas', 'Pizzas com sabores tradicionais', 2),
(4, 'Pizzas Doces', 'Pizzas doces especiais', 2),
(5, 'Combinados', 'Combinados de sushi e sashimi', 3),
(6, 'Pratos Quentes', 'Yakissoba e pratos orientais quentes', 3),
(7, 'Tacos', 'Tacos mexicanos variados', 4),
(8, 'Burritos', 'Burritos recheados', 4),
(9, 'Massas Clássicas', 'Espaguete, penne e lasanha', 5),
(10, 'Pratos Veganos', 'Refeições veganas completas', 6),
(11, 'Frango Frito', 'Porções e combos de frango', 7),
(12, 'Açaí no Copo', 'Açaí com acompanhamentos', 8);


INSERT INTO MenuItem 
(ItemID, ItemName, Description, Price, IMAGE, CategoryID)
VALUES
(1, 'Cheeseburger Clássico', 'Pão brioche, hambúrguer, queijo e molho da casa', 24.90, NULL, 1),
(2, 'Burger Bacon', 'Hambúrguer artesanal com bacon crocante', 29.90, NULL, 1),
(3, 'Combo Cheeseburger', 'Cheeseburger, batata frita e refrigerante', 39.90, NULL, 2),
(4, 'Pizza Calabresa', 'Pizza de calabresa com cebola e mussarela', 49.90, NULL, 3),
(5, 'Pizza Margherita', 'Pizza com mussarela, tomate e manjericão', 46.90, NULL, 3),
(6, 'Pizza Chocolate', 'Pizza doce com chocolate ao leite', 42.90, NULL, 4),
(7, 'Combo Sushi 20 peças', 'Combinado com sushis variados', 59.90, NULL, 5),
(8, 'Sashimi Salmão', 'Porção com 12 fatias de salmão fresco', 54.90, NULL, 5),
(9, 'Yakissoba Frango', 'Macarrão oriental com legumes e frango', 37.90, NULL, 6),
(10, 'Taco de Carne', 'Taco crocante com carne temperada', 19.90, NULL, 7),
(11, 'Taco Vegetariano', 'Taco com legumes, queijo e molho especial', 18.90, NULL, 7),
(12, 'Burrito de Frango', 'Burrito recheado com frango, arroz e feijão', 31.90, NULL, 8),
(13, 'Burrito de Carne', 'Burrito recheado com carne, arroz e cheddar', 34.90, NULL, 8),
(14, 'Espaguete Bolonhesa', 'Massa ao molho bolonhesa tradicional', 36.90, NULL, 9),
(15, 'Lasanha Quatro Queijos', 'Lasanha cremosa com mix de queijos', 42.90, NULL, 9),
(16, 'Bowl Vegano', 'Arroz integral, legumes, grão-de-bico e molho tahine', 32.90, NULL, 10),
(17, 'Hambúrguer Vegano', 'Burger vegetal com salada e molho especial', 33.90, NULL, 10),
(18, 'Frango Crocante', 'Porção de frango frito crocante', 35.90, NULL, 11),
(19, 'Açaí 500ml', 'Açaí com banana, granola e leite condensado', 22.90, NULL, 12),
(20, 'Açaí 700ml', 'Açaí grande com três acompanhamentos', 29.90, NULL, 12);

INSERT INTO DELIVERYWORKERS 
(WorkerID, NAME, PHONE, VEHICLE, PLATE, WORKERSTATUS)
VALUES
(1, 'Carlos Silva', '(11)97777-0001', 'Moto Honda CG', 'ABC1D23', 'AVAIBLE'),
(2, 'Diego Santos', '(11)97777-0002', 'Moto Yamaha Factor', 'DEF2G34', 'AVAIBLE'),
(3, 'Ricardo Lima', '(11)97777-0003', 'Bicicleta Elétrica', 'BIK0001', 'NOT AVAIBLE'),
(4, 'Felipe Souza', '(11)97777-0004', 'Moto Honda Biz', 'GHI3J45', 'AVAIBLE'),
(5, 'André Costa', '(11)97777-0005', 'Moto Suzuki Yes', 'JKL4M56', 'AVAIBLE'),
(6, 'Marcelo Rocha', '(11)97777-0006', 'Carro Fiat Mobi', 'MNO5P67', 'NOT AVAIBLE'),
(7, 'Thiago Alves', '(11)97777-0007', 'Moto Yamaha Fazer', 'PQR6S78', 'AVAIBLE'),
(8, 'Eduardo Nunes', '(11)97777-0008', 'Moto Honda Pop', 'STU7V89', 'AVAIBLE');


INSERT INTO ORDERS 
(OrderID, ORDERDATE, OrderStatus, Quantity, PaymentMethode, Notes, CUSTOMERID, RESTAURANTID, WorkerID)
VALUES
(1, '2026-07-05 12:15:00', 'DELIVERED', 2, 'Credit Card', 'Sem cebola', 1, 1, 1),
(2, '2026-07-05 13:40:00', 'ON THE WAY', 1, 'Pix', 'Entregar na portaria', 2, 3, 2),
(3, '2026-07-05 19:10:00', 'PREPARING REQUEST', 3, 'Debit Card', 'Adicionar guardanapos', 3, 2, 4),
(4, '2026-07-06 20:30:00', 'DELIVERED', 2, 'Cash', 'Troco para 100', 4, 4, 5),
(5, '2026-07-06 21:00:00', 'COLLECTING REQUEST', 1, 'Pix', 'Sem pimenta', 5, 5, 7),
(6, '2026-07-07 11:45:00', 'DELIVERED', 2, 'Credit Card', 'Entrega rápida', 6, 6, 8),
(7, '2026-07-07 14:20:00', 'ON THE WAY', 1, 'Pix', 'Chamar no interfone', 7, 8, 1),
(8, '2026-07-07 18:55:00', 'PREPARING REQUEST', 4, 'Debit Card', 'Pizza bem assada', 8, 2, 2),
(9, '2026-07-08 12:05:00', 'DELIVERED', 2, 'Credit Card', 'Sem molho extra', 9, 3, 4),
(10, '2026-07-08 13:25:00', 'COLLECTING REQUEST', 1, 'Pix', 'Enviar talheres', 10, 1, 5);


INSERT INTO ORDERITEM 
(OrderItemID, QUANTITY, UnitPrice, Subtotal, ORDERID, ITEMID)
VALUES
(1, 1, 24.90, 24.90, 1, 1),
(2, 1, 29.90, 29.90, 1, 2),
(3, 1, 59.90, 59.90, 2, 7),
(4, 2, 49.90, 99.80, 3, 4),
(5, 1, 42.90, 42.90, 3, 6),
(6, 2, 19.90, 39.80, 4, 10),
(7, 1, 36.90, 36.90, 5, 14),
(8, 1, 32.90, 32.90, 6, 16),
(9, 1, 33.90, 33.90, 6, 17),
(10, 1, 22.90, 22.90, 7, 19),
(11, 4, 46.90, 187.60, 8, 5),
(12, 2, 54.90, 109.80, 9, 8);


INSERT INTO REVIEW 
(ReviewID, RATING, COMMENT, REVIEWDATE, CUSTOMERID, RESTAURANTID)
VALUES
(1, '5 STARS', 'Pedido chegou rápido e muito bem embalado.', '2026-07-05 13:20:00', 1, 1),
(2, '4 STARS', 'Comida muito boa, mas demorou um pouco.', '2026-07-05 14:30:00', 2, 3),
(3, '5 STARS', 'Pizza excelente e bem recheada.', '2026-07-06 20:50:00', 3, 2),
(4, '3 STARS', 'O taco estava bom, mas veio pouco molho.', '2026-07-06 21:15:00', 4, 4),
(5, '5 STARS', 'Açaí muito caprichado, recomendo.', '2026-07-07 15:00:00', 7, 8);


INSERT INTO DISCOUNTCOUPON 
(CouponID, Code, DescountType, DiscountValue, StartDate, EndDate, MaxUses, Active)
VALUES
(1, 'FAST10', 'Percentage', 10.00, '2026-07-01', '2026-07-31', 500, TRUE),
(2, 'BURGER15', 'Percentage', 15.00, '2026-07-01', '2026-07-20', 200, TRUE),
(3, 'FRETEGRATIS', 'Fixed', 8.00, '2026-07-05', '2026-07-25', 300, TRUE),
(4, 'PIZZA20', 'Percentage', 20.00, '2026-07-10', '2026-07-30', 150, TRUE),
(5, 'VOLTEI5', 'Fixed', 5.00, '2026-07-01', '2026-08-01', 1000, TRUE);


USE FASTBITE;

-- =========================================================
-- 1. ALTER TABLE
-- =========================================================

ALTER TABLE RESTAURANTS
ADD COLUMN TotalOrders INT DEFAULT 0;

ALTER TABLE CUSTOMERS
ADD COLUMN CustomerStatus ENUM('ACTIVE','INACTIVE') DEFAULT 'ACTIVE';

ALTER TABLE MENU
ADD COLUMN TotalItems INT DEFAULT 0;

ALTER TABLE MenuCategory
ADD COLUMN CategoryStatus ENUM('ACTIVE','INACTIVE') DEFAULT 'ACTIVE';

ALTER TABLE MenuItem
ADD COLUMN Stock INT DEFAULT 0;

ALTER TABLE DELIVERYWORKERS
ADD COLUMN TotalDeliveries INT DEFAULT 0;

ALTER TABLE ORDERS
ADD COLUMN TotalAmount DECIMAL(10,2) DEFAULT 0.00;

ALTER TABLE ORDERITEM
ADD COLUMN DiscountAmount DECIMAL(10,2) DEFAULT 0.00;

ALTER TABLE REVIEW
ADD COLUMN Verified BOOL DEFAULT FALSE;

ALTER TABLE DISCOUNTCOUPON
ADD COLUMN UsesCount INT DEFAULT 0;


-- =========================================================
-- 2. STORED PROCEDURES
-- =========================================================

DELIMITER $$


-- =========================================================
-- PROCEDURE 1 - RESTAURANTS
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarRestaurante $$

CREATE PROCEDURE sp_AtualizarRestaurante(
    IN p_RestaurantID INT,
    IN p_NewStatus ENUM('OPEN','CLOSED')
)
BEGIN
    DECLARE v_Orders INT DEFAULT 0;
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM RESTAURANTS
    WHERE RestaurantID = p_RestaurantID;

    IF v_Exists = 0 THEN

        SELECT 'Restaurante não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Orders
        FROM ORDERS o
        INNER JOIN RESTAURANTS r
            ON o.RESTAURANTID = r.RestaurantID
        WHERE r.RestaurantID = p_RestaurantID;

        UPDATE RESTAURANTS
        SET RestaurantStatus = p_NewStatus,
            TotalOrders = v_Orders
        WHERE RestaurantID = p_RestaurantID;

        IF p_NewStatus = 'OPEN' THEN

            SELECT CONCAT(
                'Restaurante aberto. Pedidos registrados: ',
                v_Orders
            ) AS Mensagem;

        ELSE

            SELECT CONCAT(
                'Restaurante fechado. Pedidos registrados: ',
                v_Orders
            ) AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 2 - CUSTOMERS
-- =========================================================

DROP PROCEDURE IF EXISTS sp_ConsultarCliente $$

CREATE PROCEDURE sp_ConsultarCliente(
    IN p_CustomerID INT
)
BEGIN
    DECLARE v_OrderCount INT DEFAULT 0;
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM CUSTOMERS
    WHERE CustomerID = p_CustomerID;

    IF v_Exists = 0 THEN

        SELECT 'Cliente não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_OrderCount
        FROM ORDERS o
        INNER JOIN CUSTOMERS c
            ON o.CUSTOMERID = c.CustomerID
        WHERE c.CustomerID = p_CustomerID;

        IF v_OrderCount > 0 THEN

            SELECT
                c.CustomerID,
                c.CustomerName,
                c.EMAIL,
                c.PHONE,
                c.CustomerStatus,
                v_OrderCount AS TotalPedidos
            FROM CUSTOMERS c
            WHERE c.CustomerID = p_CustomerID;

        ELSE

            SELECT
                c.CustomerID,
                c.CustomerName,
                c.EMAIL,
                c.PHONE,
                c.CustomerStatus,
                0 AS TotalPedidos
            FROM CUSTOMERS c
            WHERE c.CustomerID = p_CustomerID;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 3 - MENU
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarMenu $$

CREATE PROCEDURE sp_AtualizarMenu(
    IN p_MenuID INT,
    IN p_Status ENUM('AVAIBLE','SOLD OUT')
)
BEGIN
    DECLARE v_Items INT DEFAULT 0;
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM MENU
    WHERE MenuID = p_MenuID;

    IF v_Exists = 0 THEN

        SELECT 'Cardápio não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Items
        FROM MenuItem mi
        INNER JOIN MenuCategory mc
            ON mi.CategoryID = mc.CategoryID
        WHERE mc.Menuid = p_MenuID;

        UPDATE MENU
        SET MenuStatus = p_Status,
            TotalItems = v_Items
        WHERE MenuID = p_MenuID;

        IF v_Items > 0 THEN

            SELECT CONCAT(
                'Cardápio atualizado. Itens encontrados: ',
                v_Items
            ) AS Mensagem;

        ELSE

            SELECT
                'Cardápio atualizado, mas não possui itens.'
                AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 4 - MenuCategory
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarCategoria $$

CREATE PROCEDURE sp_AtualizarCategoria(
    IN p_CategoryID INT,
    IN p_Status ENUM('ACTIVE','INACTIVE')
)
BEGIN
    DECLARE v_MenuName VARCHAR(20);
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM MenuCategory
    WHERE CategoryID = p_CategoryID;

    IF v_Exists = 0 THEN

        SELECT 'Categoria não encontrada.' AS Mensagem;

    ELSE

        SELECT m.MenuName
        INTO v_MenuName
        FROM MenuCategory mc
        INNER JOIN MENU m
            ON mc.Menuid = m.MenuID
        WHERE mc.CategoryID = p_CategoryID;

        UPDATE MenuCategory
        SET CategoryStatus = p_Status
        WHERE CategoryID = p_CategoryID;

        SELECT CONCAT(
            'Categoria atualizada. Cardápio: ',
            v_MenuName
        ) AS Mensagem;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 5 - MenuItem
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarEstoqueItem $$

CREATE PROCEDURE sp_AtualizarEstoqueItem(
    IN p_ItemID INT,
    IN p_Quantidade INT
)
BEGIN
    DECLARE v_ItemName VARCHAR(100);
    DECLARE v_CategoryName VARCHAR(50);
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM MenuItem
    WHERE ItemID = p_ItemID;

    IF v_Exists = 0 THEN

        SELECT 'Item não encontrado.' AS Mensagem;

    ELSE

        SELECT
            mi.ItemName,
            mc.CategoryName
        INTO
            v_ItemName,
            v_CategoryName
        FROM MenuItem mi
        INNER JOIN MenuCategory mc
            ON mi.CategoryID = mc.CategoryID
        WHERE mi.ItemID = p_ItemID;

        IF p_Quantidade < 0 THEN

            SELECT
                'Quantidade inválida.'
                AS Mensagem;

        ELSE

            UPDATE MenuItem
            SET Stock = p_Quantidade
            WHERE ItemID = p_ItemID;

            SELECT CONCAT(
                'Estoque atualizado: ',
                v_ItemName,
                ' | Categoria: ',
                v_CategoryName,
                ' | Estoque: ',
                p_Quantidade
            ) AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 6 - DELIVERYWORKERS
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarEntregador $$

CREATE PROCEDURE sp_AtualizarEntregador(
    IN p_WorkerID INT,
    IN p_Status ENUM('AVAIBLE','NOT AVAIBLE')
)
BEGIN
    DECLARE v_Deliveries INT DEFAULT 0;
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM DELIVERYWORKERS
    WHERE WorkerID = p_WorkerID;

    IF v_Exists = 0 THEN

        SELECT 'Entregador não encontrado.' AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_Deliveries
        FROM ORDERS o
        INNER JOIN DELIVERYWORKERS dw
            ON o.WorkerID = dw.WorkerID
        WHERE dw.WorkerID = p_WorkerID
          AND o.OrderStatus = 'DELIVERED';

        UPDATE DELIVERYWORKERS
        SET WORKERSTATUS = p_Status,
            TotalDeliveries = v_Deliveries
        WHERE WorkerID = p_WorkerID;

        SELECT CONCAT(
            'Entregador atualizado. Entregas realizadas: ',
            v_Deliveries
        ) AS Mensagem;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 7 - ORDERS
-- =========================================================

DROP PROCEDURE IF EXISTS sp_AtualizarPedido $$

CREATE PROCEDURE sp_AtualizarPedido(
    IN p_OrderID INT,
    IN p_Status ENUM(
        'PREPARING REQUEST',
        'ON THE WAY',
        'DELIVERED',
        'COLLECTING REQUEST'
    )
)
BEGIN
    DECLARE v_CustomerName VARCHAR(100);
    DECLARE v_RestaurantName VARCHAR(100);
    DECLARE v_Exists INT DEFAULT 0;
    DECLARE v_Total DECIMAL(10,2) DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;

        SELECT
            'Erro ao atualizar pedido. Operação revertida.'
            AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_Exists
    FROM ORDERS
    WHERE OrderID = p_OrderID;

    IF v_Exists = 0 THEN

        SELECT 'Pedido não encontrado.' AS Mensagem;

    ELSE

        SELECT
            c.CustomerName,
            r.RESTAURANTNAME
        INTO
            v_CustomerName,
            v_RestaurantName
        FROM ORDERS o
        INNER JOIN CUSTOMERS c
            ON o.CUSTOMERID = c.CustomerID
        INNER JOIN RESTAURANTS r
            ON o.RESTAURANTID = r.RestaurantID
        WHERE o.OrderID = p_OrderID;

        SELECT IFNULL(SUM(Subtotal), 0)
        INTO v_Total
        FROM ORDERITEM
        WHERE ORDERID = p_OrderID;

        START TRANSACTION;

        UPDATE ORDERS
        SET OrderStatus = p_Status,
            TotalAmount = v_Total
        WHERE OrderID = p_OrderID;

        COMMIT;

        SELECT CONCAT(
            'Pedido atualizado. Cliente: ',
            v_CustomerName,
            ' | Restaurante: ',
            v_RestaurantName,
            ' | Total: R$ ',
            v_Total
        ) AS Mensagem;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 8 - ORDERITEM
-- =========================================================

DROP PROCEDURE IF EXISTS sp_CalcularItemPedido $$

CREATE PROCEDURE sp_CalcularItemPedido(
    IN p_OrderItemID INT
)
BEGIN
    DECLARE v_Quantity INT;
    DECLARE v_UnitPrice DECIMAL(10,2);
    DECLARE v_ItemName VARCHAR(100);
    DECLARE v_Subtotal DECIMAL(10,2);
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM ORDERITEM
    WHERE OrderItemID = p_OrderItemID;

    IF v_Exists = 0 THEN

        SELECT 'Item do pedido não encontrado.' AS Mensagem;

    ELSE

        SELECT
            oi.QUANTITY,
            oi.UnitPrice,
            mi.ItemName
        INTO
            v_Quantity,
            v_UnitPrice,
            v_ItemName
        FROM ORDERITEM oi
        INNER JOIN MenuItem mi
            ON oi.ITEMID = mi.ItemID
        WHERE oi.OrderItemID = p_OrderItemID;

        SET v_Subtotal = v_Quantity * v_UnitPrice;

        IF v_Quantity > 0 THEN

            UPDATE ORDERITEM
            SET Subtotal = v_Subtotal
            WHERE OrderItemID = p_OrderItemID;

            SELECT CONCAT(
                'Item: ',
                v_ItemName,
                ' | Subtotal: R$ ',
                v_Subtotal
            ) AS Mensagem;

        ELSE

            SELECT
                'A quantidade deve ser maior que zero.'
                AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 9 - REVIEW
-- =========================================================

DROP PROCEDURE IF EXISTS sp_VerificarAvaliacao $$

CREATE PROCEDURE sp_VerificarAvaliacao(
    IN p_ReviewID INT
)
BEGIN
    DECLARE v_CustomerName VARCHAR(100);
    DECLARE v_RestaurantName VARCHAR(100);
    DECLARE v_Rating VARCHAR(20);
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM REVIEW
    WHERE ReviewID = p_ReviewID;

    IF v_Exists = 0 THEN

        SELECT 'Avaliação não encontrada.' AS Mensagem;

    ELSE

        SELECT
            c.CustomerName,
            r.RESTAURANTNAME,
            rv.RATING
        INTO
            v_CustomerName,
            v_RestaurantName,
            v_Rating
        FROM REVIEW rv
        INNER JOIN CUSTOMERS c
            ON rv.CUSTOMERID = c.CustomerID
        INNER JOIN RESTAURANTS r
            ON rv.RESTAURANTID = r.RestaurantID
        WHERE rv.ReviewID = p_ReviewID;

        IF v_Rating = '5 STARS' THEN

            UPDATE REVIEW
            SET Verified = TRUE
            WHERE ReviewID = p_ReviewID;

            SELECT CONCAT(
                'Excelente avaliação de ',
                v_CustomerName,
                ' para ',
                v_RestaurantName
            ) AS Mensagem;

        ELSE

            UPDATE REVIEW
            SET Verified = TRUE
            WHERE ReviewID = p_ReviewID;

            SELECT CONCAT(
                'Avaliação verificada. Cliente: ',
                v_CustomerName,
                ' | Restaurante: ',
                v_RestaurantName
            ) AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- PROCEDURE 10 - DISCOUNTCOUPON
-- =========================================================

DROP PROCEDURE IF EXISTS sp_VerificarCupom $$

CREATE PROCEDURE sp_VerificarCupom(
    IN p_Code VARCHAR(20)
)
BEGIN
    DECLARE v_Active BOOL DEFAULT FALSE;
    DECLARE v_EndDate DATE;
    DECLARE v_Uses INT DEFAULT 0;
    DECLARE v_MaxUses INT DEFAULT 0;
    DECLARE v_Exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_Exists
    FROM DISCOUNTCOUPON
    WHERE Code = p_Code;

    IF v_Exists = 0 THEN

        SELECT 'Cupom não encontrado.' AS Mensagem;

    ELSE

        SELECT
            Active,
            EndDate,
            UsesCount,
            MaxUses
        INTO
            v_Active,
            v_EndDate,
            v_Uses,
            v_MaxUses
        FROM DISCOUNTCOUPON
        WHERE Code = p_Code;

        IF v_Active = TRUE
           AND CURDATE() <= v_EndDate
           AND v_Uses < v_MaxUses THEN

            SELECT
                'Cupom válido e disponível para uso.'
                AS Mensagem;

        ELSE

            SELECT
                'Cupom expirado, inativo ou limite de usos atingido.'
                AS Mensagem;

        END IF;

    END IF;

END $$


-- =========================================================
-- FINALIZA PROCEDURES
-- =========================================================

DELIMITER ;


-- =========================================================
-- 3. TRIGGERS
-- =========================================================


-- RESTAURANTS

DROP TRIGGER IF EXISTS trg_restaurants_before_insert;

CREATE TRIGGER trg_restaurants_before_insert
BEFORE INSERT ON RESTAURANTS
FOR EACH ROW
SET NEW.RestaurantStatus =
IF(
    NEW.RestaurantStatus IS NULL,
    'OPEN',
    NEW.RestaurantStatus
);


-- CUSTOMERS

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


-- MENU

DROP TRIGGER IF EXISTS trg_menu_before_insert;

CREATE TRIGGER trg_menu_before_insert
BEFORE INSERT ON MENU
FOR EACH ROW
SET NEW.CREATED =
IF(
    NEW.CREATED IS NULL,
    NOW(),
    NEW.CREATED
);


-- MenuCategory

DROP TRIGGER IF EXISTS trg_menucategory_before_insert;

CREATE TRIGGER trg_menucategory_before_insert
BEFORE INSERT ON MenuCategory
FOR EACH ROW
SET NEW.CategoryStatus =
IF(
    NEW.CategoryStatus IS NULL,
    'ACTIVE',
    NEW.CategoryStatus
);


-- MenuItem

DROP TRIGGER IF EXISTS trg_menuitem_before_insert;

CREATE TRIGGER trg_menuitem_before_insert
BEFORE INSERT ON MenuItem
FOR EACH ROW
SET NEW.Stock =
IF(
    NEW.Stock IS NULL OR NEW.Stock < 0,
    0,
    NEW.Stock
);


-- DELIVERYWORKERS

DROP TRIGGER IF EXISTS trg_deliveryworkers_before_insert;

CREATE TRIGGER trg_deliveryworkers_before_insert
BEFORE INSERT ON DELIVERYWORKERS
FOR EACH ROW
SET NEW.WORKERSTATUS =
IF(
    NEW.WORKERSTATUS IS NULL,
    'AVAIBLE',
    NEW.WORKERSTATUS
);


-- ORDERS

DROP TRIGGER IF EXISTS trg_orders_before_insert;

CREATE TRIGGER trg_orders_before_insert
BEFORE INSERT ON ORDERS
FOR EACH ROW
SET NEW.ORDERDATE =
IF(
    NEW.ORDERDATE IS NULL,
    NOW(),
    NEW.ORDERDATE
);


-- ORDERITEM

DROP TRIGGER IF EXISTS trg_orderitem_before_insert;

CREATE TRIGGER trg_orderitem_before_insert
BEFORE INSERT ON ORDERITEM
FOR EACH ROW
SET NEW.Subtotal =
IF(
    NEW.QUANTITY > 0,
    NEW.QUANTITY * NEW.UnitPrice,
    0
);


-- REVIEW

DROP TRIGGER IF EXISTS trg_review_before_insert;

CREATE TRIGGER trg_review_before_insert
BEFORE INSERT ON REVIEW
FOR EACH ROW
SET NEW.REVIEWDATE =
IF(
    NEW.REVIEWDATE IS NULL,
    NOW(),
    NEW.REVIEWDATE
);


-- DISCOUNTCOUPON

DROP TRIGGER IF EXISTS trg_discountcoupon_before_insert;

CREATE TRIGGER trg_discountcoupon_before_insert
BEFORE INSERT ON DISCOUNTCOUPON
FOR EACH ROW
SET NEW.UsesCount =
IF(
    NEW.UsesCount IS NULL OR NEW.UsesCount < 0,
    0,
    NEW.UsesCount
);





