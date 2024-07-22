-- 回答1のクエリ
SELECT
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    p.ProductName,
    od.Quantity,
    od.UnitPrice
FROM
    Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID;

-- 回答2のクエリ
SELECT
    c.CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM
    Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY
    c.CustomerName;
