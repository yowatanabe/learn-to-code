-- 最も多くの勤務時間を記録した従業員を取得するクエリ
SELECT
    e.employee_name,
    e.department,
    total_hours
FROM
    (
        SELECT
            employee_id,
            SUM(hours_worked) AS total_hours
        FROM
            work_logs
        GROUP BY
            employee_id
    ) AS work_summary
    JOIN employees e ON work_summary.employee_id = e.employee_id
WHERE
    work_summary.total_hours = (
        SELECT
            MAX(total_hours)
        FROM
            (
                SELECT
                    SUM(hours_worked) AS total_hours
                FROM
                    work_logs
                GROUP BY
                    employee_id
            ) AS max_hours
    );
