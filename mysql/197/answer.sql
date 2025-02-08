-- 最も売上金額が高い商品を取得するクエリ
SELECT
    p.product_name,
    p.category,
    sales_summary.total_sales
FROM
    (
        SELECT
            s.product_id,
            SUM(s.quantity * p.price) AS total_sales
        FROM
            sales s
            JOIN products p ON s.product_id = p.product_id
        GROUP BY
            s.product_id
    ) AS sales_summary
    JOIN products p ON sales_summary.product_id = p.product_id
WHERE
    sales_summary.total_sales = (
        SELECT
            MAX(total_sales)
        FROM
            (
                SELECT
                    s.product_id,
                    SUM(s.quantity * p.price) AS total_sales
                FROM
                    sales s
                    JOIN products p ON s.product_id = p.product_id
                GROUP BY
                    s.product_id
            ) AS max_sales
    );
