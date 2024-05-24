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
        EmployeeName VARCHAR(50),
        DepartmentID INT,
        Salary INT
    );

CREATE TABLE
    Departments (DepartmentID INT, DepartmentName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Employees (EmployeeID, EmployeeName, DepartmentID, Salary)
VALUES
    (1, 'Alice', 1, 60000),
    (2, 'Bob', 2, 50000),
    (3, 'Charlie', 1, 70000),
    (4, 'David', 3, 45000),
    (5, 'Eve', 2, 65000);

INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
