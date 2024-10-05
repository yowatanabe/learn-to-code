-- 1. 顧客ごとの注文情報と、注文内の商品、配送状況を表示するクエリ
SELECT
  Customers.CustomerName,
  Orders.OrderID,
  Orders.OrderDate,
  Products.ProductName,
  OrderItems.Quantity,
  (Products.Price * OrderItems.Quantity) AS TotalPrice,
  ShippingStatus.Status
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
  JOIN Products ON OrderItems.ProductID = Products.ProductID
  JOIN ShippingStatus ON Orders.OrderID = ShippingStatus.OrderID
ORDER BY
  Customers.CustomerName,
  Orders.OrderID;

-- 2. 配送ステータスが "Processing" の注文とその顧客、商品の詳細を表示するクエリ
SELECT
  Customers.CustomerName,
  Orders.OrderID,
  Orders.OrderDate,
  Products.ProductName,
  OrderItems.Quantity,
  (Products.Price * OrderItems.Quantity) AS TotalPrice
FROM
  Orders
  JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
  JOIN Products ON OrderItems.ProductID = Products.ProductID
  JOIN ShippingStatus ON Orders.OrderID = ShippingStatus.OrderID
WHERE
  ShippingStatus.Status = 'Processing';
