-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Customers (
        CustomerID INT,
        CustomerName VARCHAR(50),
        ContactEmail VARCHAR(50)
    );

CREATE TABLE
    Products (
        ProductID INT,
        ProductName VARCHAR(50),
        Price DECIMAL(10, 2)
    );

CREATE TABLE
    Orders (
        OrderID INT,
        CustomerID INT,
        ProductID INT,
        Quantity INT,
        OrderDate DATE
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName, ContactEmail)
VALUES
    (101, 'Alice', 'alice@example.com'),
    (102, 'Bob', 'bob@example.com'),
    (103, 'Charlie', 'charlie@example.com'),
    (104, 'David', 'david@example.com');

INSERT INTO
    Products (ProductID, ProductName, Price)
VALUES
    (1001, 'Laptop', 1200),
    (1002, 'Mouse', 25),
    (1003, 'Keyboard', 75);

INSERT INTO
    Orders (
        OrderID,
        CustomerID,
        ProductID,
        Quantity,
        OrderDate
    )
VALUES
    (1, 101, 1001, 2, '2024-05-01'),
    (2, 102, 1002, 1, '2024-05-02'),
    (3, 101, 1003, 1, '2024-05-03'),
    (4, 103, 1001, 4, '2024-05-04'),
    (5, 104, 1002, 3, '2024-05-05');
