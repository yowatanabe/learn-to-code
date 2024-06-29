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
        ProductName VARCHAR(50),
        Price DECIMAL(10, 2)
    );

CREATE TABLE
    Sales (
        SaleID INT PRIMARY KEY,
        ProductID INT,
        CustomerID INT,
        SaleDate DATE,
        Quantity INT,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
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
    Products (ProductID, ProductName, Price)
VALUES
    (101, 'Laptop', 1000),
    (102, 'Smartphone', 300),
    (103, 'Tablet', 150);

INSERT INTO
    Sales (
        SaleID,
        ProductID,
        CustomerID,
        SaleDate,
        Quantity,
        TotalAmount
    )
VALUES
    (1, 101, 1, '2024-01-01', 2, 200.00),
    (2, 102, 2, '2024-01-05', 1, 300.00),
    (3, 103, 1, '2024-02-01', 1, 150.00),
    (4, 101, 3, '2024-02-15', 3, 600.00),
    (5, 102, 2, '2024-03-01', 2, 600.00);
