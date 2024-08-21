-- ORDER BY を使用して合計金額で昇順に並べ替えたクエリ
SELECT
  *
FROM
  Sales
ORDER BY
  TotalAmount ASC;

-- GROUP BY を使用して商品ごとの合計数量を計算するクエリ
SELECT
  ProductName,
  SUM(Quantity) AS TotalQuantity
FROM
  Sales
GROUP BY
  ProductName;

-- GROUP BY と ORDER BY を組み合わせて商品ごとの売上合計を計算し、売上が多い順に並べ替えたクエリ
SELECT
  ProductName,
  SUM(TotalAmount) AS TotalSales
FROM
  Sales
GROUP BY
  ProductName
ORDER BY
  TotalSales DESC;
