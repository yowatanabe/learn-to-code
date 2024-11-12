-- 1つのトランザクションで複数の商品在庫を更新し、注文履歴を一括で登録します。条件付きで在庫が足りない場合はロールバックすることで、無駄な更新を避けます。

-- 確認
SELECT
    *
FROM
    Products;

SELECT
    *
FROM
    Orders;


-- ストアドプロシージャを作成
DELIMITER //

CREATE PROCEDURE PlaceOrder()
BEGIN
    DECLARE tv_qty INT DEFAULT 3;
    DECLARE laptop_qty INT DEFAULT 2;
    DECLARE smartphone_qty INT DEFAULT 1;
    DECLARE tv_stock INT;
    DECLARE laptop_stock INT;
    DECLARE smartphone_stock INT;

    -- 在庫を確認
    SELECT Stock INTO tv_stock FROM Products WHERE ProductID = 1;
    SELECT Stock INTO laptop_stock FROM Products WHERE ProductID = 2;
    SELECT Stock INTO smartphone_stock FROM Products WHERE ProductID = 3;

    -- トランザクション開始
    START TRANSACTION;

    -- 在庫チェックして更新またはロールバック
    IF tv_stock >= tv_qty AND laptop_stock >= laptop_qty AND smartphone_stock >= smartphone_qty THEN
        -- 在庫をまとめて更新
        UPDATE Products SET Stock = CASE
            WHEN ProductID = 1 THEN Stock - tv_qty
            WHEN ProductID = 2 THEN Stock - laptop_qty
            WHEN ProductID = 3 THEN Stock - smartphone_qty
            ELSE Stock END
        WHERE ProductID IN (1, 2, 3);

        -- 注文履歴に一括挿入
        INSERT INTO Orders (ProductID, Quantity, OrderDate) VALUES
        (1, tv_qty, CURRENT_DATE),
        (2, laptop_qty, CURRENT_DATE),
        (3, smartphone_qty, CURRENT_DATE);

        -- コミット
        COMMIT;
    ELSE
        -- 在庫不足の場合はロールバック
        ROLLBACK;
    END IF;
END //

DELIMITER ;


-- ストアドプロシージャを実行
CALL PlaceOrder();


-- 確認
SELECT
    *
FROM
    Products;

SELECT
    *
FROM
    Orders;
