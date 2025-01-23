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

CREATE TABLE project_members (
    member_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    project_id INT,                           -- 外部キー
    member_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO projects (project_name, start_date, end_date) VALUES
('Website Development', '2023-01-01', '2023-12-31'),
('Mobile App Launch', '2023-02-01', '2023-10-30'),
('AI Research', '2023-03-01', '2023-09-30');

INSERT INTO project_members (project_id, member_name, role) VALUES
(1, 'Alice', 'Developer'),
(1, 'Bob', 'Project Manager'),
(2, 'Charlie', 'Designer'),
(2, 'Diana', 'Tester'),
(3, 'Eve', 'Data Scientist');
