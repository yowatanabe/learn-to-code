-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock_quantity INT
  );

CREATE TABLE
  sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
  );

-- 初期データ挿入
INSERT INTO
  products (product_id, product_name, stock_quantity)
VALUES
  (1, 'Laptop', 50),
  (2, 'Smartphone', 30),
  (3, 'Headphones', 100);
