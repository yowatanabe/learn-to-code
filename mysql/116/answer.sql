-- 以下のストアドプロシージャは、複数の商品在庫を更新します。引数として、対象の商品IDと在庫変更量を受け取ります。
DELIMITER //

CREATE PROCEDURE UpdateStock(
    IN p_ProductID INT,
    IN p_StockChange INT
)
BEGIN
    DECLARE current_stock INT;

    -- 現在の在庫を取得
    SELECT Stock INTO current_stock FROM Products WHERE ProductID = p_ProductID;

    -- 在庫不足の場合のチェック
    IF current_stock + p_StockChange < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock';
    ELSE
        -- 在庫を更新
        UPDATE Products
        SET Stock = Stock + p_StockChange
        WHERE ProductID = p_ProductID;
    END IF;
END //

DELIMITER ;


-- ストアドプロシージャを使用した在庫更新
-- 商品ID 1（Book）の在庫を-10減らす
CALL UpdateStock(1, -10);

-- 商品ID 2（Pen）の在庫を+20追加
CALL UpdateStock(2, 20);

-- 商品ID 3（Notebook）の在庫を-50減らす（エラーが発生）
CALL UpdateStock(3, -50);
-- エラーメッセージ: 'Insufficient stock'

-- データ確認
SELECT * FROM Products;
