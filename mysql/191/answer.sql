-- 1. 注文回数が最も多い商品を取得するクエリ
SELECT
    product_name,
    total_orders
FROM
    (
        SELECT
            p.product_name,
            COUNT(o.order_id) AS total_orders
        FROM
            products p
            JOIN orders o ON p.product_id = o.product_id
        GROUP BY
            p.product_id
    ) AS order_counts
WHERE
    total_orders = (
        SELECT
            MAX(total_orders)
        FROM
            (
                SELECT
                    COUNT(o.order_id) AS total_orders
                FROM
                    orders o
                GROUP BY
                    o.product_id
            ) AS max_orders
    );
