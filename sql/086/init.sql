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
        HireDate DATE,
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
    Employees (
        EmployeeID,
        EmployeeName,
        DepartmentID,
        HireDate,
        Salary
    )
VALUES
    (1, 'Alice', 1, '2020-01-15', 60000),
    (2, 'Bob', 2, '2019-02-20', 70000),
    (3, 'Charlie', 1, '2021-03-10', 55000),
    (4, 'David', 3, '2018-04-25', 80000),
    (5, 'Eve', 2, '2020-05-30', 75000);
