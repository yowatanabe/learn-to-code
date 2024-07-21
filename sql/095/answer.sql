-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE AddBookSale(
    IN p_BookID INT,
    IN p_Quantity INT,
    IN p_SaleDate DATE
)
BEGIN
    -- 新しい販売の追加
    INSERT INTO Sales (BookID, Quantity, SaleDate)
    VALUES (p_BookID, p_Quantity, p_SaleDate);
END //

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER UpdateBookStockAfterSale
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Books
    SET Stock = Stock - NEW.Quantity
    WHERE BookID = NEW.BookID;
END //

DELIMITER ;


-- ストアドプロシージャの実行
CALL AddBookSale(1, 3, '2024-07-10');
