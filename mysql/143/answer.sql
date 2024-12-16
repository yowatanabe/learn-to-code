-- 非効率なクエリ
SELECT bl.line_name, SUM(t.price) AS total_revenue
FROM bus_lines bl
JOIN tickets t ON bl.line_id = t.line_id
WHERE t.purchased_at >= NOW() - INTERVAL 30 DAY
GROUP BY bl.line_id
ORDER BY total_revenue DESC
LIMIT 3;

-- EXPLAINの確認
EXPLAIN
SELECT bl.line_name, SUM(t.price) AS total_revenue
FROM bus_lines bl
JOIN tickets t ON bl.line_id = t.line_id
WHERE t.purchased_at >= NOW() - INTERVAL 30 DAY
GROUP BY bl.line_id
ORDER BY total_revenue DESC
LIMIT 3;


-- インデックスの追加
ALTER TABLE tickets
  ADD INDEX idx_line_date (line_id, purchased_at);


-- EXPLAINの確認
EXPLAIN
SELECT bl.line_name, SUM(t.price) AS total_revenue
FROM bus_lines bl
JOIN tickets t ON bl.line_id = t.line_id
WHERE t.purchased_at >= NOW() - INTERVAL 30 DAY
GROUP BY bl.line_id
ORDER BY total_revenue DESC
LIMIT 3;

