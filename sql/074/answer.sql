-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrderItemsテーブルのOrderID列にインデックスを作成
CREATE INDEX idx_orderitems_orderid ON OrderItems (OrderID);

-- OrderItemsテーブルのProductID列にインデックスを作成
CREATE INDEX idx_orderitems_productid ON OrderItems (ProductID);

-- クエリを変更
SELECT
  p.ProductName,
  SUM(oi.Quantity) AS TotalQuantity,
  SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM
  (
    SELECT
      OrderID
    FROM
      Orders
    WHERE
      OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
  ) o
  JOIN OrderItems oi ON o.OrderID = oi.OrderID
  JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY
  p.ProductName
ORDER BY
  TotalRevenue DESC;
