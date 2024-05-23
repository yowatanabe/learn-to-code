-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Customers (
        CustomerID INT,
        CustomerName VARCHAR(50),
        City VARCHAR(50)
    );

CREATE TABLE
    Orders (
        OrderID INT,
        CustomerID INT,
        OrderAmount INT,
        OrderDate DATE
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName, City)
VALUES
    (1, 'Alice', 'New York'),
    (2, 'Bob', 'Los Angeles'),
    (3, 'Charlie', 'New York'),
    (4, 'David', 'Chicago'),
    (5, 'Eve', 'Los Angeles');

INSERT INTO
    Orders (OrderID, CustomerID, OrderAmount, OrderDate)
VALUES
    (1, 1, 100, '2024-05-24'),
    (2, 2, 200, '2024-05-25'),
    (3, 3, 150, '2024-05-26'),
    (4, 4, 300, '2024-05-27'),
    (5, 1, 250, '2024-05-28');
