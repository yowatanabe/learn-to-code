-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Students;

CREATE TABLE
    Students (
        StudentID INT,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        GPA DECIMAL(3, 2),
        EnrollmentDate DATE
    );

-- INSERT DATA
INSERT INTO
    Students (
        StudentID,
        FirstName,
        LastName,
        GPA,
        EnrollmentDate
    )
VALUES
    (1, 'Alice', 'Johnson', 3.8, '2021-09-01'),
    (2, 'Bob', 'Smith', 3.5, '2020-09-01'),
    (3, 'Charlie', 'Brown', 3.9, '2022-01-15'),
    (4, 'David', 'Wilson', 2.8, '2019-09-01'),
    (5, 'Eve', 'Davis', 3.7, '2021-01-15');
