-- インデックスを作成することでクエリ自体に変更はなくてもパフォーマンス向上が見込める
-- SalesテーブルのSaleDate列にインデックスを作成
CREATE INDEX idx_sale_date ON Sales (SaleDate);

-- SalesテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_customer_id ON Sales (CustomerID);

-- SalesテーブルのProductID列にインデックスを作成
CREATE INDEX idx_product_id ON Sales (ProductID);
