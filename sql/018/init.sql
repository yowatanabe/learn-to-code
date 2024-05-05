-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS employees;

CREATE TABLE
    IF NOT EXISTS employees (
        employee_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        salary DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    employees (name, salary)
VALUES
    ('従業員A', 250000.00),
    ('従業員B', 260000.00),
    ('従業員C', 255000.00),
    ('従業員D', 265000.00),
    ('従業員E', 247000.00),
    ('従業員F', 270000.00);
