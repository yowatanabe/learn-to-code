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
        StudentID INT PRIMARY KEY,
        StudentName VARCHAR(50)
    );

CREATE TABLE
    Courses (CourseID INT PRIMARY KEY, CourseName VARCHAR(50));

CREATE TABLE
    Enrollments (
        EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
        StudentID INT,
        CourseID INT,
        EnrollmentDate DATE,
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
    );

-- INSERT DATA
INSERT INTO
    Students (StudentID, StudentName)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO
    Courses (CourseID, CourseName)
VALUES
    (1, 'Mathematics'),
    (2, 'Science'),
    (3, 'Literature');

INSERT INTO
    Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, '2024-07-10'),
    (2, 2, '2024-07-11'),
    (3, 3, '2024-07-12'),
    (1, 2, '2024-07-13'),
    (2, 3, '2024-07-14');
