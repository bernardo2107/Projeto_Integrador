-- =========================================================
-- STORED PROCEDURES - BANCO DE DADOS
-- =========================================================

DELIMITER $$


-- =========================================================
-- 1. CUSTOMERS
-- Consulta clientes de uma determinada cidade,
-- mostrando também quantidade de pedidos e total gasto.
-- =========================================================

CREATE PROCEDURE sp_clientes_por_cidade(
    IN p_cidade VARCHAR(100)
)
BEGIN

    SELECT 
        c.CustomerID,
        c.CustomerName,
        c.City,
        c.CustomerType,
        COUNT(o.OrderID) AS QuantidadePedidos,
        COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS TotalGasto

    FROM Customers c

    LEFT JOIN Orders o 
        ON c.CustomerID = o.CustomerID

    LEFT JOIN OrderDetails od
        ON o.OrderID = od.OrderID

    WHERE c.City = p_cidade

    GROUP BY 
        c.CustomerID,
        c.CustomerName,
        c.City,
        c.CustomerType

    ORDER BY TotalGasto DESC;

END $$


-- =========================================================
-- 2. EMPLOYEES
-- Mostra o desempenho dos funcionários,
-- considerando a quantidade de pedidos processados
-- e o valor total desses pedidos.
-- =========================================================

CREATE PROCEDURE sp_desempenho_funcionario(
    IN p_employee_id INT
)
BEGIN

    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Department,
        COUNT(DISTINCT o.OrderID) AS QuantidadePedidos,
        COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS ValorTotalVendas

    FROM Employees e

    LEFT JOIN Orders o
        ON e.EmployeeID = o.EmployeeID

    LEFT JOIN OrderDetails od
        ON o.OrderID = od.OrderID

    WHERE e.EmployeeID = p_employee_id

    GROUP BY
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Department;

END $$


-- =========================================================
-- 3. SUPPLIERS
-- Mostra os produtos cadastrados por um fornecedor
-- e o valor médio dos produtos fornecidos.
-- =========================================================

CREATE PROCEDURE sp_produtos_fornecedor(
    IN p_supplier_id INT
)
BEGIN

    SELECT
        s.SupplierID,
        s.SupplierName,
        s.Website,
        COUNT(p.ProductID) AS QuantidadeProdutos,
        COALESCE(AVG(p.Price), 0) AS PrecoMedio,
        COALESCE(MAX(p.Price), 0) AS ProdutoMaisCaro

    FROM Suppliers s

    LEFT JOIN Products p
        ON s.SupplierID = p.SupplierID

    WHERE s.SupplierID = p_supplier_id

    GROUP BY
        s.SupplierID,
        s.SupplierName,
        s.Website;

END $$


-- =========================================================
-- 4. SHIPPERS
-- Mostra a quantidade de pedidos transportados
-- por determinada transportadora.
-- =========================================================

CREATE PROCEDURE sp_desempenho_transportadora(
    IN p_shipper_id INT
)
BEGIN

    SELECT
        sh.ShipperID,
        sh.ShipperName,
        sh.Email,
        COUNT(o.OrderID) AS QuantidadePedidos,
        SUM(
            CASE 
                WHEN o.OrderStatus = 'CANCELADO' THEN 1
                ELSE 0
            END
        ) AS PedidosCancelados

    FROM Shippers sh

    LEFT JOIN Orders o
        ON sh.ShipperID = o.ShipperID

    WHERE sh.ShipperID = p_shipper_id

    GROUP BY
        sh.ShipperID,
        sh.ShipperName,
        sh.Email;

END $$


-- =========================================================
-- 5. CATEGORIES
-- Calcula o faturamento de uma determinada categoria.
-- =========================================================

CREATE PROCEDURE sp_faturamento_categoria(
    IN p_category_id INT
)
BEGIN

    SELECT
        c.CategoryID,
        c.CategoryName,
        c.CategoryStatus,
        COUNT(DISTINCT p.ProductID) AS QuantidadeProdutos,
        COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS Faturamento,
        COALESCE(AVG(p.Price), 0) AS PrecoMedioProdutos

    FROM Categories c

    LEFT JOIN Products p
        ON c.CategoryID = p.CategoryID

    LEFT JOIN OrderDetails od
        ON p.ProductID = od.ProductID

    WHERE c.CategoryID = p_category_id

    GROUP BY
        c.CategoryID,
        c.CategoryName,
        c.CategoryStatus;

