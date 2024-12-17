-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT,
    log_message VARCHAR(255),
    updated_at DATETIME
    -- インデックスなし、外部キーなし
);

-- 初期データ挿入
INSERT INTO tasks (task_name) VALUES
('Design Database'),
('Implement API'),
('Create Frontend'),
('Write Documentation'),
('Setup CI/CD'),
('Deploy to Production');

INSERT INTO task_logs (task_id, log_message, updated_at)
SELECT
    FLOOR(RAND() * 6) + 1,
    CONCAT('Update_', FLOOR(RAND() * 1000)),
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 60) DAY)
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
