USE EcoStyle;

DELIMITER $$


-- ============================================================
-- 1. STORED PROCEDURE: Customers
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarCustomer$$

CREATE PROCEDURE sp_CadastrarCustomer(
    IN p_CustomerName VARCHAR(40),
    IN p_ContactName VARCHAR(40),
    IN p_Adress VARCHAR(70),
    IN p_City VARCHAR(20),
    IN p_PostalCode VARCHAR(10)
)
BEGIN

    INSERT INTO Customers (
        CustomerName,
        ContactName,
        Adress,
        City,
        PostalCode
    )
    VALUES (
        p_CustomerName,
        p_ContactName,
        p_Adress,
        p_City,
        p_PostalCode
    );

    SELECT LAST_INSERT_ID() AS CustomerID;

END$$


-- ============================================================
-- 2. STORED PROCEDURE: Categories
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarCategory$$

CREATE PROCEDURE sp_CadastrarCategory(
    IN p_CategoryName VARCHAR(40),
    IN p_Description VARCHAR(300)
)
BEGIN

    INSERT INTO Categories (
        CategoryName,
        Description
    )
    VALUES (
        p_CategoryName,
        p_Description
    );

    SELECT LAST_INSERT_ID() AS CategoryID;

END$$


-- ============================================================
-- 3. STORED PROCEDURE: Employees
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarEmployee$$

CREATE PROCEDURE sp_CadastrarEmployee(
    IN p_LastName VARCHAR(15),
    IN p_FirstName VARCHAR(15),
    IN p_BirthDate DATE,
    IN p_Adress VARCHAR(50),
    IN p_Photo VARCHAR(150),
    IN p_Notes VARCHAR(1000)
)
BEGIN

    INSERT INTO Employees (
        LastName,
        FirstName,
        BirthDate,
        Adress,
        Photo,
        Notes
    )
    VALUES (
        p_LastName,
        p_FirstName,
        p_BirthDate,
        p_Adress,
        p_Photo,
        p_Notes
    );

    SELECT LAST_INSERT_ID() AS EmployeeID;

END$$


-- ============================================================
-- 4. STORED PROCEDURE: Shippers
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarShipper$$

CREATE PROCEDURE sp_CadastrarShipper(
    IN p_ShipperName VARCHAR(25),
    IN p_Phone VARCHAR(15)
)
BEGIN

    INSERT INTO Shippers (
        ShipperName,
        Phone
    )
    VALUES (
        p_ShipperName,
        p_Phone
    );

    SELECT LAST_INSERT_ID() AS ShipperID;

END$$


-- ============================================================
-- 5. STORED PROCEDURE: Orders
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarOrder$$

CREATE PROCEDURE sp_CadastrarOrder(
    IN p_CustomerID BIGINT UNSIGNED,
    IN p_EmployeeID INT UNSIGNED,
    IN p_OrderDate DATETIME,
    IN p_ShipperID INT,
    IN p_OrderStatus VARCHAR(20)
)
BEGIN

    INSERT INTO Orders (
        CustomerID,
        EmployeeID,
        OrderDate,
        ShipperID,
        OrderStatus
    )
    VALUES (
        p_CustomerID,
        p_EmployeeID,
        p_OrderDate,
        p_ShipperID,
        p_OrderStatus
    );

    SELECT LAST_INSERT_ID() AS OrderID;

END$$


-- ============================================================
-- 6. STORED PROCEDURE: Returns
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarReturn$$

CREATE PROCEDURE sp_CadastrarReturn(
    IN p_OrderID BIGINT UNSIGNED,
    IN p_CustomerID BIGINT UNSIGNED,
    IN p_RequestDate DATETIME,
    IN p_ShipperID INT,
    IN p_ReturnStatus VARCHAR(30)
)
BEGIN

    INSERT INTO Returns (
        OrderID,
        CustomerID,
        RequestDate,
        ShipperID,
        ReturnStatus
    )
    VALUES (
        p_OrderID,
        p_CustomerID,
        p_RequestDate,
        p_ShipperID,
        COALESCE(p_ReturnStatus, 'SOLICITADA')
    );

    SELECT LAST_INSERT_ID() AS ReturnID;

