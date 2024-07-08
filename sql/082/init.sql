-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Inventory;

DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Inventory (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50),
        Stock INT
    );

CREATE TABLE
    Orders (
        OrderID INT PRIMARY KEY,
        ProductID INT,
        Quantity INT,
        FOREIGN KEY (ProductID) REFERENCES Inventory (ProductID)
    );

-- INSERT DATA
INSERT INTO
    Inventory (ProductID, ProductName, Stock)
VALUES
    (1, 'Laptop', 10),
    (2, 'Mouse', 50),
    (3, 'Keyboard', 30);

INSERT INTO
    Orders (OrderID, ProductID, Quantity)
VALUES
    (1, 1, 2),
    (2, 2, 5);
