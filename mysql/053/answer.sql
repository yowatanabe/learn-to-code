-- インデックス最適化の考え方
-- `CustomerName` と `OrderDate` を頻繁に使う検索が行われるためこれらの列に対して最適なインデックスを作成。複数の条件に基づく検索を効率化するため、複合インデックスを作成することでクエリ実行のパフォーマンスを向上させる。
CREATE INDEX idx_customer_orderdate ON Orders (CustomerName, OrderDate);

-- 複合インデックスを使用したクエリ
-- 特定の顧客の特定の日付の注文を検索するクエリ
SELECT
  OrderID,
  TotalAmount
FROM
  Orders
WHERE
  CustomerName = 'Alice'
  AND OrderDate = '2024-09-01';

-- インデックスの確認
SHOW INDEX
FROM
  Orders;
