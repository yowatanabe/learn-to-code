-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(100),
    author_name VARCHAR(100),
    price DECIMAL(10,2),          -- 書籍の価格
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    quantity INT,
    purchase_date DATE
    -- FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- 初期データ挿入
INSERT INTO books (book_title, author_name, price) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 15.00),
('1984', 'George Orwell', 12.00),
('To Kill a Mockingbird', 'Harper Lee', 10.00),
('The Catcher in the Rye', 'J.D. Salinger', 10.00),
('Moby Dick', 'Herman Melville', 20.00),
('Pride and Prejudice', 'Jane Austen', 8.00),
('War and Peace', 'Leo Tolstoy', 25.00),
('Ulysses', 'James Joyce', 22.00),
('The Odyssey', 'Homer', 18.00),
('Crime and Punishment', 'Fyodor Dostoevsky', 14.00);

INSERT INTO purchases (book_id, quantity, purchase_date)
SELECT
    FLOOR(RAND()*10) + 1,                   -- book_id: 1～10
    FLOOR(RAND()*5) + 1,                    -- quantity: 1～5
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
