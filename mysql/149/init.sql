-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    user_id INT,
    start_date DATETIME,
    end_date DATETIME,
    total_cost DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    -- この段階ではインデックスを付与しない
);

-- 初期データ挿入
INSERT INTO cars (brand, model) VALUES
('Toyota', 'Prius'),
('Honda', 'Civic'),
('Mazda', 'CX-5'),
('Tesla', 'Model 3'),
('BMW', '3 Series');

INSERT INTO reservations (car_id, user_id, start_date, end_date, total_cost, created_at)
SELECT
    FLOOR(RAND()*5) + 1,                        -- car_id: 1～5
    FLOOR(RAND()*1000) + 1,                     -- user_id: 1～1000
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY),  -- start_date: 60日以内
    DATE_ADD(NOW(), INTERVAL FLOOR(RAND()*5) DAY),    -- end_date: startより最大5日後
    ROUND(RAND()*300 + 100, 2),                 -- total_cost: 100.00 ～ 400.00 程度
    NOW()
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
