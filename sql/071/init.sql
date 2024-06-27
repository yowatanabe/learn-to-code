-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS Posts;

CREATE TABLE
    Users (
        UserID INT PRIMARY KEY,
        UserName VARCHAR(50),
        Age INT,
        JoinDate DATE
    );

CREATE TABLE
    Posts (
        PostID INT PRIMARY KEY,
        UserID INT,
        PostDate DATE,
        Content VARCHAR(255),
        FOREIGN KEY (UserID) REFERENCES Users (UserID)
    );

-- INSERT DATA
INSERT INTO
    Users (UserID, UserName, Age, JoinDate)
VALUES
    (1, 'Alice', 30, '2021-05-01'),
    (2, 'Bob', 25, '2021-06-15'),
    (3, 'Charlie', 35, '2021-07-20'),
    (4, 'David', 40, '2021-08-25'),
    (5, 'Eve', 28, '2021-09-30');

INSERT INTO
    Posts (PostID, UserID, PostDate, Content)
VALUES
    (1, 1, '2022-01-01', 'Alice\'s first post'),
    (2, 2, '2022-01-15', 'Bob\'s first post'),
    (3, 3, '2022-02-01', 'Charlie\'s first post'),
    (4, 1, '2022-02-15', 'Alice\'s second post'),
    (5, 2, '2022-03-01', 'Bob\'s second post');
