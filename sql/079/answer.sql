-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrdersテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_order_customer_id ON Orders (CustomerID);

-- クエリを変更
SELECT
  c.CustomerName,
  COUNT(o.OrderID) AS TotalOrders,
  SUM(o.TotalAmount) AS TotalSpent
FROM
  Customers c
  JOIN (
    SELECT
      OrderID,
      CustomerID,
      TotalAmount
    FROM
      Orders
    WHERE
      OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
  ) o ON o.CustomerID = c.CustomerID
GROUP BY
  c.CustomerName
ORDER BY
  TotalSpent DESC;
