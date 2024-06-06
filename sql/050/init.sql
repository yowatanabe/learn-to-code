-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Users;

CREATE TABLE
    Users (
        UserID INT,
        UserName VARCHAR(50),
        ContactNumber VARCHAR(15)
    );

-- INSERT DATA
INSERT INTO
    Users (UserID, UserName, ContactNumber)
VALUES
    (1, 'Alice', '123-456-7890'),
    (2, 'Bob', '987-654-3210'),
    (3, 'Charlie', '555-123-4567'),
    (4, 'David', '123-123-1234'),
    (5, 'Eve', '555-555-5555');
