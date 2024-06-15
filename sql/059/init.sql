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
        OrderDate DATE,
        Quantity INT
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName, ContactEmail)
VALUES
    (1, 'Alice', 'alice@example.com'),
    (2, 'Bob', 'bob@example.com'),
    (3, 'Charlie', 'charlie@example.com');

INSERT INTO
    Products (ProductID, ProductName, Price)
VALUES
    (100, 'Laptop', 1200),
    (101, 'Mouse', 25),
    (102, 'Keyboard', 75),
    (103, 'Monitor', 300);

INSERT INTO
    Orders (
        OrderID,
        CustomerID,
        ProductID,
        OrderDate,
        Quantity
    )
VALUES
    (1, 1, 100, '2024-05-01', 2),
    (2, 2, 101, '2024-05-05', 1),
    (3, 1, 102, '2024-05-10', 5),
    (4, 3, 100, '2024-05-12', 1),
    (5, 2, 103, '2024-05-15', 3);
