-- データベースの作成
CREATE DATABASE UniversityDB;

-- データベースの選択
USE UniversityDB;

-- Studentsテーブルの作成
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL,
    GPA DECIMAL(3, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Students (StudentName, BirthDate, EnrollmentDate, GPA)
VALUES
  ('Alice', '2000-05-10', '2018-09-01', 3.8),
  ('Bob', '1999-11-22', '2017-09-01', 3.5),
  ('Charlie', '2001-01-30', '2019-09-01', 3.9);

-- すべての学生の名前とGPAを選択するクエリ
SELECT
  StudentName,
  GPA
FROM
  Students;

-- 特定のGPA以上の学生を選択するクエリ（例: GPAが3.7以上の学生）
SELECT
  StudentName,
  GPA
FROM
  Students
WHERE
  GPA >= 3.7;

-- 新しい学生を追加するクエリ
INSERT INTO
  Students (StudentName, BirthDate, EnrollmentDate, GPA)
VALUES
  ('David', '2000-08-15', '2018-09-01', 3.6);

-- 特定の学生のGPAを更新するクエリ（例: BobのGPAを3.6に更新）
UPDATE Students
SET
  GPA = 3.6
WHERE
  StudentName = 'Bob';

-- 特定の学生を削除するクエリ（例: Charlieを削除）
DELETE FROM Students
WHERE
  StudentName = 'Charlie';
