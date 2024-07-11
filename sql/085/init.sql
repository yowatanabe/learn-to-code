-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Accounts;

DROP TABLE IF EXISTS Transactions;

CREATE TABLE
    Accounts (
        AccountID INT PRIMARY KEY,
        AccountName VARCHAR(50),
        Balance DECIMAL(10, 2)
    );

CREATE TABLE
    Transactions (
        TransactionID INT PRIMARY KEY,
        AccountID INT,
        Amount DECIMAL(10, 2),
        TransactionDate DATE,
        FOREIGN KEY (AccountID) REFERENCES Accounts (AccountID)
    );

-- INSERT DATA
INSERT INTO
    Accounts (AccountID, AccountName, Balance)
VALUES
    (1, 'Alice', 1000),
    (2, 'Bob', 500);

INSERT INTO
    Transactions (TransactionID, AccountID, Amount, TransactionDate)
VALUES
    (1, 1, -100, '2024-07-12'),
    (2, 2, 100, '2024-07-12');
