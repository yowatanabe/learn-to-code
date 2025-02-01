-- 1. プロジェクトごとのタスクリストを取得するクエリ
SELECT
    p.project_name,
    p.manager,
    t.task_name,
    t.assignee,
    t.status,
    t.due_date
FROM
    projects p
    JOIN tasks t ON p.project_id = t.project_id
ORDER BY
    p.project_name,
    t.due_date;

-- 2. プロジェクト削除後のタスク確認クエリ
-- プロジェクト "Mobile App Development" を削除
DELETE FROM projects
WHERE
    project_name = 'Mobile App Development';

-- 残っているタスクを確認
SELECT
    *
FROM
    tasks;
