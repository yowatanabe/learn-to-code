-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrderDetailsテーブルのOrderID列にインデックスを作成
CREATE INDEX idx_orderdetails_orderid ON OrderDetails (OrderID);

-- OrderDetailsテーブルのProductID列にインデックスを作成
CREATE INDEX idx_orderdetails_productid ON OrderDetails (ProductID);

-- ProductsテーブルのProductID列にインデックスを作成
CREATE INDEX idx_productid ON Products (ProductID);
