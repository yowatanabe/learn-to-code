-- 商品IDが`2`のレビュー情報を検索するクエリ
SELECT
  *
FROM
  reviews
WHERE
  product_id = 2;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  reviews
WHERE
  product_id = 2;

-- インデックスを追加
ALTER TABLE reviews ADD INDEX idx_product_id (product_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  reviews
WHERE
  product_id = 2;
