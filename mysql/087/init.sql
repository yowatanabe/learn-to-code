-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

-- 初期データ挿入
INSERT INTO
  Books (BookID, Title, Category, Price)
VALUES
  (1, 'SQL Mastery', 'Database', 2000),
  (2, 'MySQL Deep Dive', 'Database', 1800),
  (3, 'Web Development', 'Programming', 1500),
  (4, 'Cloud Computing', 'Technology', 2500);

INSERT INTO
  Orders (OrderID, BookID, OrderDate, Quantity)
VALUES
  (101, 1, '2024-10-01', 3),
  (102, 2, '2024-10-02', 2),
  (103, 3, '2024-10-03', 1),
  (104, 1, '2024-10-04', 5);
