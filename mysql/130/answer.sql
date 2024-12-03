-- トリガーの作成
-- このトリガーは、`Inventory`テーブルの在庫数が変更されるたびに、その変更履歴を`InventoryLog`テーブルに記録します。
DELIMITER //

CREATE TRIGGER LogInventoryChanges
AFTER UPDATE ON Inventory
FOR EACH ROW
BEGIN
    INSERT INTO InventoryLog (ProductID, OldStock, NewStock, ChangeDate)
    VALUES (OLD.ProductID, OLD.Stock, NEW.Stock, NOW());
END //

DELIMITER ;


-- トリガーの使用例
-- 在庫を更新する
UPDATE Inventory
SET Stock = 45
WHERE ProductID = 1;


-- 在庫変更ログを確認する
SELECT * FROM InventoryLog;
