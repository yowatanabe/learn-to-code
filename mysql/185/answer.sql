-- 1. 従業員ごとの最新の給与履歴を取得するクエリ
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

-- 2. 従業員削除後の給与履歴確認クエリ
-- 従業員 "Charlie" を削除
DELETE FROM employees
WHERE
    employee_name = 'Charlie';

-- 残っている給与履歴を確認
SELECT
    *
FROM
    salaries;
