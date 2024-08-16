-- 数値に基づいてフィルタリング (TotalAmount が200以上の注文を選択)
SELECT
  *
FROM
  Orders
WHERE
  TotalAmount >= 200;

-- 文字列に基づいてフィルタリング (Status がShipped の注文を選択)
SELECT
  *
FROM
  Orders
WHERE
  Status = 'Shipped';

-- 日付に基づいてフィルタリング (OrderDate が 2024-08-18 以降の注文を選択)
SELECT
  *
FROM
  Orders
WHERE
  OrderDate >= '2024-08-18';
