-- パフォーマンス最適化されたトランザクション
-- 1つのトランザクション内で必要な商品の在庫をチェックし、更新対象のみを最小化して更新・挿入します。

DELIMITER //

CREATE PROCEDURE PlaceOrder()
BEGIN
    DECLARE tv_qty INT DEFAULT 5;
    DECLARE laptop_qty INT DEFAULT 3;
    DECLARE headphones_qty INT DEFAULT 2;
    DECLARE tv_stock INT;
    DECLARE laptop_stock INT;
    DECLARE headphones_stock INT;

    -- 在庫を確認
    SELECT Stock INTO tv_stock FROM Products WHERE ProductID = 1;
    SELECT Stock INTO laptop_stock FROM Products WHERE ProductID = 2;
    SELECT Stock INTO headphones_stock FROM Products WHERE ProductID = 3;

    -- トランザクション開始
    START TRANSACTION;

    -- 在庫チェックして更新またはロールバック
    IF tv_stock >= tv_qty AND laptop_stock >= laptop_qty AND headphones_stock >= headphones_qty THEN
        -- 在庫をまとめて更新
        UPDATE Products SET Stock = Stock - tv_qty WHERE ProductID = 1;
        UPDATE Products SET Stock = Stock - laptop_qty WHERE ProductID = 2;
        UPDATE Products SET Stock = Stock - headphones_qty WHERE ProductID = 3;

        -- 注文履歴に挿入
        INSERT INTO Orders (ProductID, Quantity, OrderDate) VALUES
        (1, tv_qty, CURRENT_DATE),
        (2, laptop_qty, CURRENT_DATE),
        (3, headphones_qty, CURRENT_DATE);

        -- コミット
        COMMIT;
    ELSE
        -- 在庫不足の場合はロールバック
        ROLLBACK;
    END IF;
END //

DELIMITER ;


-- ストアドプロシージャの時刻
CALL PlaceOrder();
