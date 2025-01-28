-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE course_registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_id INT,                                  -- 外部キー
    student_name VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO courses (course_name, instructor, start_date, end_date) VALUES
('Python Programming', 'Alice', '2024-01-01', '2024-02-01'),
('Data Science', 'Bob', '2024-02-15', '2024-03-15'),
('DevOps Fundamentals', 'Charlie', '2024-03-01', '2024-03-31');

INSERT INTO course_registrations (course_id, student_name, registration_date) VALUES
(1, 'Eve', '2023-12-01'),
(1, 'Frank', '2023-12-02'),
(2, 'Grace', '2024-01-10'),
(2, 'Heidi', '2024-01-15'),
(3, 'Ivan', '2024-02-20');
