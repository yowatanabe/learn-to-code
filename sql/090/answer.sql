-- ビューの作成
CREATE VIEW
  ProductDetails AS
SELECT
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  p.Price
FROM
  Products p
  JOIN Categories c ON p.CategoryID = c.CategoryID;

-- ビューの使用
SELECT
  ProductID,
  ProductName,
  CategoryName,
  Price
FROM
  ProductDetails
WHERE
  Price >= 100;
