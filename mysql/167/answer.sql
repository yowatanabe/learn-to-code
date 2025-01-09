-- 1. プロジェクトIDが `3` のタスク情報を取得するクエリ
SELECT
  *
FROM
  tasks
WHERE
  project_id = 3;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  tasks
WHERE
  project_id = 3;

-- インデックスを追加
ALTER TABLE tasks ADD INDEX idx_project_id (project_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  tasks
WHERE
  project_id = 3;
