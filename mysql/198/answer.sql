-- 賞与の合計金額が最も多い従業員を取得するクエリ
SELECT
    e.employee_name,
    e.department,
    total_bonus
FROM
    (
        SELECT
            employee_id,
            SUM(bonus_amount) AS total_bonus
        FROM
            bonuses
        GROUP BY
            employee_id
    ) AS bonus_summary
    JOIN employees e ON bonus_summary.employee_id = e.employee_id
WHERE
    bonus_summary.total_bonus = (
        SELECT
            MAX(total_bonus)
        FROM
            (
                SELECT
                    SUM(bonus_amount) AS total_bonus
                FROM
                    bonuses
                GROUP BY
                    employee_id
            ) AS max_bonus
    );
