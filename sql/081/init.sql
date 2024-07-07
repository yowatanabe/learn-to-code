-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Accounts;

CREATE TABLE
    Accounts (
        AccountID INT PRIMARY KEY,
        AccountName VARCHAR(50),
        Balance DECIMAL(10, 2)
    );

-- INSERT DATA
INSERT INTO
    Accounts (AccountID, AccountName, Balance)
VALUES
    (1, 'Alice', 1000),
    (2, 'Bob', 500);
