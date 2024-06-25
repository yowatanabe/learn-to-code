-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS OrderDetails;

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
    Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        OrderDate DATE,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
    );

CREATE TABLE
    OrderDetails (
        OrderDetailID INT PRIMARY KEY,
        OrderID INT,
        ProductID INT,
        Quantity INT,
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
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
    Products (ProductID, ProductName, Price)
VALUES
    (101, 'Laptop', 1200),
    (102, 'Mouse', 25),
    (103, 'Keyboard', 75);

INSERT INTO
    Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-01-01', 150.00),
    (2, 2, '2024-01-05', 200.00),
    (3, 3, '2024-02-01', 300.00),
    (4, 1, '2024-02-10', 100.00),
    (5, 2, '2024-03-01', 250.00);

INSERT INTO
    OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 101, 1),
    (2, 1, 102, 2),
    (3, 2, 103, 1),
    (4, 3, 101, 2),
    (5, 4, 102, 1),
    (6, 5, 103, 3);
