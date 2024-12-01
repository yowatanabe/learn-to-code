-- トリガーの作成
-- `Orders`テーブルに注文が追加されるたびに、`Customers`テーブルの`TotalSpent`を更新します。
DELIMITER //

CREATE TRIGGER UpdateTotalSpent
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Customers
    SET TotalSpent = TotalSpent + NEW.OrderAmount
    WHERE CustomerID = NEW.CustomerID;
END //

DELIMITER ;


-- トリガーの使用
-- 新しい注文を追加する
INSERT INTO Orders (CustomerID, OrderAmount, OrderDate)
VALUES (2, 200.00, '2024-12-02 12:00:00');


-- 顧客の合計購入額を確認する
SELECT * FROM Customers;
