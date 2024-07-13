-- ビューの作成
CREATE VIEW
  ProductSales AS
SELECT
  p.ProductID,
  p.ProductName,
  s.SaleDate,
  s.Amount
FROM
  Sales s
  JOIN Products p ON s.ProductID = p.ProductID;

-- ビューの使用
SELECT
  ProductID,
  ProductName,
  SaleDate,
  Amount
FROM
  ProductSales
WHERE
  ProductName = 'Laptop';
