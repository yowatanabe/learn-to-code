-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(100),
    assigned_to VARCHAR(100),
    due_date DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT,
    status VARCHAR(50),
    updated_at DATETIME
    -- FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

-- 初期データ挿入
INSERT INTO tasks (task_name, assigned_to, due_date) VALUES
('Design UI', 'Alice', '2024-01-20'),
('Develop Backend', 'Bob', '2024-02-15'),
('Test Features', 'Charlie', '2024-01-30'),
('Deploy Application', 'David', '2024-03-01'),
('Fix Bugs', 'Emma', '2024-01-25'),
('Write Documentation', 'Frank', '2024-02-05'),
('Review Code', 'Grace', '2024-02-10'),
('Optimize Database', 'Hannah', '2024-02-20'),
('Prepare Report', 'Ian', '2024-01-28'),
('Conduct Training', 'Jack', '2024-02-18');

INSERT INTO task_progress (task_id, status, updated_at)
SELECT
    FLOOR(RAND()*10) + 1,                   -- task_id: 1～10
    CASE FLOOR(RAND()*3)                   -- ランダムなステータス
        WHEN 0 THEN 'In Progress'
        WHEN 1 THEN 'Completed'
        ELSE 'Pending'
    END,
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日時
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
