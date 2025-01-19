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
    project_id INT,                         -- 外部キー
    task_name VARCHAR(100) NOT NULL,
    assigned_to VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- 初期データ挿入
INSERT INTO projects (project_name, start_date, end_date) VALUES
('Website Development', '2023-01-01', '2023-12-31'),
('Mobile App Launch', '2023-02-01', '2023-10-30'),
('Marketing Campaign', '2023-03-01', '2023-09-30'),
('AI Research', '2023-04-01', '2023-08-31'),
('Cybersecurity Initiative', '2023-05-01', '2023-11-30');

INSERT INTO tasks (project_id, task_name, assigned_to, due_date, status)
SELECT
    FLOOR(RAND()*5) + 1,                             -- project_id: 1～5
    CONCAT('Task_', FLOOR(RAND()*100)),              -- task_name
    CONCAT('User_', FLOOR(RAND()*10)),               -- assigned_to
    DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND()*30) DAY), -- ランダムな期限日
    ELT(FLOOR(RAND()*3) + 1, 'Pending', 'In Progress', 'Completed') -- ランダムなステータス
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
