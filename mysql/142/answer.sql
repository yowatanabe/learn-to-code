-- 最初の非効率なクエリ
SELECT DATE(order_date) AS sale_date,
       SUM(order_amount) AS total_sales
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE(order_date)
ORDER BY sale_date;

-- EXPLAINの確認
-- ALLスキャンが発生している (`type = ALL`)。
-- filesortが発生しているため、ORDER BY の最適化が不十分。
-- Using temporary で一時テーブルが作られている。
EXPLAIN
SELECT DATE(order_date) AS sale_date,
       SUM(order_amount) AS total_sales
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE(order_date)
ORDER BY sale_date;


-- 改善方法

-- 1. インデックスの追加
CREATE INDEX idx_order_date ON orders (order_date);

-- 2. クエリの改善
-- `DATE(order_date)` では関数が使われているためインデックスが無効化されていました。
-- WHERE条件とGROUP BYの条件を変更し、`DATE(order_date)`の代わりに、直接`order_date`を使います。
SELECT order_date AS sale_date,
       SUM(order_amount) AS total_sales
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY order_date
ORDER BY order_date;

-- 3. EXPLAINの確認
EXPLAIN
SELECT order_date AS sale_date,
       SUM(order_amount) AS total_sales
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY order_date
ORDER BY order_date;
