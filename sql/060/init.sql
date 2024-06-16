-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Students;

DROP TABLE IF EXISTS Courses;

DROP TABLE IF EXISTS Enrollments;

CREATE TABLE
    Students (
        StudentID INT,
        StudentName VARCHAR(50),
        Email VARCHAR(50)
    );

CREATE TABLE
    Courses (CourseID INT, CourseName VARCHAR(50));

CREATE TABLE
    Enrollments (
        EnrollmentID INT,
        StudentID INT,
        CourseID INT,
        EnrollmentDate DATE
    );

-- INSERT DATA
INSERT INTO
    Students (StudentID, StudentName, Email)
VALUES
    (1, 'Alice', 'alice@example.com'),
    (2, 'Bob', 'bob@example.com'),
    (3, 'Charlie', 'charlie@example.com');

INSERT INTO
    Courses (CourseID, CourseName)
VALUES
    (101, 'Mathematics'),
    (102, 'History'),
    (103, 'Computer Science');

INSERT INTO
    Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, 101, '2024-06-01'),
    (2, 2, 102, '2024-06-02'),
    (3, 1, 103, '2024-06-03'),
    (4, 3, 101, '2024-06-04'),
    (5, 2, 103, '2024-06-05');
