-- 1. 最も多くのチケットを提出した顧客の情報を取得するクエリ
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    subquery.ticket_count
FROM
    (
        SELECT
            customer_id,
            COUNT(*) AS ticket_count
        FROM
            tickets
        GROUP BY
            customer_id
    ) AS subquery
    JOIN customers c ON c.customer_id = subquery.customer_id
WHERE
    subquery.ticket_count = (
        SELECT
            MAX(ticket_count)
        FROM
            (
                SELECT
                    customer_id,
                    COUNT(*) AS ticket_count
                FROM
                    tickets
                GROUP BY
                    customer_id
            ) AS inner_subquery
    );
