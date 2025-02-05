-- 最も多くのタスクを持つプロジェクトを取得するクエリ
SELECT
    p.project_name,
    p.manager,
    task_count
FROM
    (
        SELECT
            project_id,
            COUNT(task_id) AS task_count
        FROM
            tasks
        GROUP BY
            project_id
    ) AS task_summary
    JOIN projects p ON task_summary.project_id = p.project_id
WHERE
    task_summary.task_count = (
        SELECT
            MAX(task_count)
        FROM
            (
                SELECT
                    COUNT(task_id) AS task_count
                FROM
                    tasks
                GROUP BY
                    project_id
            ) AS max_tasks
    );
