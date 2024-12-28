-- 非効率なクエリ
SELECT t.task_name,
       COUNT(tp.progress_id) AS total_updates
FROM tasks t
JOIN task_progress tp ON t.task_id = tp.task_id
WHERE tp.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY total_updates DESC
LIMIT 5;

-- EXPLAINの確認（非効率な状態）
EXPLAIN
SELECT t.task_name,
       COUNT(tp.progress_id) AS total_updates
FROM tasks t
JOIN task_progress tp ON t.task_id = tp.task_id
WHERE tp.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY total_updates DESC
LIMIT 5;

-- インデックスの最適化
ALTER TABLE task_progress
ADD INDEX idx_updated_at_task (updated_at, task_id);

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT t.task_name,
       COUNT(tp.progress_id) AS total_updates
FROM tasks t
JOIN task_progress tp ON t.task_id = tp.task_id
WHERE tp.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY total_updates DESC
LIMIT 5;
