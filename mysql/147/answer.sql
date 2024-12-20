-- 非効率なクエリ
SELECT s.student_name, AVG(g.grade) AS avg_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.graded_at >= NOW() - INTERVAL 30 DAY
GROUP BY s.student_id
ORDER BY avg_grade DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT s.student_name, AVG(g.grade) AS avg_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.graded_at >= NOW() - INTERVAL 30 DAY
GROUP BY s.student_id
ORDER BY avg_grade DESC
LIMIT 5;

-- インデックスの最適化
ALTER TABLE grades
  ADD INDEX idx_student_date (student_id, graded_at);

-- EXPLAINの確認（インデックス追加後）
EXPLAIN
SELECT s.student_name, AVG(g.grade) AS avg_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.graded_at >= NOW() - INTERVAL 30 DAY
GROUP BY s.student_id
ORDER BY avg_grade DESC
LIMIT 5;
