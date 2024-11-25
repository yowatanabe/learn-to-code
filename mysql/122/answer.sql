-- ストアドプロシージャの作成
-- 顧客IDリストを引数として受け取り、各顧客の注文回数と総額を計算する。
DELIMITER //

CREATE PROCEDURE GetCustomerOrderSummary(
    IN customer_ids TEXT -- カンマ区切りの顧客IDリスト
)
BEGIN
    -- 一時テーブルの作成
    CREATE TEMPORARY TABLE TempCustomerOrders (
        CustomerID INT,
        TotalOrders INT,
        TotalAmount DECIMAL(10, 2)
    );

    -- 動的SQLを作成
    SET @sql = CONCAT(
        'INSERT INTO TempCustomerOrders (CustomerID, TotalOrders, TotalAmount)
         SELECT CustomerID, COUNT(OrderID) AS TotalOrders, SUM(OrderAmount) AS TotalAmount
         FROM Orders
         WHERE FIND_IN_SET(CustomerID, "', customer_ids, '")
         GROUP BY CustomerID'
    );

    -- 動的SQLを実行
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- 一時テーブルのデータを出力
    SELECT * FROM TempCustomerOrders;

    -- 一時テーブルを削除
    DROP TEMPORARY TABLE TempCustomerOrders;
END //

DELIMITER ;


-- ストアドプロシージャの使用
-- 特定の顧客（ID: 1, 2）の注文履歴を集計
CALL GetCustomerOrderSummary('1,2');
