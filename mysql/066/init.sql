-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
  );

CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
  );

-- 初期データ挿入
INSERT INTO
  Students (StudentID, StudentName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Courses (CourseID, CourseName, StudentID)
VALUES
  (1, 'Math', 1),
  (2, 'Science', 2),
  (3, 'Literature', NULL);
