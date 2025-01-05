-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    user_id INT,                            -- 外部キー
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    -- FOREIGN KEY (user_id) REFERENCES users(user_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO users (username, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Diana', 'diana@example.com'),
('Eve', 'eve@example.com');

INSERT INTO posts (user_id, title, content, created_at)
SELECT
    FLOOR(RAND()*5) + 1,                      -- user_id: 1～5
    CONCAT('Blog Title ', FLOOR(RAND()*500)), -- title
    CONCAT('Content for blog post ', FLOOR(RAND()*500)), -- content
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日時
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
