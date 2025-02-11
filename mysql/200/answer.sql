-- 売上数量が最も多い商品の情報を取得するクエリ
SELECT
    p.product_name,
    p.category,
    total_quantity
FROM
    (
        SELECT
            product_id,
            SUM(quantity) AS total_quantity
        FROM
            orders
        GROUP BY
            product_id
    ) AS order_summary
    JOIN products p ON order_summary.product_id = p.product_id
WHERE
    order_summary.total_quantity = (
        SELECT
            MAX(total_quantity)
        FROM
            (
                SELECT
                    SUM(quantity) AS total_quantity
                FROM
                    orders
                GROUP BY
                    product_id
            ) AS max_quantity
    );
