-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    stock INT NOT NULL
  );

CREATE TABLE
  orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books (book_id)
  );

-- 初期データ挿入
INSERT INTO
  books (title, author, price, stock)
VALUES
  ('書籍A', '著者A', 2800.00, 10),
  ('書籍B', '著者B', 3500.00, 0),
  ('書籍C', '著者C', 3200.00, 5),
  ('書籍D', '著者D', 4000.00, 2),
  ('書籍E', '著者E', 3000.00, 0);

INSERT INTO
  orders (customer_name, book_id, quantity, order_date)
VALUES
  ('顧客1', 1, 2, '2024-09-21'),
  ('顧客2', 2, 1, '2024-09-22'),
  ('顧客3', 1, 1, '2024-09-23'),
  ('顧客4', 3, 3, '2024-09-24'),
  ('顧客5', 1, 1, '2024-09-25'),
  ('顧客6', 4, 1, '2024-09-26'),
  ('顧客7', 1, 1, '2024-09-27'),
  ('顧客8', 1, 1, '2024-09-28'),
  ('顧客9', 2, 2, '2024-09-29'),
  ('顧客10', 1, 1, '2024-09-30'),
  ('顧客11', 5, 1, '2024-10-01');
