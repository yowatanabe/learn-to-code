-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Sales;

CREATE TABLE
    Customers (
        CustomerID INT PRIMARY KEY,
        CustomerName VARCHAR(50)
    );

CREATE TABLE
    Products (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50)
    );

CREATE TABLE
    Sales (
        SaleID INT PRIMARY KEY,
        CustomerID INT,
        ProductID INT,
        SaleDate DATE,
        Quantity INT,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
        FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO
    Products (ProductID, ProductName)
VALUES
    (101, 'Laptop'),
    (102, 'Smartphone'),
    (103, 'Tablet');

INSERT INTO
    Sales (
        SaleID,
        CustomerID,
        ProductID,
        SaleDate,
        Quantity,
        TotalAmount
    )
VALUES
    (1, 1, 101, '2024-01-01', 2, 200.00),
    (2, 2, 102, '2024-01-05', 1, 300.00),
    (3, 1, 103, '2024-02-01', 1, 150.00),
    (4, 3, 101, '2024-02-10', 3, 300.00),
    (5, 2, 103, '2024-03-01', 2, 300.00);
