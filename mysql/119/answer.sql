-- このストアドプロシージャは、新しい注文を登録し、在庫を減らします。在庫が不足している場合はエラーを返します。
DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN p_CustomerID INT,
    IN p_ProductID INT,
    IN p_Quantity INT
)
BEGIN
    DECLARE current_stock INT;

    -- 現在の在庫を取得
    SELECT Stock INTO current_stock FROM Products WHERE ProductID = p_ProductID;

    -- 在庫不足のチェック
    IF current_stock < p_Quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    ELSE
        -- 在庫を減らす
        UPDATE Products
        SET Stock = Stock - p_Quantity
        WHERE ProductID = p_ProductID;

        -- 新しい注文を追加
        INSERT INTO Orders (CustomerID, ProductID, Quantity, OrderDate)
        VALUES (p_CustomerID, p_ProductID, p_Quantity, NOW());
    END IF;
END //

DELIMITER ;


-- ストアドプロシージャを使用した注文の登録

-- 1. 顧客ID 1 が商品ID 1（Book）を 10 個注文
CALL PlaceOrder(1, 1, 10);

-- 2. 顧客ID 2 が商品ID 3（Notebook）を 25 個注文（エラー発生）
CALL PlaceOrder(2, 3, 25);
-- エラーメッセージ: 'Insufficient stock for this product'


-- データ確認

-- 1. 在庫確認
SELECT * FROM Products;

-- 2. 注文確認
SELECT * FROM Orders;
