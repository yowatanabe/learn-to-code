-- 1. 部門ごとの平均給与を取得するクエリ
SELECT
    e.department,
    AVG(s.salary) AS avg_department_salary
FROM
    employees e
    JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY
    e.department
HAVING
    AVG(s.salary) > (
        SELECT
            AVG(salary)
        FROM
            salaries
    );
