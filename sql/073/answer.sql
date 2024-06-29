-- SalesテーブルのSaleDate列にインデックスを作成
CREATE INDEX idx_sale_date ON Sales (SaleDate);

-- SalesテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_sales_customer_id ON Sales (CustomerID);

-- SalesテーブルのProductID列にインデックスを作成
CREATE INDEX idx_sales_product_id ON Sales (ProductID);

-- クエリを変更
SELECT
  c.CustomerName,
  p.ProductName,
  SUM(s.Quantity) AS TotalQuantity,
  SUM(s.TotalAmount) AS TotalSpent
FROM
  (
    SELECT
      SaleID,
      CustomerID,
      ProductID,
      Quantity,
      TotalAmount
    FROM
      Sales
    WHERE
      SaleDate BETWEEN '2024-01-01' AND '2024-03-31'
  ) s
  JOIN Customers c ON s.CustomerID = c.CustomerID
  JOIN Products p ON s.ProductID = p.ProductID
GROUP BY
  c.CustomerName,
  p.ProductName
ORDER BY
  TotalSpent DESC;
