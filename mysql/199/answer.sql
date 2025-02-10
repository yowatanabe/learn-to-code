-- 最も多くのタスクを担当している従業員を取得するクエリ
SELECT
    e.employee_name,
    e.department,
    task_summary.total_tasks
FROM
    (
        SELECT
            employee_id,
            COUNT(task_id) AS total_tasks
        FROM
            tasks
        GROUP BY
            employee_id
    ) AS task_summary
    JOIN employees e ON task_summary.employee_id = e.employee_id
WHERE
    task_summary.total_tasks = (
        SELECT
            MAX(total_tasks)
        FROM
            (
                SELECT
                    COUNT(task_id) AS total_tasks
                FROM
                    tasks
                GROUP BY
                    employee_id
            ) AS max_tasks
    );
