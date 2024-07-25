-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Departments;

DROP TABLE IF EXISTS Employees;

DROP TABLE IF EXISTS Salaries;

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
        FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
    );

CREATE TABLE
    Salaries (
        SalaryID INT PRIMARY KEY AUTO_INCREMENT,
        EmployeeID INT,
        Salary DECIMAL(10, 2),
        PaymentDate DATE,
        FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
    );

-- INSERT DATA
INSERT INTO
    Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO
    Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
    (1, 'Alice', 1),
    (2, 'Bob', 2),
    (3, 'Charlie', 1),
    (4, 'David', 3),
    (5, 'Eve', 2);

INSERT INTO
    Salaries (EmployeeID, Salary, PaymentDate)
VALUES
    (1, 60000, '2024-07-26'),
    (2, 70000, '2024-07-26'),
    (3, 55000, '2024-07-26'),
    (4, 80000, '2024-07-26'),
    (5, 75000, '2024-07-26');
