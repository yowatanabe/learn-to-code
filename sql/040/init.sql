-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Students;

DROP TABLE IF EXISTS Majors;

CREATE TABLE
    Students (
        StudentID INT,
        StudentName VARCHAR(50),
        Age INT,
        MajorID INT
    );

CREATE TABLE
    Majors (MajorID INT, MajorName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Students (StudentID, StudentName, Age, MajorID)
VALUES
    (1, 'Alice', 20, 1),
    (2, 'Bob', 22, 2),
    (3, 'Charlie', 21, 1),
    (4, 'David', 23, 3),
    (5, 'Eve', 20, 2);

INSERT INTO
    Majors (MajorID, MajorName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');
