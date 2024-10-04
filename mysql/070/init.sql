-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Books (BookID INT PRIMARY KEY, BookTitle VARCHAR(100));

CREATE TABLE
  Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

-- 初期データ挿入
INSERT INTO
  Books (BookID, BookTitle)
VALUES
  (1, 'SQL Basics'),
  (2, 'Advanced MySQL'),
  (3, 'Database Design'),
  (4, 'Cloud Computing');

INSERT INTO
  Authors (AuthorID, AuthorName, BookID)
VALUES
  (1, 'Alice Johnson', 1),
  (2, 'Bob Smith', 3),
  (3, 'Charlie Davis', NULL);
