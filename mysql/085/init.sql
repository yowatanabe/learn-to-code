-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Members (MemberID INT PRIMARY KEY, MemberName VARCHAR(100));

CREATE TABLE
  Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Instructor VARCHAR(100)
  );

CREATE TABLE
  Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    AttendanceDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members (MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes (ClassID)
  );

-- 初期データ挿入
INSERT INTO
  Members (MemberID, MemberName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Classes (ClassID, ClassName, Instructor)
VALUES
  (101, 'Yoga', 'John'),
  (102, 'Pilates', 'Sarah'),
  (103, 'Strength Training', 'Michael');

INSERT INTO
  Attendance (AttendanceID, MemberID, ClassID, AttendanceDate)
VALUES
  (1, 1, 101, '2024-10-01'),
  (2, 2, 101, '2024-10-01'),
  (3, 1, 102, '2024-10-02'),
  (4, 3, 103, '2024-10-03'),
  (5, 2, 101, '2024-10-05');
