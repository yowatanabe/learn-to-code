-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- データベースの選択
CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(255)
  );

CREATE TABLE
  Tasks (
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    TaskName VARCHAR(255),
    Progress INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
  );

-- 初期データ挿入
INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (1, 'Project A'),
  (2, 'Project B'),
  (3, 'Project C');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, Progress)
VALUES
  (1, 1, 'Design Phase', 20),
  (2, 1, 'Development', 50),
  (3, 1, 'Testing', 70),
  (4, 2, 'Documentation', 40),
  (5, 2, 'Deployment', 60);
