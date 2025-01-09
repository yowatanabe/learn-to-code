-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    project_id INT,                        -- 外部キー
    task_name VARCHAR(100) NOT NULL,
    assigned_to VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL
    -- FOREIGN KEY (project_id) REFERENCES projects(project_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO projects (project_name, start_date, end_date) VALUES
('Website Redesign', '2023-01-01', '2023-12-31'),
('Mobile App Development', '2023-03-01', '2023-11-30'),
('Cloud Migration', '2023-02-15', '2023-10-15'),
('AI Implementation', '2023-05-01', '2023-09-30'),
('Security Audit', '2023-07-01', '2023-12-31');

INSERT INTO tasks (project_id, task_name, assigned_to, due_date, status)
SELECT
    FLOOR(RAND()*5) + 1,                          -- project_id: 1～5
    CONCAT('Task_', FLOOR(RAND()*500)),           -- task_name
    CONCAT('User_', FLOOR(RAND()*100)),           -- assigned_to
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*60) DAY), -- 過去60日間のランダム日付
    ELT(FLOOR(RAND()*3) + 1, 'Pending', 'In Progress', 'Completed') -- ランダムなステータス
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
