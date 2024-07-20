-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE AddSale(
    IN p_ProductID INT,
    IN p_Quantity INT,
    IN p_SaleDate DATE
)
BEGIN
    -- 新しい販売の追加
    INSERT INTO Sales (ProductID, Quantity, SaleDate)
    VALUES (p_ProductID, p_Quantity, p_SaleDate);
END //

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;


-- ストアドプロシージャの実行
CALL AddSale(1, 3, '2024-07-10');
