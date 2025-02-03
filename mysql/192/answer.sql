-- 各従業員の最新の給与を取得するクエリ
SELECT
    e.employee_name,
    e.department,
    s.salary,
    s.effective_date
FROM
    employees e
    JOIN salaries s ON e.employee_id = s.employee_id
WHERE
    s.effective_date = (
        SELECT
            MAX(effective_date)
        FROM
            salaries s2
        WHERE
            s2.employee_id = s.employee_id
    )
ORDER BY
    e.employee_name;
