-- 非効率なクエリ
SELECT p.product_name,
       SUM(p.price * o.quantity) AS total_sales
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_date >= NOW() - INTERVAL 7 DAY
GROUP BY p.product_id
ORDER BY total_sales DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT p.product_name,
       SUM(p.price * o.quantity) AS total_sales
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_date >= NOW() - INTERVAL 7 DAY
GROUP BY p.product_id
ORDER BY total_sales DESC
LIMIT 5;

-- インデックスの最適化と管理
ALTER TABLE orders
ADD INDEX idx_order_date_product (order_date, product_id);

-- EXPLAINの確認（インデックス追加後）
EXPLAIN
SELECT p.product_name,
       SUM(p.price * o.quantity) AS total_sales
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_date >= NOW() - INTERVAL 7 DAY
GROUP BY p.product_id
ORDER BY total_sales DESC
LIMIT 5;
