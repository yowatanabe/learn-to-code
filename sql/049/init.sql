-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Employees;

CREATE TABLE
    Employees (
        EmployeeID INT,
        EmployeeName VARCHAR(100),
        Email VARCHAR(100)
    );

-- INSERT DATA
INSERT INTO
    Employees (EmployeeID, EmployeeName, Email)
VALUES
    (1, 'Alice Johnson', 'alice.johnson@company.com'),
    (2, 'Bob Smith', 'bob.smith@company.com'),
    (3, 'Charlie Brown', 'charlie.brown@company.com'),
    (4, 'David Wilson', 'david.wilson@company.com'),
    (5, 'Eve Davis', 'eve.davis@company.org');
