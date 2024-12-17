-- 非効率なクエリ
SELECT t.task_name, COUNT(l.log_id) AS update_count
FROM tasks t
JOIN task_logs l ON t.task_id = l.task_id
WHERE l.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY update_count DESC
LIMIT 3;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT t.task_name, COUNT(l.log_id) AS update_count
FROM tasks t
JOIN task_logs l ON t.task_id = l.task_id
WHERE l.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY update_count DESC
LIMIT 3;

-- インデックスの追加
ALTER TABLE task_logs
  ADD INDEX idx_task_date (task_id, updated_at);

-- クエリはそのまま
SELECT t.task_name, COUNT(l.log_id) AS update_count
FROM tasks t
JOIN task_logs l ON t.task_id = l.task_id
WHERE l.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY update_count DESC
LIMIT 3;

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT t.task_name, COUNT(l.log_id) AS update_count
FROM tasks t
JOIN task_logs l ON t.task_id = l.task_id
WHERE l.updated_at >= NOW() - INTERVAL 30 DAY
GROUP BY t.task_id
ORDER BY update_count DESC
LIMIT 3;
