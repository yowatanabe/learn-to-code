-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    user_name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activity_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    user_id INT,                          -- 外部キー
    activity_date DATETIME NOT NULL,
    activity_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 初期データ挿入
INSERT INTO users (user_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana'),
('Eve');

INSERT INTO activity_logs (user_id, activity_date, activity_type)
SELECT
    FLOOR(RAND()*5) + 1,                           -- user_id: 1～5
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*30) DAY), -- 過去30日間のランダム日時
    ELT(FLOOR(RAND()*3) + 1, 'Login', 'ViewPage', 'Purchase') -- ランダムなアクティビティ
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
