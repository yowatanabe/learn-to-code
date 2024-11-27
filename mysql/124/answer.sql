-- ストアドプロシージャの作成
-- このストアドプロシージャでは、指定した商品のIDに基づいて月ごとの販売数と総収益を計算します。
DELIMITER //

CREATE PROCEDURE GetMonthlySales(
    IN product_id INT
)
BEGIN
    SELECT
        DATE_FORMAT(OrderDate, '%Y-%m') AS SaleMonth,
        SUM(Quantity) AS TotalQuantity,
        SUM(Quantity * Price) AS TotalRevenue
    FROM
        Orders o
    JOIN
        Products p ON o.ProductID = p.ProductID
    WHERE
        o.ProductID = product_id
    GROUP BY
        SaleMonth
    ORDER BY
        SaleMonth;
END //

DELIMITER ;


-- ストアドプロシージャの使用
CALL GetMonthlySales(1);

