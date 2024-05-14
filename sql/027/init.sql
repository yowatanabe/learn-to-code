-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS products;

DROP TABLE IF EXISTS suppliers;

CREATE TABLE
    products (
        productid INT,
        productname VARCHAR(50),
        supplierid INT
    );

CREATE TABLE
    suppliers (supplierid INT, suppliername VARCHAR(50));

-- INSERT DATA
INSERT INTO
    products (productid, productname, supplierid)
VALUES
    (1, 'Laptop', 1),
    (2, 'Mouse', 1),
    (3, 'Keyboard', 2),
    (4, 'Monitor', NULL);

INSERT INTO
    suppliers (supplierid, suppliername)
VALUES
    (1, 'Supplier A'),
    (2, 'Supplier B'),
    (3, 'Supplier C');
