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
    Major VARCHAR(100) NOT NULL
  );

-- Coursesテーブルの作成
CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Credits INT NOT NULL
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
  Students (StudentID, StudentName, Major)
VALUES
  (1, 'Alice', 'Computer Science'),
  (2, 'Bob', 'Mathematics'),
  (3, 'Charlie', 'Physics');

-- Coursesテーブルにデータを挿入
INSERT INTO
  Courses (CourseID, CourseName, Credits)
VALUES
  (101, 'Database Systems', 3),
  (102, 'Calculus II', 4),
  (103, 'Quantum Mechanics', 3);

-- Enrollmentsテーブルにデータを挿入
INSERT INTO
  Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
  (1, 101, '2024-09-05'),
  (2, 102, '2024-09-06'),
  (3, 103, '2024-09-07'),
  (1, 103, '2024-09-08');
