SELECT
    *
FROM
    Products;

SELECT
    *
FROM
    PriceHistory;

-- 一度にすべての商品の価格を更新し、価格履歴テーブルにデータを一括挿入するトランザクションを実行します。

BEGIN;

-- 各商品の古い価格を取得し、更新する新しい価格を設定
UPDATE Products
SET
    Price = CASE
        WHEN ProductID = 1 THEN 280 -- TV
        WHEN ProductID = 2 THEN 950 -- Laptop
        WHEN ProductID = 3 THEN 140 -- Headphones
        ELSE Price
    END;

-- PriceHistory テーブルに価格変更履歴をまとめて挿入
INSERT INTO
    PriceHistory (ProductID, OldPrice, NewPrice, ChangeDate)
SELECT
    ProductID,
    CASE
        WHEN ProductID = 1 THEN 300
        WHEN ProductID = 2 THEN 1000
        WHEN ProductID = 3 THEN 150
    END AS OldPrice,
    Price AS NewPrice,
    CURRENT_DATE AS ChangeDate
FROM
    Products
WHERE
    ProductID IN (1, 2, 3);

COMMIT;

SELECT
    *
FROM
    Products;

SELECT
    *
FROM
    PriceHistory;
