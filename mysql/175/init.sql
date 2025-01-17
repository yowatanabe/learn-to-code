-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_name VARCHAR(100) NOT NULL,
    instructor_name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    course_id INT,                                -- 外部キー
    student_name VARCHAR(100) NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 初期データ挿入
INSERT INTO courses (course_name, instructor_name) VALUES
('Introduction to Programming', 'Alice'),
('Data Science Basics', 'Bob'),
('Web Development', 'Charlie'),
('Machine Learning', 'Diana'),
('Cloud Computing', 'Eve');

INSERT INTO enrollments (course_id, student_name, enrollment_date)
SELECT
    FLOOR(RAND()*5) + 1,                          -- course_id: 1～5
    CONCAT('Student_', FLOOR(RAND()*100)),        -- student_name
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*30) DAY) -- 過去30日間のランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
