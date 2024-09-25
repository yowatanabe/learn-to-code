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
    HoursWorked INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
  );

-- 初期データ挿入
INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (1, 'Alpha'),
  (2, 'Beta'),
  (3, 'Gamma');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, HoursWorked)
VALUES
  (1, 1, 'Design', 10),
  (2, 1, 'Development', 20),
  (3, 2, 'Testing', 15),
  (4, 3, 'Documentation', 8),
  (5, 3, 'Review', 5);
