-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Customers;

CREATE TABLE
    Customers (
        CustomerID INT,
        CustomerName VARCHAR(50),
        Email VARCHAR(100)
    );

-- INSERT DATA
INSERT INTO
    Customers (CustomerID, CustomerName, Email)
VALUES
    (1, 'Alice Johnson', 'alice@example.com'),
    (2, 'Bob Smith', 'bob123@example.com'),
    (3, 'Charlie Brown', 'charlie_b@example.com'),
    (4, 'David Wilson', 'david.w@example.com'),
    (5, 'Eve Davis', 'eve_davis@example.org');