END$$


-- ============================================================
-- 7. STORED PROCEDURE: Suppliers
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarSupplier$$

CREATE PROCEDURE sp_CadastrarSupplier(
    IN p_SupplierName VARCHAR(50),
    IN p_ContactName VARCHAR(50),
    IN p_Adress VARCHAR(50),
    IN p_City VARCHAR(25),
    IN p_PostalCode VARCHAR(10),
    IN p_Country VARCHAR(15),
    IN p_Phone VARCHAR(15),
    IN p_Description VARCHAR(1000)
)
BEGIN

    INSERT INTO Suppliers (
        SupplierName,
        ContactName,
        Adress,
        City,
        PostalCode,
        Country,
        Phone,
        Description
    )
    VALUES (
        p_SupplierName,
        p_ContactName,
        p_Adress,
        p_City,
        p_PostalCode,
        p_Country,
        p_Phone,
        p_Description
    );

    SELECT LAST_INSERT_ID() AS SupplierID;

END$$


-- ============================================================
-- 8. STORED PROCEDURE: Products
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarProduct$$

CREATE PROCEDURE sp_CadastrarProduct(
    IN p_ProductName VARCHAR(40),
    IN p_SupplierID INT,
    IN p_CategoryID INT,
    IN p_Unit VARCHAR(25),
    IN p_Price DECIMAL(10,0),
    IN p_Description VARCHAR(1000)
)
BEGIN

    INSERT INTO Products (
        ProductName,
        SupplierID,
        CategoryID,
        Unit,
        Price,
        Description
    )
    VALUES (
        p_ProductName,
        p_SupplierID,
        p_CategoryID,
        p_Unit,
        p_Price,
        p_Description
    );

    SELECT LAST_INSERT_ID() AS ProductID;

END$$


-- ============================================================
-- 9. STORED PROCEDURE: Inventory
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarInventory$$

CREATE PROCEDURE sp_CadastrarInventory(
    IN p_OrderID BIGINT UNSIGNED,
    IN p_ProductID INT UNSIGNED,
    IN p_Quantity INT
)
BEGIN

    INSERT INTO Inventory (
        OrderID,
        ProductID,
        Quantity
    )
    VALUES (
        p_OrderID,
        p_ProductID,
        p_Quantity
    );

    SELECT LAST_INSERT_ID() AS InventoryID;

END$$


-- ============================================================
-- 10. STORED PROCEDURE: Stock
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarStock$$

CREATE PROCEDURE sp_CadastrarStock(
    IN p_ProductID INT UNSIGNED,
    IN p_QuantityAvailable INT
)
BEGIN

    INSERT INTO Stock (
        ProductID,
        QuantityAvailable
    )
    VALUES (
        p_ProductID,
        p_QuantityAvailable
    );

    SELECT LAST_INSERT_ID() AS StockID;

END$$


-- ============================================================
-- 11. STORED PROCEDURE: Logs
-- ============================================================
DROP PROCEDURE IF EXISTS sp_CadastrarLog$$

CREATE PROCEDURE sp_CadastrarLog(
    IN p_EmployeeID INT UNSIGNED,
    IN p_ProductID INT UNSIGNED,
    IN p_Actions VARCHAR(100),
    IN p_OldValue VARCHAR(255),
    IN p_NewValue VARCHAR(255)
)
BEGIN

    INSERT INTO Logs (
        EmployeeID,
        ProductID,
        Actions,
        OldValue,
        NewValue
    )
    VALUES (
        p_EmployeeID,
        p_ProductID,
        p_Actions,
        p_OldValue,
        p_NewValue
    );

    SELECT LAST_INSERT_ID() AS LogID;

END$$


DELIMITER ;