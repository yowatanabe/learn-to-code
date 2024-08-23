-- ORDER BY を使用して注文日付で昇順に並べ替えたクエリ
SELECT
  *
FROM
  Orders
ORDER BY
  OrderDate ASC;

-- GROUP BY を使用してカテゴリごとの注文金額の合計を計算するクエリ
SELECT
  ProductCategory,
  SUM(OrderAmount) AS TotalSales
FROM
  Orders
GROUP BY
  ProductCategory;

-- GROUP BY と ORDER BY を組み合わせてカテゴリごとの売上合計を計算し、多い順に並べ替えたクエリ
SELECT
  ProductCategory,
  SUM(OrderAmount) AS TotalSales
FROM
  Orders
GROUP BY
  ProductCategory
ORDER BY
  TotalSales DESC;
