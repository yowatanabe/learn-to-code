-- OrdersテーブルのOrderDate列とCustomerID列にインデックスを作成する。
-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrdersテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_customer_id ON Orders (CustomerID);
