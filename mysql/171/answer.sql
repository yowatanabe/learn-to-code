-- 1. 最も多く注文された商品を取得するクエリ
SELECT p.product_id, p.product_name, subquery.total_quantity AS max_quantity
FROM (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM orders
    GROUP BY product_id
) AS subquery
JOIN products p ON p.product_id = subquery.product_id
WHERE subquery.total_quantity = (
    SELECT MAX(total_quantity)
    FROM (
        SELECT product_id, SUM(quantity) AS total_quantity
        FROM orders
        GROUP BY product_id
    ) AS inner_subquery
);
