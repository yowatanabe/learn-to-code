-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    location VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    customer_name VARCHAR(100),
    reservation_date DATETIME,
    number_of_guests INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    -- FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- 初期データ挿入
INSERT INTO restaurants (restaurant_name, location) VALUES
('Sushi Place', 'Tokyo'),
('Italian Bistro', 'Osaka'),
('BBQ Heaven', 'Kyoto'),
('Vegan Delight', 'Tokyo'),
('Seafood Shack', 'Fukuoka'),
('Pizza World', 'Osaka'),
('Burger Joint', 'Sapporo'),
('Pasta Paradise', 'Nagoya'),
('Ramen House', 'Hiroshima'),
('Steak House', 'Tokyo');

INSERT INTO reservations (restaurant_id, customer_name, reservation_date, number_of_guests, created_at)
SELECT
    FLOOR(RAND()*10) + 1,                   -- restaurant_id: 1～10
    CONCAT('Customer_', FLOOR(RAND()*1000)), -- 顧客名
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY), -- 過去60日間のランダム日付
    FLOOR(RAND()*5) + 1,                   -- number_of_guests: 1～5
    NOW()
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
