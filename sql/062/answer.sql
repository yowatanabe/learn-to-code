-- OrdersテーブルとCustomersテーブルを結合し、特定の期間における注文データを取得して、注文日で降順に並べ替えています。このクエリのパフォーマンスを向上させるために、OrdersテーブルのOrderDate列にインデックスを作成し、結合に使用される列（Orders.CustomerID）にインデックスを作成する。
-- OrdersテーブルのOrderDate列にインデックスを作成
CREATE INDEX idx_order_date ON Orders (OrderDate);

-- OrdersテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_customer_id ON Orders (CustomerID);
