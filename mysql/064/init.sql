-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Clubs (ClubID INT PRIMARY KEY, ClubName VARCHAR(100));

CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY,
    ClubID INT,
    StudentName VARCHAR(100),
    GradeLevel INT,
    FOREIGN KEY (ClubID) REFERENCES Clubs (ClubID)
  );

-- 初期データ挿入
INSERT INTO
  Clubs (ClubID, ClubName)
VALUES
  (1, 'Soccer'),
  (2, 'Basketball'),
  (3, 'Chess');

INSERT INTO
  Students (StudentID, ClubID, StudentName, GradeLevel)
VALUES
  (1, 1, 'Alice', 10),
  (2, 1, 'Bob', 11),
  (3, 2, 'Charlie', 12),
  (4, 3, 'David', 10),
  (5, 3, 'Eve', 11);
