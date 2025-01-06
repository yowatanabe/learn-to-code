-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE watch_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    user_id INT,                               -- 外部キー
    video_title VARCHAR(200) NOT NULL,
    watch_date DATETIME NOT NULL
    -- FOREIGN KEY (user_id) REFERENCES users(user_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO users (username, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Diana', 'diana@example.com'),
('Eve', 'eve@example.com');

INSERT INTO watch_history (user_id, video_title, watch_date)
SELECT
    FLOOR(RAND()*5) + 1,                       -- user_id: 1～5
    CONCAT('Video ', FLOOR(RAND()*100)),       -- video_title
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日時
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
