-- 非効率なクエリ
SELECT e.employee_name,
       SUM(TIMESTAMPDIFF(HOUR, a.clock_in, a.clock_out)) AS total_hours
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.work_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.employee_id
ORDER BY total_hours DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT e.employee_name,
       SUM(TIMESTAMPDIFF(HOUR, a.clock_in, a.clock_out)) AS total_hours
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.work_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.employee_id
ORDER BY total_hours DESC
LIMIT 5;

-- インデックスの最適化と管理
ALTER TABLE attendance
ADD INDEX idx_work_date_employee (work_date, employee_id);

-- EXPLAINの確認（インデックス追加後）
EXPLAIN
SELECT e.employee_name,
       SUM(TIMESTAMPDIFF(HOUR, a.clock_in, a.clock_out)) AS total_hours
FROM employees e
JOIN attendance a FORCE INDEX (idx_work_date_employee)
ON e.employee_id = a.employee_id
WHERE a.work_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.employee_id
ORDER BY total_hours DESC
LIMIT 5;
