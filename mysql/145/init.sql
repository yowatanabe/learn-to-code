-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE course_views (
    view_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    user_id INT,
    viewed_at DATETIME
    -- 故意にINDEXを作成しない
);

-- 初期データ挿入
INSERT INTO courses (course_name) VALUES
('Python Basics'),
('Advanced SQL'),
('Web Development'),
('Machine Learning'),
('Data Science'),
('Cloud Computing'),
('DevOps Fundamentals'),
('UI/UX Design'),
('Cybersecurity 101'),
('Project Management');

INSERT INTO course_views (course_id, user_id, viewed_at)
SELECT
    FLOOR(RAND()*10) + 1,
    FLOOR(RAND()*1000) + 1,
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY)
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
