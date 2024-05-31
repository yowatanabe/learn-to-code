-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Orders;

CREATE TABLE
    Orders (
        OrderID INT,
        CustomerName VARCHAR(50),
        OrderAmount DECIMAL(10, 2),
        OrderDate DATE
    );

-- INSERT DATA
INSERT INTO
    Orders (OrderID, CustomerName, OrderAmount, OrderDate)
VALUES
    (1, 'Alice', 120.50, '2024-01-15'),
    (2, 'Bob', 85.00, '2024-02-10'),
    (3, 'Charlie', 100.75, '2024-03-05'),
    (4, 'David', 65.00, '2024-01-25'),
    (5, 'Eve', 150.00, '2024-02-20');
