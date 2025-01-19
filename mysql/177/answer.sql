-- 1. タスク数が全プロジェクトの平均タスク数を上回っているプロジェクトを取得するクエリ
SELECT
    p.project_id,
    p.project_name,
    COUNT(t.task_id) AS task_count
FROM
    projects p
    JOIN tasks t ON p.project_id = t.project_id
GROUP BY
    p.project_id,
    p.project_name
HAVING
    COUNT(t.task_id) > (
        SELECT
            AVG(task_count)
        FROM
            (
                SELECT
                    project_id,
                    COUNT(task_id) AS task_count
                FROM
                    tasks
                GROUP BY
                    project_id
            ) AS subquery
    );
