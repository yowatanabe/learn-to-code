-- 非効率なクエリ
SELECT c.brand,
       c.model,
       SUM(r.total_cost) AS total_income
FROM cars c
JOIN reservations r ON c.car_id = r.car_id
WHERE r.start_date >= NOW() - INTERVAL 30 DAY
GROUP BY c.car_id
ORDER BY total_income DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT c.brand,
       c.model,
       SUM(r.total_cost) AS total_income
FROM cars c
JOIN reservations r ON c.car_id = r.car_id
WHERE r.start_date >= NOW() - INTERVAL 30 DAY
GROUP BY c.car_id
ORDER BY total_income DESC
LIMIT 5;

-- インデックスの最適化と管理
ALTER TABLE reservations
ADD INDEX idx_date_car (start_date, car_id);

-- EXPLAINの確認（改善後）
EXPLAIN
SELECT c.brand,
       c.model,
       SUM(r.total_cost) AS total_income
FROM cars c
JOIN reservations r ON c.car_id = r.car_id
WHERE r.start_date >= NOW() - INTERVAL 30 DAY
GROUP BY c.car_id
ORDER BY total_income DESC
LIMIT 5;
