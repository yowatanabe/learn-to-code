-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Employees;

DROP TABLE IF EXISTS Departments;

DROP TABLE IF EXISTS Salaries;

CREATE TABLE
    Employees (
        EmployeeID INT,
        EmployeeName VARCHAR(50),
        DepartmentID INT
    );

CREATE TABLE
    Departments (DepartmentID INT, DepartmentName VARCHAR(50));

CREATE TABLE
    Salaries (
        SalaryID INT,
        EmployeeID INT,
        Salary DECIMAL(10, 2),
        PaymentDate DATE
    );

-- INSERT DATA
INSERT INTO
    Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
    (1, 'Alice', 101),
    (2, 'Bob', 102),
    (3, 'Charlie', 101),
    (4, 'David', 103),
    (5, 'Eve', 102);

INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES
    (101, 'HR'),
    (102, 'IT'),
    (103, 'Finance');

INSERT INTO
    Salaries (SalaryID, EmployeeID, Salary, PaymentDate)
VALUES
    (1, 1, 5000, '2024-05-31'),
    (2, 2, 6000, '2024-05-31'),
    (3, 3, 5500, '2024-05-31'),
    (4, 4, 7000, '2024-05-31'),
    (5, 5, 6500, '2024-05-31');
