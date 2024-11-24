-- データ確認
SELECT * FROM Products;

-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE UpdateStockUsingTempTable()
BEGIN
    -- 一時テーブルの作成
    CREATE TEMPORARY TABLE TempStockUpdates (
        ProductID INT,
        StockChange INT
    );

    -- 一時テーブルにデータを挿入
    INSERT INTO TempStockUpdates (ProductID, StockChange) VALUES
        (1, -10),  -- 商品ID 1 の在庫を -10 変更
        (2, 20);   -- 商品ID 2 の在庫を +20 変更

    -- トランザクションの開始
    START TRANSACTION;

    -- 在庫を更新
    UPDATE Products p
    JOIN TempStockUpdates t ON p.ProductID = t.ProductID
    SET p.Stock = p.Stock + t.StockChange;

    -- エラー処理（在庫が負の場合）
    IF EXISTS (SELECT 1 FROM Products WHERE Stock < 0) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    ELSE
        COMMIT;
    END IF;

    -- 一時テーブルの削除
    DROP TEMPORARY TABLE TempStockUpdates;
END //

DELIMITER ;


-- ストアドプロシージャの使用
CALL UpdateStockUsingTempTable();


-- データ確認
SELECT * FROM Products;
