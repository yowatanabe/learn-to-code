-- ストアドプロシージャの作成
DELIMITER / / CREATE PROCEDURE update_product_stock (IN product_id_param INT, IN quantity_param INT) BEGIN
-- 在庫の確認のための変数
DECLARE current_stock INT;

DECLARE insufficient_stock CONDITION FOR SQLSTATE '45000';

-- カスタムエラー定義
-- 1. 在庫数を取得 (FOR UPDATEでロック)
SELECT
    stock_quantity INTO current_stock
FROM
    products
WHERE
    product_id = product_id_param FOR
UPDATE;

-- 2. 在庫が不足している場合はエラーをスロー
IF current_stock < quantity_param THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Insufficient stock for the requested product.';

ELSE
-- 3. 在庫の減少
UPDATE products
SET
    stock_quantity = stock_quantity - quantity_param
WHERE
    product_id = product_id_param;

END IF;

END;

/ / DELIMITER;

-- トリガーの作成
DELIMITER / / CREATE TRIGGER after_order_insert AFTER INSERT ON orders FOR EACH ROW BEGIN
-- ストアドプロシージャを呼び出して在庫を更新
CALL update_product_stock (NEW.product_id, NEW.quantity);

END;

/ / DELIMITER;

-- 動作確認データ
-- ケース1: 正常な注文の動作確認
-- 正常な注文を挿入
INSERT INTO
    orders (product_id, quantity)
VALUES
    (1, 2);

-- 商品の在庫確認
SELECT
    *
FROM
    products;

-- ケース2: 在庫不足の動作確認
-- 在庫不足の注文を試行
-- ERROR 45000 (45000): Insufficient stock for the requested product.
INSERT INTO
    orders (product_id, quantity)
VALUES
    (2, 50);

-- 商品の在庫確認
SELECT
    *
FROM
    products;
