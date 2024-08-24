-- ORDER BY を使用して、価格で降順に並べ替えたクエリ
SELECT
  *
FROM
  Products
ORDER BY
  Price DESC;

-- GROUP BY を使用してカテゴリごとの平均価格を計算するクエリ
SELECT
  Category,
  AVG(Price) AS AveragePrice
FROM
  Products
GROUP BY
  Category;

-- GROUP BY と ORDER BY を組み合わせて、在庫数が多い順にカテゴリごとの平均在庫を計算し、並べ替えたクエリ
SELECT
  Category,
  AVG(StockQuantity) AS AverageStock
FROM
  Products
GROUP BY
  Category
ORDER BY
  AverageStock DESC;
