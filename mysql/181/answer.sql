-- 1. プロジェクトごとのメンバーリストを取得するクエリ
SELECT
    p.project_name,
    m.member_name,
    m.role
FROM
    projects p
    JOIN project_members m ON p.project_id = m.project_id
ORDER BY
    p.project_name,
    m.role;

-- 2. 外部キー制約に違反しないデータ挿入の例
-- 存在するプロジェクトに新しいメンバーを追加
INSERT INTO
    project_members (project_id, member_name, role)
VALUES
    (1, 'Frank', 'Tester');