END $$


-- =========================================================
-- 6. PRODUCTS
-- Mostra informações de um produto e seu desempenho
-- nas vendas.
-- =========================================================

CREATE PROCEDURE sp_desempenho_produto(
    IN p_product_id INT
)
BEGIN

    SELECT
        p.ProductID,
        p.ProductName,
        p.Price,
        p.Weight,
        COALESCE(SUM(od.Quantity), 0) AS QuantidadeVendida,
        COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS FaturamentoProduto,
        COALESCE(AVG(od.UnitPrice), 0) AS PrecoMedioVenda

    FROM Products p

    LEFT JOIN OrderDetails od
        ON p.ProductID = od.ProductID

    WHERE p.ProductID = p_product_id

    GROUP BY
        p.ProductID,
        p.ProductName,
        p.Price,
        p.Weight;

END $$


-- =========================================================
-- 7. ORDERS
-- Calcula o valor total de um pedido,
-- incluindo o valor do frete.
-- =========================================================

CREATE PROCEDURE sp_detalhes_pedido(
    IN p_order_id INT
)
BEGIN

    SELECT
        o.OrderID,
        c.CustomerName,
        CONCAT(e.FirstName, ' ', e.LastName) AS Funcionario,
        sh.ShipperName,
        o.OrderStatus,
        o.ShippingCost,

        SUM(od.Quantity * od.UnitPrice) AS Subtotal,

        SUM(
            od.Quantity * od.UnitPrice
        ) + COALESCE(o.ShippingCost, 0) AS ValorTotal

    FROM Orders o

    INNER JOIN Customers c
        ON o.CustomerID = c.CustomerID

    INNER JOIN Employees e
        ON o.EmployeeID = e.EmployeeID

    INNER JOIN Shippers sh
        ON o.ShipperID = sh.ShipperID

    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID

    WHERE o.OrderID = p_order_id

    GROUP BY
        o.OrderID,
        c.CustomerName,
        e.FirstName,
        e.LastName,
        sh.ShipperName,
        o.OrderStatus,
        o.ShippingCost;

END $$


-- =========================================================
-- 8. ORDERDETAILS
-- Calcula o valor de um item do pedido,
-- considerando quantidade, preço e imposto.
-- =========================================================

CREATE PROCEDURE sp_calcular_item_pedido(
    IN p_order_detail_id INT
)
BEGIN

    SELECT
        od.OrderDetailID,
        od.OrderID,
        p.ProductName,
        od.Quantity,
        od.UnitPrice,
        od.TaxPercent,

        (od.Quantity * od.UnitPrice) AS Subtotal,

        (
            od.Quantity * od.UnitPrice
        ) * (od.TaxPercent / 100) AS ValorImposto,

        (
            od.Quantity * od.UnitPrice
        ) +
        (
            (od.Quantity * od.UnitPrice)
            * (od.TaxPercent / 100)
        ) AS ValorFinal

    FROM OrderDetails od

    INNER JOIN Products p
        ON od.ProductID = p.ProductID

    WHERE od.OrderDetailID = p_order_detail_id;

END $$


-- =========================================================
-- 9. RETURNS
-- Mostra as devoluções de um determinado status,
-- incluindo informações do pedido e cliente.
-- =========================================================

CREATE PROCEDURE sp_devolucoes_por_status(
    IN p_status VARCHAR(30)
)
BEGIN

    SELECT
        r.ReturnID,
        r.OrderID,
        c.CustomerName,
        r.RequestDate,
        r.ReturnStatus,
        r.ReturnReason,
        r.Comments

    FROM Returns r

    INNER JOIN Orders o
        ON r.OrderID = o.OrderID

    INNER JOIN Customers c
        ON o.CustomerID = c.CustomerID

    WHERE r.ReturnStatus = p_status

    ORDER BY r.RequestDate DESC;

END $$


DELIMITER ;