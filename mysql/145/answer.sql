-- 非効率なクエリ
SELECT c.course_name, COUNT(cv.view_id) AS total_views
FROM courses c
JOIN course_views cv ON c.course_id = cv.course_id
WHERE cv.viewed_at >= NOW() - INTERVAL 30 DAY
GROUP BY c.course_id
ORDER BY total_views DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT c.course_name, COUNT(cv.view_id) AS total_views
FROM courses c
JOIN course_views cv ON c.course_id = cv.course_id
WHERE cv.viewed_at >= NOW() - INTERVAL 30 DAY
GROUP BY c.course_id
ORDER BY total_views DESC
LIMIT 5;

-- チューニング
ALTER TABLE course_views
  ADD INDEX idx_course_date (course_id, viewed_at);

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT c.course_name, COUNT(cv.view_id) AS total_views
FROM courses c
JOIN course_views cv ON c.course_id = cv.course_id
WHERE cv.viewed_at >= NOW() - INTERVAL 30 DAY
GROUP BY c.course_id
ORDER BY total_views DESC
LIMIT 5;
