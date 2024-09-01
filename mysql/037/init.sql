-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
-- Studentsテーブルの作成
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL
  );

-- Coursesテーブルの作成
CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Instructor VARCHAR(100) NOT NULL
  );

-- Enrollmentsテーブルの作成
CREATE TABLE
  Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
  );

-- 初期データの挿入
-- Studentsテーブルにデータを挿入
INSERT INTO
  Students (StudentID, StudentName, Email)
VALUES
  (1, 'Alice', 'alice@example.com'),
  (2, 'Bob', 'bob@example.com'),
  (3, 'Charlie', 'charlie@example.com');

-- Coursesテーブルにデータを挿入
INSERT INTO
  Courses (CourseID, CourseName, Instructor)
VALUES
  (1, 'Database Systems', 'Dr. Smith'),
  (2, 'Network Security', 'Dr. Johnson'),
  (3, 'Operating Systems', 'Dr. Brown');

-- Enrollmentsテーブルにデータを挿入
INSERT INTO
  Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
  (1, 1, '2024-09-02'),
  (2, 2, '2024-09-03'),
  (3, 3, '2024-09-04'),
  (1, 3, '2024-09-05');
