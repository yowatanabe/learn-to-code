-- 1. 最も高額な注文をした顧客の情報を取得するクエリ
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    o.total_amount,
    o.order_date
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
WHERE
    o.total_amount = (
        SELECT
            MAX(total_amount)
        FROM
            orders
    );
