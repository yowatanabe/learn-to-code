-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Major VARCHAR(50)
  );

CREATE TABLE
  Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT,
    Course VARCHAR(100),
    Grade INT,
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
  );

-- 初期データ挿入
INSERT INTO
  Students (StudentID, StudentName, Major)
VALUES
  (1, 'Alice', 'Computer Science'),
  (2, 'Bob', 'Mathematics'),
  (3, 'Charlie', 'Computer Science'),
  (4, 'David', 'Physics'),
  (5, 'Eve', 'Mathematics');

INSERT INTO
  Grades (GradeID, StudentID, Course, Grade)
VALUES
  (1, 1, 'Math 101', 85),
  (2, 1, 'CS 101', 90),
  (3, 2, 'Math 101', 78),
  (4, 3, 'CS 101', 95),
  (5, 4, 'Physics 101', 88),
  (6, 5, 'Math 101', 92);
