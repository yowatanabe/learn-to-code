-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;
CREATE DATABASE learn_to_code;
USE learn_to_code;

-- CREATE TABLE
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Department VARCHAR(50),
  Salary DECIMAL(10, 2)
);

-- INSERT DATA
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
  (1, 'John', 'Doe', 'Sales', 5000.00),
  (2, 'Jane', 'Smith', 'Marketing', 6000.00),
  (3, 'David', 'Johnson', 'IT', 7000.00),
  (4, 'Sarah', 'Williams', 'HR', 5500.00),
  (5, 'Michael', 'Brown', 'Finance', 6500.00);
