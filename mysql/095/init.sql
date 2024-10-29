-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100)
  );

CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors (InstructorID)
  );

CREATE TABLE
  Enrollments (
    EnrollmentID INT PRIMARY KEY,
    CourseID INT,
    EnrollmentDate DATE,
    StudentCount INT,
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
  );

-- 初期データ挿入
INSERT INTO
  Instructors (InstructorID, InstructorName)
VALUES
  (1, 'Alice Johnson'),
  (2, 'Bob Smith'),
  (3, 'Carol Lee');

INSERT INTO
  Courses (CourseID, CourseName, InstructorID)
VALUES
  (101, 'Data Science 101', 1),
  (102, 'Machine Learning', 1),
  (103, 'Python Programming', 2),
  (104, 'Web Development', 3);

INSERT INTO
  Enrollments (
    EnrollmentID,
    CourseID,
    EnrollmentDate,
    StudentCount
  )
VALUES
  (1, 101, '2024-10-30', 50),
  (2, 102, '2024-11-01', 30),
  (3, 103, '2024-11-02', 20),
  (4, 101, '2024-11-03', 25),
  (5, 104, '2024-11-04', 40);
