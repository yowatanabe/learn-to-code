-- 1. 売上金額が全商品の平均売上金額を上回っている商品を取得するクエリ
SELECT
    p.product_id,
    p.product_name,
    subquery.total_sales
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
    ) AS subquery
    JOIN products p ON p.product_id = subquery.product_id
WHERE
    subquery.total_sales > (
        SELECT
            AVG(total_sales)
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
            ) AS inner_subquery
    );
