-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_name VARCHAR(100) NOT NULL,
    instructor_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_id INT,                                -- 外部キー
    student_name VARCHAR(100),
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO courses (course_name, instructor_name) VALUES
('Introduction to Python', 'Alice'),
('Data Science Basics', 'Bob'),
('Web Development', 'Charlie'),
('Cloud Computing', 'David'),
('Cybersecurity Essentials', 'Emma');

INSERT INTO enrollments (course_id, student_name, enrollment_date) VALUES
(1, 'John Doe', '2023-12-01'),
(1, 'Jane Smith', '2023-12-05'),
(2, 'John Doe', '2023-12-10'),
(3, 'Alice Johnson', '2023-12-15'),
(3, 'Michael Brown', '2023-12-20'),
(4, 'Jane Smith', '2023-12-25'),
(5, 'Alice Johnson', '2023-12-30');
