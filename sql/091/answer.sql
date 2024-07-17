-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE RegisterSale (
  IN p_ProductID INT,
  IN p_Quantity INT,
  IN p_SaleDate DATE
) BEGIN DECLARE current_stock INT;

-- 在庫の確認
SELECT
  Stock INTO current_stock
FROM
  Products
WHERE
  ProductID = p_ProductID;

-- 在庫が足りるかどうかの確認
IF current_stock >= p_Quantity THEN
-- 販売の登録
INSERT INTO
  Sales (ProductID, Quantity, SaleDate)
VALUES
  (p_ProductID, p_Quantity, p_SaleDate);

-- 在庫の更新
UPDATE Products
SET
  Stock = Stock - p_Quantity
WHERE
  ProductID = p_ProductID;

ELSE
-- 在庫が足りない場合のエラー
SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'Not enough stock';

END IF;

END //

DELIMITER ;

-- トリガーの作成
DELIMITER //

CREATE TRIGGER UpdateStockAfterSale AFTER INSERT ON Sales FOR EACH ROW BEGIN
UPDATE Products
SET
  Stock = Stock - NEW.Quantity
WHERE
  ProductID = NEW.ProductID;

END //

DELIMITER ;

-- ストアドプロシージャの実行
CALL RegisterSale(1, 3, '2024-07-10');
