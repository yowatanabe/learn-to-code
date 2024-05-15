-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS classes;

CREATE TABLE
    students (
        studentid INT,
        studentname VARCHAR(50),
        classid INT
    );

CREATE TABLE
    classes (classid INT, classname VARCHAR(50));

-- INSERT DATA
INSERT INTO
    students (studentid, studentname, classid)
VALUES
    (1, 'John', 101),
    (2, 'Mary', 102),
    (3, 'Sam', 103),
    (4, 'Lily', NULL);

INSERT INTO
    classes (classid, classname)
VALUES
    (101, 'Mathematics'),
    (102, 'Science'),
    (103, 'History'),
    (104, 'Physical Ed');
