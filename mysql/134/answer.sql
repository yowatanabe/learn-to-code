-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_purchase_insert
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
    UPDATE customers
    SET points = points + ROUND(NEW.purchase_amount * 0.10)
    WHERE customer_id = NEW.customer_id;
END;
//

DELIMITER ;


-- 動作確認データ
INSERT INTO purchases (customer_id, purchase_amount, purchase_date)
VALUES
(1, 100.50, '2024-12-05'),
(2, 50.00, '2024-12-05'),
(3, 200.25, '2024-12-05');


-- 顧客情報テーブルの確認
SELECT * FROM customers;
