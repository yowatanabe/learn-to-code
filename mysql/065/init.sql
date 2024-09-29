-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
  );

CREATE TABLE
  Tasks (
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    TaskName VARCHAR(100),
    HoursSpent INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
  );

-- 初期データ挿入
INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (1, 'Web Development'),
  (2, 'Data Migration'),
  (3, 'Mobile App');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, HoursSpent)
VALUES
  (1, 1, 'Frontend Design', 20),
  (2, 1, 'Backend Integration', 25),
  (3, 2, 'Database Setup', 15),
  (4, 3, 'UI Testing', 10),
  (5, 3, 'API Development', 30);
