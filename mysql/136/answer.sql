-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE update_stock(IN product_id_param INT, IN quantity_param INT)
BEGIN
    -- 変数宣言
    DECLARE current_stock INT;
    DECLARE insufficient_stock CONDITION FOR SQLSTATE '45000'; -- カスタムエラーの宣言

    -- 現在の在庫を確認
    SELECT stock_quantity INTO current_stock
    FROM products
    WHERE product_id = product_id_param
    FOR UPDATE;

    -- 在庫が足りない場合はエラーを発生
    IF current_stock < quantity_param THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for the requested product.';
    ELSE
        -- 在庫を減少させる
        UPDATE products
        SET stock_quantity = stock_quantity - quantity_param
        WHERE product_id = product_id_param;
    END IF;
END;
//

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_purchase_insert
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
    -- ストアドプロシージャの呼び出し
    CALL update_stock(NEW.product_id, NEW.quantity);
END;
//

DELIMITER ;


-- 動作確認データ

-- 正常な動作の確認
INSERT INTO purchases (product_id, quantity) VALUES (1, 10);
-- 商品の在庫を確認 (在庫が100から90に減少)
SELECT * FROM products;


-- 異常な動作の確認
-- 想定エラーメッセージ: ERROR 45000 (45000): Insufficient stock for the requested product.
INSERT INTO purchases (product_id, quantity) VALUES (2, 200);
-- 商品の在庫を確認 (変更がないことを確認)
SELECT * FROM products;

