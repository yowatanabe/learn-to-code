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
        salary DECIMAL(10, 2) NOT NULL,
        department VARCHAR(100) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    employees (name, salary, department)
VALUES
    ('John Doe', 70000.00, 'Finance'),
    ('Jane Smith', 85000.00, 'Marketing'),
    ('Alice Johnson', 90000.00, 'Finance'),
    ('Mike Brown', 55000.00, 'IT'),
    ('Sarah Davis', 65000.00, 'Finance');
