-- インデックスの作成
-- `CustomerName` で注文を検索するクエリが多い場合のインデックスを作成
CREATE INDEX idx_customer_name ON Orders (CustomerName);

-- インデックスを使用したクエリ
SELECT
  Orders.OrderID,
  Books.Title,
  Orders.OrderDate
FROM
  Orders
  JOIN Books ON Orders.BookID = Books.BookID
WHERE
  Orders.CustomerName = 'Alice';

-- インデックスの確認
SHOW INDEX
FROM
  Orders;
