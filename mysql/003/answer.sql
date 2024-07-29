-- データベースの作成
CREATE DATABASE SchoolDB;

-- データベースの選択
USE SchoolDB;

-- Studentsテーブルの作成
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    EnrollmentDate DATE NOT NULL
  );

-- Coursesテーブルの作成
CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL
  );

-- Enrollmentsテーブルの作成
CREATE TABLE
  Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade CHAR(1),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
  );

-- Studentsテーブルへのデータ挿入
INSERT INTO
  Students (StudentName, EnrollmentDate)
VALUES
  ('Alice', '2024-07-30'),
  ('Bob', '2024-07-30'),
  ('Charlie', '2024-07-30');

-- Coursesテーブルへのデータ挿入
INSERT INTO
  Courses (CourseName)
VALUES
  ('Mathematics'),
  ('Science'),
  ('Literature');

-- Enrollmentsテーブルへのデータ挿入
INSERT INTO
  Enrollments (StudentID, CourseID, Grade)
VALUES
  (1, 1, 'A'),
  (1, 2, 'B'),
  (2, 1, 'C'),
  (2, 3, 'B'),
  (3, 2, 'A');
