-- 非効率なクエリ
SELECT m.member_name,
       SUM(w.burned_calories) AS total_calories
FROM members m
JOIN workouts w ON m.member_id = w.member_id
WHERE w.workout_date >= NOW() - INTERVAL 14 DAY
GROUP BY m.member_id
ORDER BY total_calories DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT m.member_name,
       SUM(w.burned_calories) AS total_calories
FROM members m
JOIN workouts w ON m.member_id = w.member_id
WHERE w.workout_date >= NOW() - INTERVAL 14 DAY
GROUP BY m.member_id
ORDER BY total_calories DESC
LIMIT 5;

-- インデックスの最適化と管理
ALTER TABLE workouts
ADD INDEX idx_member_date (member_id, workout_date);

-- EXPLAINの確認（インデックス追加後）
EXPLAIN
SELECT m.member_name,
       SUM(w.burned_calories) AS total_calories
FROM members m
JOIN workouts w ON m.member_id = w.member_id
WHERE w.workout_date >= NOW() - INTERVAL 14 DAY
GROUP BY m.member_id
ORDER BY total_calories DESC
LIMIT 5;
