-- 1つのトランザクションで複数商品の在庫を確認し、必要な商品のみを一括で更新します。

-- 確認
SELECT * FROM Products;
SELECT * FROM Orders;

DELIMITER //

CREATE PROCEDURE ProcessOrder()
BEGIN
    DECLARE tv_qty INT DEFAULT 2;
    DECLARE laptop_qty INT DEFAULT 5;
    DECLARE tablet_qty INT DEFAULT 3;
    DECLARE tv_stock INT;
    DECLARE laptop_stock INT;
    DECLARE tablet_stock INT;

    -- 在庫確認
    SELECT Stock INTO tv_stock FROM Products WHERE ProductID = 1;
    SELECT Stock INTO laptop_stock FROM Products WHERE ProductID = 2;
    SELECT Stock INTO tablet_stock FROM Products WHERE ProductID = 3;

    -- トランザクション開始
    START TRANSACTION;

    -- 在庫が十分か確認し、足りない場合はロールバック
    IF tv_stock >= tv_qty AND laptop_stock >= laptop_qty AND tablet_stock >= tablet_qty THEN
        -- 在庫をまとめて更新
        UPDATE Products SET Stock = CASE
            WHEN ProductID = 1 THEN Stock - tv_qty
            WHEN ProductID = 2 THEN Stock - laptop_qty
            WHEN ProductID = 3 THEN Stock - tablet_qty
        END
        WHERE ProductID IN (1, 2, 3);

        -- 注文履歴を一括で挿入
        INSERT INTO Orders (ProductID, Quantity, OrderDate) VALUES
        (1, tv_qty, CURRENT_DATE),
        (2, laptop_qty, CURRENT_DATE),
        (3, tablet_qty, CURRENT_DATE);

        -- コミット
        COMMIT;
    ELSE
        -- 在庫不足の場合はロールバック
        ROLLBACK;
    END IF;
END //

DELIMITER ;

-- ストアドプロシージャを実行
CALL ProcessOrder();


-- 確認
SELECT * FROM Products;
SELECT * FROM Orders;
