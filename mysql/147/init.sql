-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade INT,
    graded_at DATETIME
    -- インデックスを意図的に作らない
);

-- 初期データ挿入
INSERT INTO students (student_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Emma'),
('Frank'),
('Grace'),
('Hannah'),
('Ian'),
('Jack');

INSERT INTO grades (student_id, course_id, grade, graded_at)
SELECT
    FLOOR(RAND()*10) + 1,   -- student_id: 1～10
    FLOOR(RAND()*5) + 1,    -- course_id: 1～5程度
    FLOOR(RAND()*50) + 50,  -- grade: 50～100点
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY)
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
