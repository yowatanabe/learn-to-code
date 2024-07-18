-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE AddOrder(
    IN p_CustomerID INT,
    IN p_OrderDate DATE,
    IN p_TotalAmount DECIMAL(10, 2)
)
BEGIN
    -- 新しい注文の追加
    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
    VALUES (p_CustomerID, p_OrderDate, p_TotalAmount);
END //

DELIMITER ;

-- トリガーの作成
DELIMITER //

CREATE TRIGGER UpdateBalanceAfterOrder
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Customers
    SET Balance = Balance - NEW.TotalAmount
    WHERE CustomerID = NEW.CustomerID;
END //

DELIMITER ;

-- ストアドプロシージャの実行
CALL AddOrder(1, '2024-06-01', 200);
