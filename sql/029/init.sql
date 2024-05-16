-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS customers;

CREATE TABLE
    orders (orderid INT, customerid INT, orderdate DATE);

CREATE TABLE
    customers (customerid INT, customername VARCHAR(50));

-- INSERT DATA
INSERT INTO
    orders (orderid, customerid, orderdate)
VALUES
    (1, 1, '2024-05-17'),
    (2, 2, '2024-05-18'),
    (3, 3, '2024-05-19'),
    (4, 4, '2024-05-20');

INSERT INTO
    customers (customerid, customername)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (5, 'David');
