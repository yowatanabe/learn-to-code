-- ストアドプロシージャの作成
-- 以下のストアドプロシージャでは、指定した期間内の注文データを商品ごとに集計します。
DELIMITER //

CREATE PROCEDURE GetSalesSummary(
    IN start_date DATETIME,
    IN end_date DATETIME
)
BEGIN
    SELECT
        p.ProductName,
        SUM(o.Quantity) AS TotalQuantity,
        SUM(o.Quantity * p.Price) AS TotalRevenue
    FROM
        Orders o
    JOIN
        Products p ON o.ProductID = p.ProductID
    WHERE
        o.OrderDate BETWEEN start_date AND end_date
    GROUP BY
        p.ProductName
    ORDER BY
        TotalRevenue DESC;
END //

DELIMITER ;


-- ストアドプロシージャの使用
-- 特定期間内の販売データを取得
CALL GetSalesSummary('2024-10-01 00:00:00', '2024-11-30 23:59:59');

