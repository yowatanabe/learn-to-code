-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE update_product_stock(
    IN product_id_param INT,
    IN order_quantity_param INT
)
BEGIN
    -- 1. 変数を宣言
    DECLARE current_stock INT;
    DECLARE insufficient_stock CONDITION FOR SQLSTATE '45000'; -- カスタムエラーの宣言

    -- 2. 在庫数を取得 (FOR UPDATE でロックをかける)
    SELECT stock_quantity INTO current_stock
    FROM products
    WHERE product_id = product_id_param
    FOR UPDATE;

    -- 3. 在庫が不足している場合はエラーをスロー
    IF current_stock < order_quantity_param THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for the requested product.';
    ELSE
        -- 4. 在庫を減少させる
        UPDATE products
        SET stock_quantity = stock_quantity - order_quantity_param
        WHERE product_id = product_id_param;
    END IF;
END;
//

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- ストアドプロシージャを呼び出して在庫を更新
    CALL update_product_stock(NEW.product_id, NEW.order_quantity);
END;
//

DELIMITER ;


-- 動作確認データ

-- ケース1: 正常な注文の動作確認
INSERT INTO orders (product_id, order_quantity)
VALUES (1, 2);

-- 商品の在庫情報を確認
SELECT * FROM products;


-- ケース2: 在庫不足の動作確認
-- 想定エラーメッセージ: ERROR 45000 (45000): Insufficient stock for the requested product.
INSERT INTO orders (product_id, order_quantity)
VALUES (2, 100);

-- 商品の在庫を確認 (変更がないことを確認)
SELECT * FROM products;


-- ケース3: 並行トランザクションのテスト

-- セッション1
INSERT INTO orders (product_id, order_quantity)
VALUES (1, 5);

-- セッション2
INSERT INTO orders (product_id, order_quantity)
VALUES (3, 10);

-- 商品の在庫を確認
SELECT * FROM products;
