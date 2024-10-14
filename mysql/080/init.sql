-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Sales (
    SaleID INT PRIMARY KEY,
    BookID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

-- 初期データ挿入
INSERT INTO
  Books (BookID, BookTitle, Price)
VALUES
  (1, 'Learn SQL', 2000),
  (2, 'Mastering MySQL', 3000),
  (3, 'Advanced SQL', 2500);

INSERT INTO
  Sales (SaleID, BookID, Quantity, SaleDate)
VALUES
  (101, 1, 3, '2024-10-01'),
  (102, 2, 5, '2024-10-02'),
  (103, 1, 2, '2024-10-03'),
  (104, 3, 4, '2024-10-04'),
  (105, 2, 1, '2024-10-05');
