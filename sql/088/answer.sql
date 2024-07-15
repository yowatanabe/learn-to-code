-- ビューの作成
CREATE VIEW
  CustomerOrders AS
SELECT
  o.OrderID,
  o.OrderDate,
  o.TotalAmount,
  c.CustomerName
FROM
  Orders o
  JOIN Customers c ON o.CustomerID = c.CustomerID;

-- ビューの使用
SELECT
  OrderID,
  CustomerName,
  OrderDate,
  TotalAmount
FROM
  CustomerOrders
WHERE
  OrderDate BETWEEN '2024-01-01' AND '2024-01-31';
