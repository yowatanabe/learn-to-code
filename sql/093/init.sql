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
        DepartmentName VARCHAR(50),
        TotalSalary DECIMAL(10, 2) DEFAULT 0
    );

CREATE TABLE
    Employees (
        EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
        EmployeeName VARCHAR(50),
        DepartmentID INT,
        Salary DECIMAL(10, 2),
        FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
    );

-- INSERT DATA
INSERT INTO
    Departments (DepartmentID, DepartmentName, TotalSalary)
VALUES
    (1, 'HR', 0),
    (2, 'IT', 0),
    (3, 'Finance', 0);

INSERT INTO
    Employees (EmployeeName, DepartmentID, Salary)
VALUES
    ('Alice', 1, 60000),
    ('Bob', 2, 70000),
    ('Charlie', 1, 55000),
    ('David', 3, 80000),
    ('Eve', 2, 75000);
