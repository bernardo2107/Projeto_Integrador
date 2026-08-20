-- 1. Listar todos os clientes de Belo Horizonte
SELECT * FROM Customers WHERE City = 'Belo Horizonte';

-- 2. Produtos com preço acima de R$ 150
SELECT ProductName AS 'NOME DO PRODUTO',
CONCAT('R$',' ',Price) AS 'PREÇO'
 FROM Products WHERE Price > 150 ORDER BY Price DESC;

-- 3. Pedidos com status "CANCELADO"
SELECT * FROM Orders WHERE OrderStatus = 'CANCELADO';

-- 4. 10 produtos mais baratos
SELECT ProductName, Price FROM Products ORDER BY Price ASC LIMIT 10;

-- 5. Devoluções feitas nos últimos 30 dias (ajuste a data de referência conforme seus dados)
SELECT * FROM Returns WHERE RequestDate >= '2026-05-01';

-- 6. Pedidos com nome do cliente e do funcionário responsável
SELECT o.OrderID, c.CustomerName, e.FirstName, e.LastName, o.OrderStatus
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID;

-- 7. Itens de um pedido específico, com nome do produto
SELECT od.OrderID, p.ProductName, od.Quantity, od.UnitPrice
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

-- 8. Produtos e seus fornecedores/categorias
SELECT p.ProductName, s.SupplierName, c.CategoryName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

-- 9. Clientes que NUNCA fizeram pedido (LEFT JOIN com IS NULL)
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 10. Produtos que nunca foram vendidos
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.OrderDetailID IS NULL;

-- 11. Pedidos com transportadora e status de devolução (se houver)
SELECT o.OrderID, sh.ShipperName, o.OrderStatus, r.ReturnStatus
FROM Orders o
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
LEFT JOIN Returns r ON o.OrderID = r.OrderID;

-- 12. Total gasto por cliente
SELECT c.CustomerName, SUM(od.Quantity * od.UnitPrice) AS TotalGasto
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalGasto DESC;

-- 13. Quantidade de pedidos por status
SELECT OrderStatus, COUNT(*) AS Total
FROM Orders
GROUP BY OrderStatus
ORDER BY Total DESC;

-- 14. Produto mais vendido (em quantidade)
SELECT p.ProductName, SUM(od.Quantity) AS TotalVendido
FROM Products p
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalVendido DESC
LIMIT 10;

-- 15. Ticket médio por pedido
SELECT o.OrderID, AVG(od.Quantity * od.UnitPrice) AS TicketMedio
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;

-- 16. Clientes com mais de 3 pedidos (HAVING)
SELECT c.CustomerName, COUNT(o.OrderID) AS QtdPedidos
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 3;

-- 17. Faturamento total por categoria de produto
SELECT cat.CategoryName, SUM(od.Quantity * od.UnitPrice) AS Faturamento
FROM Categories cat
INNER JOIN Products p ON cat.CategoryID = p.CategoryID
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY cat.CategoryID, cat.CategoryName
ORDER BY Faturamento DESC;

-- 18. Número de devoluções por status
SELECT ReturnStatus, COUNT(*) AS Total
FROM Returns
GROUP BY ReturnStatus
ORDER BY Total DESC;

-- 19. Funcionário que mais processou pedidos
SELECT e.FirstName, e.LastName, COUNT(o.OrderID) AS QtdPedidos
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY QtdPedidos DESC
LIMIT 5;

-- 20. Produtos com preço acima da média geral
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- 21. Clientes que gastaram mais que a média de gastos de todos os clientes
SELECT CustomerName, TotalGasto FROM (
  SELECT c.CustomerID, c.CustomerName, SUM(od.Quantity * od.UnitPrice) AS TotalGasto
  FROM Customers c
  INNER JOIN Orders o ON c.CustomerID = o.CustomerID
  INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
  GROUP BY c.CustomerID, c.CustomerName
) AS gastos
WHERE TotalGasto > (
  SELECT AVG(TotalGasto) FROM (
    SELECT SUM(od.Quantity * od.UnitPrice) AS TotalGasto
    FROM Orders o
    INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
  ) AS media
);

-- 22. Produtos que já tiveram alguma devolução associada
SELECT DISTINCT p.ProductName
FROM Products p
WHERE p.ProductID IN (
  SELECT od.ProductID
  FROM OrderDetails od
  INNER JOIN Returns r ON od.OrderID = r.OrderID
);

-- 23. Fornecedor com maior número de produtos cadastrados
SELECT SupplierName FROM Suppliers
WHERE SupplierID = (
  SELECT SupplierID FROM Products
  GROUP BY SupplierID
  ORDER BY COUNT(*) DESC
  LIMIT 1
);
