-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Employees;

CREATE TABLE
    Employees (
        EmployeeID INT,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        Salary INT,
        HireDate DATE
    );

-- INSERT DATA
INSERT INTO
    Employees (EmployeeID, FirstName, LastName, Salary, HireDate)
VALUES
    (1, 'Alice', 'Smith', 60000, '2024-05-28'),
    (2, 'Bob', 'Johnson', 50000, '2024-05-27'),
    (3, 'Charlie', 'Williams', 70000, '2024-05-26'),
    (4, 'David', 'Brown', 45000, '2024-05-25'),
    (5, 'Eve', 'Davis', 65000, '2024-05-24');
