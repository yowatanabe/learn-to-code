-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrderDetailsテーブルのOrderID列にインデックスを作成
CREATE INDEX idx_orderdetails_orderid ON OrderDetails (OrderID);

-- OrderDetailsテーブルのProductID列にインデックスを作成
CREATE INDEX idx_orderdetails_productid ON OrderDetails (ProductID);

-- クエリを変更
SELECT
  p.ProductName,
  SUM(od.Quantity) AS TotalQuantity,
  SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM
  Products p
  JOIN OrderDetails od ON p.ProductID = od.ProductID
  JOIN (
    SELECT
      OrderID
    FROM
      Orders
    WHERE
      OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
  ) o ON o.OrderID = od.OrderID
GROUP BY
  p.ProductName
ORDER BY
  TotalRevenue DESC;
