-- 1. カテゴリーごとの売上 (`SUM`)
SELECT
  Products.Category,
  SUM(OrderItems.Quantity * Products.Price) AS TotalSales
FROM
  Products
  JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
GROUP BY
  Products.Category;

-- 2. 日付ごとの売上 (`SUM`)
SELECT
  Orders.OrderDate,
  SUM(OrderItems.Quantity * Products.Price) AS TotalSales
FROM
  Orders
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
  JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY
  Orders.OrderDate;

-- 3. 顧客ごとの注文数 (`COUNT`)
SELECT
  Customers.CustomerName,
  COUNT(Orders.OrderID) AS OrderCount
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;
