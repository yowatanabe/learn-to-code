-- 1. 各顧客の総売上 (`SUM`)
SELECT
  Customers.CustomerName,
  SUM(OrderItems.Quantity * OrderItems.Price) AS TotalSales
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Customers.CustomerName;

-- 2. 各顧客の平均注文金額 (`AVG`)
SELECT
  Customers.CustomerName,
  AVG(OrderItems.Quantity * OrderItems.Price) AS AverageSales
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Customers.CustomerName;

-- 3. 全注文の件数 (`COUNT`)
SELECT
  COUNT(*) AS TotalOrders
FROM
  Orders;

-- 4. 最高注文金額 (`MAX`)
SELECT
  MAX(OrderItems.Quantity * OrderItems.Price) AS MaxOrderAmount
FROM
  OrderItems;

-- 5. 最小注文金額 (`MIN`)
SELECT
  MIN(OrderItems.Quantity * OrderItems.Price) AS MinOrderAmount
FROM
  OrderItems;
