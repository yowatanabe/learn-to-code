-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE trainings (
    training_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    training_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE training_attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    training_id INT,                              -- 外部キー
    employee_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    attendance_date DATE NOT NULL,
    FOREIGN KEY (training_id) REFERENCES trainings(training_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO trainings (training_name, instructor, start_date, end_date) VALUES
('Advanced SQL', 'Alice', '2024-02-01', '2024-02-15'),
('Cloud Infrastructure', 'Bob', '2024-03-01', '2024-03-10'),
('DevOps Practices', 'Charlie', '2024-04-01', '2024-04-15');

INSERT INTO training_attendance (training_id, employee_name, role, attendance_date) VALUES
(1, 'Eve', 'Data Analyst', '2024-02-02'),
(1, 'Frank', 'Software Engineer', '2024-02-03'),
(2, 'Grace', 'Cloud Engineer', '2024-03-02'),
(2, 'Heidi', 'DevOps Engineer', '2024-03-03'),
(3, 'Ivan', 'Site Reliability Engineer', '2024-04-02');
