-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Customers (
        CustomerID INT PRIMARY KEY,
        CustomerName VARCHAR(50)
    );

CREATE TABLE
    Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        OrderDate DATE,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO
    Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-01-01', 150),
    (2, 2, '2024-01-05', 200),
    (3, 3, '2024-02-01', 300),
    (4, 1, '2024-02-10', 100),
    (5, 2, '2024-03-01', 250);
