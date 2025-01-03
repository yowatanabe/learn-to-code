-- 商品IDが`3`の注文履歴を検索するクエリ
SELECT
  *
FROM
  orders
WHERE
  product_id = 3;

-- インデックスを追加する前後のパフォーマンス比較
EXPLAIN
SELECT
  *
FROM
  orders
WHERE
  product_id = 3;

-- インデックスを追加
ALTER TABLE orders ADD INDEX idx_product_id (product_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  orders
WHERE
  product_id = 3;
