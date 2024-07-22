-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS OrderDetails;

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

CREATE TABLE
    Products (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50)
    );

CREATE TABLE
    OrderDetails (
        OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
        OrderID INT,
        ProductID INT,
        Quantity INT,
        UnitPrice DECIMAL(10, 2),
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
    Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-01-01', 150.00),
    (2, 2, '2024-01-05', 200.00),
    (3, 1, '2024-02-01', 100.00),
    (4, 3, '2024-02-10', 300.00),
    (5, 2, '2024-03-01', 250.00);

INSERT INTO
    Products (ProductID, ProductName)
VALUES
    (1, 'Laptop'),
    (2, 'Mouse'),
    (3, 'Keyboard');

INSERT INTO
    OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 1, 1, 150.00),
    (2, 2, 10, 20.00),
    (3, 3, 2, 50.00),
    (4, 1, 1, 300.00),
    (5, 2, 5, 50.00);
