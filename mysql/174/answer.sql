-- 1. 最もアクティビティ回数が多いユーザーを取得するクエリ
SELECT
    u.user_id,
    u.user_name,
    subquery.activity_count
FROM
    (
        SELECT
            user_id,
            COUNT(*) AS activity_count
        FROM
            activity_logs
        GROUP BY
            user_id
    ) AS subquery
    JOIN users u ON u.user_id = subquery.user_id
WHERE
    subquery.activity_count = (
        SELECT
            MAX(activity_count)
        FROM
            (
                SELECT
                    user_id,
                    COUNT(*) AS activity_count
                FROM
                    activity_logs
                GROUP BY
                    user_id
            ) AS inner_subquery
    );
