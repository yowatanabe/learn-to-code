-- このストアドプロシージャは、新規顧客を登録し、対応するウェルカムメッセージを生成します。
DELIMITER //

CREATE PROCEDURE RegisterCustomer(
    IN p_CustomerName VARCHAR(100),
    IN p_Email VARCHAR(255)
)
BEGIN
    DECLARE new_customer_id INT;

    -- 新規顧客を登録
    INSERT INTO Customers (CustomerName, Email, RegistrationDate)
    VALUES (p_CustomerName, p_Email, NOW());

    -- 登録された顧客のIDを取得
    SET new_customer_id = LAST_INSERT_ID();

    -- ウェルカムメッセージを生成
    INSERT INTO Messages (CustomerID, Message, CreatedAt)
    VALUES (new_customer_id, CONCAT('Welcome ', p_CustomerName, '!'), NOW());
END //

DELIMITER ;


-- ストアドプロシージャを使用した新規顧客登録

-- 1. 顧客 "Bob Johnson" を登録
CALL RegisterCustomer('Bob Johnson', 'bob@example.com');

-- 2. 顧客 "Charlie Brown" を登録
CALL RegisterCustomer('Charlie Brown', 'charlie@example.com');


-- データ確認

-- 1. Customers テーブルを確認
SELECT * FROM Customers;

-- 2. Messages テーブルを確認
SELECT * FROM Messages;
