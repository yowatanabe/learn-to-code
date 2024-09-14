-- `category`カラムに対するHashインデックスの作成
-- HashインデックスはMEMORYストレージエンジンでサポートされている。テーブルのストレージエンジンをMEMORYに設定しHashインデックスを作成。
DROP TABLE IF EXISTS products;

CREATE TABLE
  products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT
  ) ENGINE = MEMORY;

INSERT INTO
  products (product_name, category, price, stock)
VALUES
  ('Laptop', 'Electronics', 999.99, 50),
  ('Smartphone', 'Electronics', 499.99, 150),
  ('Headphones', 'Electronics', 199.99, 200),
  ('Coffee Maker', 'Home Appliances', 89.99, 80),
  ('Blender', 'Home Appliances', 59.99, 120),
  ('Air Fryer', 'Home Appliances', 129.99, 60),
  ('Novel', 'Books', 19.99, 300),
  ('Notebook', 'Books', 9.99, 500),
  ('Textbook', 'Books', 49.99, 100);

-- Hashインデックスの作成
CREATE INDEX idx_category USING HASH ON products (category);

-- `price`カラムに対するB-Treeインデックスの作成
CREATE INDEX idx_price ON products (price);

-- Hashインデックスが有効なクエリ（等価検索）
SELECT
  *
FROM
  products
WHERE
  category = 'Electronics';

-- B-Treeインデックスが有効なクエリ（範囲検索）
SELECT
  *
FROM
  products
WHERE
  price BETWEEN 100 AND 500;
