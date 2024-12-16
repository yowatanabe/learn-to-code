-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE bus_lines (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    line_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    passenger_name VARCHAR(50),
    price DECIMAL(10, 2),
    purchased_at DATETIME
    -- 故意にINDEXやFOREIGN KEYを付与しない
);

-- 初期データ挿入
INSERT INTO bus_lines (line_name) VALUES
('Route A'),
('Route B'),
('Route C'),
('Route D'),
('Route E');

INSERT INTO tickets (line_id, passenger_name, price, purchased_at)
SELECT
    FLOOR(RAND() * 5) + 1,
    CONCAT('Passenger_', FLOOR(RAND()*1000)),
    ROUND(RAND()*100 + 500, 2), -- 価格帯: 500～600円程度
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 60) DAY)
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
