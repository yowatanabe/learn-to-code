-- クエリのチューニング手順

-- 1. EXPLAINの確認
-- ALLスキャンが発生しています。
-- `customers` テーブルと `orders` テーブルの両方でフルテーブルスキャンが発生しています。
EXPLAIN
SELECT c.customer_name, o.product_name, o.order_amount, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_name = 'Bob'
  AND o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.order_date DESC;


-- 2. インデックスの追加
-- order_date にインデックスを追加
-- 複合インデックス (customer_id, order_date) を追加
CREATE INDEX idx_order_date ON orders (order_date);
CREATE INDEX idx_customer_order_date ON orders (customer_id, order_date);



-- 3. クエリの改良
-- 結合条件の見直し: `WHERE` で `c.customer_name` をフィルターするのではなく、サブクエリを使用して、先に `customer_id` を取得します。
-- インデックスの活用: サブクエリを使い、`customers` の絞り込みを事前に行います。
SELECT c.customer_name, o.product_name, o.order_amount, o.order_date
FROM orders o
JOIN (
    SELECT customer_id, customer_name
    FROM customers
    WHERE customer_name = 'Bob'
) c ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.order_date DESC;



-- 4. EXPLAINの確認
-- テーブルスキャンが減少: `ALL` スキャンから `ref` へ変更されました。
-- 結合の最適化: `idx_order_date` と `idx_customer_order_date` が使用されています。
EXPLAIN
SELECT c.customer_name, o.product_name, o.order_amount, o.order_date
FROM orders o
JOIN (
    SELECT customer_id, customer_name
    FROM customers
    WHERE customer_name = 'Bob'
) c ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.order_date DESC;
