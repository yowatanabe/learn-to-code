-- 1. 平均出勤日数が全従業員の平均出勤日数を上回っている従業員を取得するクエリ
SELECT
    e.employee_id,
    e.employee_name,
    COUNT(a.attendance_id) AS attendance_count
FROM
    employees e
    JOIN attendance a ON e.employee_id = a.employee_id
GROUP BY
    e.employee_id,
    e.employee_name
HAVING
    COUNT(a.attendance_id) > (
        SELECT
            AVG(attendance_count)
        FROM
            (
                SELECT
                    employee_id,
                    COUNT(attendance_id) AS attendance_count
                FROM
                    attendance
                GROUP BY
                    employee_id
            ) AS subquery
    );
