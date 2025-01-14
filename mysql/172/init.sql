-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    student_name VARCHAR(100) NOT NULL,
    grade_level INT NOT NULL, -- 学年
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    student_id INT,                          -- 外部キー
    subject_name VARCHAR(100) NOT NULL,
    score DECIMAL(5, 2) NOT NULL,            -- 科目ごとの点数
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 初期データ挿入
INSERT INTO students (student_name, grade_level) VALUES
('Alice', 10),
('Bob', 11),
('Charlie', 10),
('Diana', 12),
('Eve', 11);

INSERT INTO grades (student_id, subject_name, score) VALUES
(1, 'Mathematics', 85.50),
(1, 'Science', 78.00),
(1, 'History', 92.00),
(2, 'Mathematics', 88.00),
(2, 'Science', 82.50),
(2, 'History', 79.00),
(3, 'Mathematics', 70.00),
(3, 'Science', 65.00),
(3, 'History', 72.50),
(4, 'Mathematics', 95.00),
(4, 'Science', 91.00),
(4, 'History', 89.50),
(5, 'Mathematics', 80.00),
(5, 'Science', 85.00),
(5, 'History', 87.00);
