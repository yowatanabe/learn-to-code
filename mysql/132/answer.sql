-- トリガーの作成：
-- 販売データが挿入されるたびに、対応する商品の在庫を自動更新するトリガーを作成します。
DELIMITER //

CREATE TRIGGER after_sale_insert
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END;
//

DELIMITER ;


-- 動作確認データを挿入
INSERT INTO sales (product_id, quantity_sold, sale_date) VALUES (1, 5, '2024-12-05');
INSERT INTO sales (product_id, quantity_sold, sale_date) VALUES (2, 10, '2024-12-05');
INSERT INTO sales (product_id, quantity_sold, sale_date) VALUES (3, 20, '2024-12-05');


-- 商品テーブルを確認
SELECT * FROM products;
