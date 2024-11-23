-- このストアドプロシージャは、指定された条件に一致する顧客のメールアドレスを更新し、ステータスを変更します。
DELIMITER //

CREATE PROCEDURE UpdateCustomerInfo(
    IN p_CurrentStatus VARCHAR(20),
    IN p_NewStatus VARCHAR(20),
    IN p_EmailDomain VARCHAR(50)
)
BEGIN
    -- 条件に基づいて顧客情報を更新
    UPDATE Customers
    SET Status = p_NewStatus,
        Email = CONCAT(CustomerName, '@', p_EmailDomain)
    WHERE Status = p_CurrentStatus;
END //

DELIMITER ;


-- ストアドプロシージャを使用した顧客情報の更新
-- 1. ステータスが `Active` の顧客を `Pending` に変更し、メールドメインを `updated.com` に更新
CALL UpdateCustomerInfo('Active', 'Pending', 'updated.com');

-- データ確認
-- 1. Customers テーブルを確認
SELECT * FROM Customers;
