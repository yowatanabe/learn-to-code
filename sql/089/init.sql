-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Departments;

DROP TABLE IF EXISTS Employees;

CREATE TABLE
    Departments (
        DepartmentID INT PRIMARY KEY,
        DepartmentName VARCHAR(50)
    );

CREATE TABLE
    Employees (
        EmployeeID INT PRIMARY KEY,
        EmployeeName VARCHAR(50),
        DepartmentID INT,
        Salary DECIMAL(10, 2),
        FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
    );

-- INSERT DATA
INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO
    Employees (EmployeeID, EmployeeName, DepartmentID, Salary)
VALUES
    (1, 'Alice', 1, 60000),
    (2, 'Bob', 2, 70000),
    (3, 'Charlie', 1, 55000),
    (4, 'David', 3, 80000),
    (5, 'Eve', 2, 75000);
