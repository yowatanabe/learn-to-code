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
    stock_quantity INT -- 在庫数量
  );

CREATE TABLE
  purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT, -- 購入数量
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
  );

-- 初期データ挿入
INSERT INTO
  products (product_id, product_name, stock_quantity)
VALUES
  (1, 'Laptop', 100),
  (2, 'Smartphone', 50),
  (3, 'Headphones', 200);
