-- 1. 最も多くのサポートチケットを発行した顧客を取得するクエリ
SELECT
    c.customer_name,
    c.email,
    ticket_count
FROM
    (
        SELECT
            customer_id,
            COUNT(ticket_id) AS ticket_count
        FROM
            support_tickets
        GROUP BY
            customer_id
    ) AS ticket_summary
    JOIN customers c ON ticket_summary.customer_id = c.customer_id
WHERE
    ticket_summary.ticket_count = (
        SELECT
            MAX(ticket_count)
        FROM
            (
                SELECT
                    COUNT(ticket_id) AS ticket_count
                FROM
                    support_tickets
                GROUP BY
                    customer_id
            ) AS max_tickets
    );
