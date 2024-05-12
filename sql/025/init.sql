-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS order_details;

CREATE TABLE
    IF NOT EXISTS order_details (
        order_id INT,
        dish_name VARCHAR(255) NOT NULL,
        quantity INT NOT NULL
    );

-- INSERT DATA
INSERT INTO
    order_details (order_id, dish_name, quantity)
VALUES
    (1, 'Pizza', 1),
    (1, 'Pasta', 2),
    (1, 'Pizza', 1),
    (2, 'Pizza', 3),
    (2, 'Salad', 1),
    (3, 'Burger', 2),
    (3, 'Pizza', 2),
    (4, 'Pizza', 1),
    (4, 'Pizza', 2),
    (5, 'Steak', 1),
    (5, 'Pizza', 4);
