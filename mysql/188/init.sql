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

CREATE TABLE training_participants (
    participant_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    training_id INT,                              -- 外部キー
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (training_id) REFERENCES trainings(training_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO trainings (training_name, instructor, start_date, end_date) VALUES
('Kubernetes Basics', 'Alice', '2024-02-01', '2024-02-05'),
('AWS Security Best Practices', 'Bob', '2024-03-10', '2024-03-15'),
('Python for Data Science', 'Charlie', '2024-04-01', '2024-04-10');

INSERT INTO training_participants (training_id, employee_name, department, registration_date) VALUES
(1, 'Eve', 'Engineering', '2024-01-20'),
(1, 'Frank', 'DevOps', '2024-01-21'),
(2, 'Grace', 'Security', '2024-02-25'),
(2, 'Heidi', 'Cloud', '2024-02-26'),
(3, 'Ivan', 'Data Science', '2024-03-15');
