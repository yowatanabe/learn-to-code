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
    student_name VARCHAR(100) NOT NULL,
    enrollment_date DATE NOT NULL
    -- FOREIGN KEY (course_id) REFERENCES courses(course_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO courses (course_name, instructor_name) VALUES
('Python Programming', 'Alice'),
('Data Science', 'Bob'),
('Web Development', 'Charlie'),
('Cloud Computing', 'David'),
('Cybersecurity', 'Emma');

INSERT INTO enrollments (course_id, student_name, enrollment_date)
SELECT
    FLOOR(RAND()*5) + 1,                          -- course_id: 1～5
    CONCAT('Student_', FLOOR(RAND()*500)),        -- student_name
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
