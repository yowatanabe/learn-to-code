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
    (1, 'John', 'Doe', 50000, '2019-03-15'),
    (2, 'Jane', 'Smith', 60000, '2018-07-22'),
    (3, 'Jim', 'Brown', 55000, '2020-01-10'),
    (4, 'Jake', 'White', 65000, '2021-08-30'),
    (5, 'Jill', 'Black', 70000, '2017-05-17');
