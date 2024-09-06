-- インデックスの作成
-- 頻繁に `CustomerName` で検索を行う場合を想定してインデックスを作成
CREATE INDEX idx_customer_name ON Orders (CustomerName);

-- インデックスを使用したクエリ
SELECT
  OrderID,
  OrderDate,
  TotalAmount
FROM
  Orders
WHERE
  CustomerName = 'Alice';

-- インデックスの確認
SHOW INDEX
FROM
  Orders;
