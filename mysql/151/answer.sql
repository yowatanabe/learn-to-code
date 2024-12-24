-- 非効率なクエリ
SELECT r.restaurant_name,
       COUNT(res.reservation_id) AS total_reservations
FROM restaurants r
JOIN reservations res ON r.restaurant_id = res.restaurant_id
WHERE res.reservation_date >= NOW() - INTERVAL 30 DAY
GROUP BY r.restaurant_id
ORDER BY total_reservations DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT r.restaurant_name,
       COUNT(res.reservation_id) AS total_reservations
FROM restaurants r
JOIN reservations res ON r.restaurant_id = res.restaurant_id
WHERE res.reservation_date >= NOW() - INTERVAL 30 DAY
GROUP BY r.restaurant_id
ORDER BY total_reservations DESC
LIMIT 5;

-- インデックスの最適化と管理
ALTER TABLE reservations
ADD INDEX idx_date_restaurant (reservation_date, restaurant_id);

-- EXPLAINの確認（インデックス追加後）
EXPLAIN
SELECT r.restaurant_name,
       COUNT(res.reservation_id) AS total_reservations
FROM restaurants r
JOIN reservations res ON r.restaurant_id = res.restaurant_id
WHERE res.reservation_date >= NOW() - INTERVAL 30 DAY
GROUP BY r.restaurant_id
ORDER BY total_reservations DESC
LIMIT 5;
