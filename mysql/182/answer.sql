-- 1. 部門ごとの従業員一覧を取得するクエリ
SELECT
    d.department_name,
    e.employee_name,
    e.job_title
FROM
    departments d
    JOIN employees e ON d.department_id = e.department_id
ORDER BY
    d.department_name,
    e.job_title;

-- 2. 部門が削除された場合に関連する従業員データが削除されることを確認するクエリ
DELETE FROM departments
WHERE
    department_name = 'Marketing';

SELECT
    *
FROM
    employees;
