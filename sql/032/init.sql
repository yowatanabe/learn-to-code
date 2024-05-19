-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

CREATE TABLE
    Orders (
        OrderID INT,
        CustomerID INT,
        OrderDate DATE,
        Amount INT
    );

CREATE TABLE
    Customers (CustomerID INT, CustomerName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
    (1, 1, '2024-05-01', 100),
    (2, 2, '2024-05-05', 150),
    (3, 1, '2024-05-10', 200),
    (4, 3, '2024-05-15', 250),
    (5, 2, '2024-05-20', 300);

INSERT INTO
    Customers (CustomerID, CustomerName)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');
