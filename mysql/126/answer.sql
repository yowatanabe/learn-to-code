-- トリガーの作成
-- このトリガーは、新しい注文が`Orders`テーブルに挿入されるたびに、対応する`Inventory`テーブルの在庫数を減らします。
DELIMITER //

CREATE TRIGGER UpdateInventoryAfterOrder
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;


-- トリガーの使用

-- 新しい注文を追加
INSERT INTO Orders (ProductID, Quantity, OrderDate)
VALUES (2, 1, '2024-11-02 14:00:00');

-- 注文を確認
SELECT * FROM Orders;

-- 在庫状況を確認
SELECT * FROM Inventory;
