-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Employees;

DROP TABLE IF EXISTS Departments;

CREATE TABLE
    Employees (
        EmployeeID INT,
        Name VARCHAR(50),
        DepartmentID INT
    );

CREATE TABLE
    Departments (DepartmentID INT, DepartmentName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Employees (EmployeeID, Name, DepartmentID)
VALUES
    (1, 'Alice', 1),
    (2, 'Bob', 2),
    (3, 'Charlie', 3),
    (4, 'David', NULL);

INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing');
