-- ProductsテーブルのPrice列にインデックスを作成
CREATE INDEX idx_price ON Products (Price);

-- ProductsテーブルのCategoryID列にインデックスを作成
CREATE INDEX idx_category_id ON Products (CategoryID);

-- クエリを変更
SELECT
  c.CategoryName,
  p.ProductName,
  p.Price
FROM
  Categories c
  JOIN (
    SELECT
      ProductID,
      ProductName,
      CategoryID,
      Price
    FROM
      Products
    WHERE
      Price > 50
  ) p ON p.CategoryID = c.CategoryID
ORDER BY
  p.Price DESC;
