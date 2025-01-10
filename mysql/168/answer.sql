-- 1. 商品IDが `4` の注文履歴を取得するクエリ
SELECT
  *
FROM
  orders
WHERE
  product_id = 4;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  orders
WHERE
  product_id = 4;

-- インデックスを追加
ALTER TABLE orders ADD INDEX idx_product_id (product_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  orders
WHERE
  product_id = 4;
