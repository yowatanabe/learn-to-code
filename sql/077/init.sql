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

-- Employeesテーブルの作成
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
    (10, 'HR'),
    (20, 'IT'),
    (30, 'Finance');

INSERT INTO
    Employees (
        EmployeeID,
        EmployeeName,
        DepartmentID,
        HireDate,
        Salary
    )
VALUES
    (1, 'Alice', 10, '2020-01-15', 60000),
    (2, 'Bob', 20, '2019-02-20', 70000),
    (3, 'Charlie', 10, '2021-03-10', 55000),
    (4, 'David', 30, '2018-04-25', 80000),
    (5, 'Eve', 20, '2020-05-30', 75000);
