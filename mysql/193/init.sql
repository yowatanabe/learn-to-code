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

CREATE TABLE course_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_id INT,                              -- 外部キー
    student_name VARCHAR(100) NOT NULL,
    progress_percentage INT NOT NULL,           -- 進捗率 (0-100%)
    last_updated DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 初期データ挿入
INSERT INTO courses (course_name, instructor, start_date, end_date) VALUES
('Python Basics', 'Alice', '2024-02-01', '2024-03-01'),
('Data Science Fundamentals', 'Bob', '2024-03-15', '2024-04-15'),
('Cloud Computing', 'Charlie', '2024-04-10', '2024-05-10');

INSERT INTO course_progress (course_id, student_name, progress_percentage, last_updated) VALUES
(1, 'Eve', 50, '2024-02-10'),
(1, 'Frank', 80, '2024-02-15'),
(2, 'Grace', 60, '2024-03-20'),
(2, 'Heidi', 90, '2024-03-25'),
(3, 'Ivan', 70, '2024-04-15'),
(3, 'Jack', 85, '2024-04-20');
