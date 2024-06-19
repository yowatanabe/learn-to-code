-- SalesテーブルのCustomerID列とProductID列にインデックスを作成し、結合に使用される列（Sales.CustomerIDおよびSales.ProductID）にインデックスを作成する。
-- SalesテーブルのCustomerID列にインデックスを作成
CREATE INDEX idx_sales_customer_id ON Sales (CustomerID);

-- SalesテーブルのProductID列にインデックスを作成
CREATE INDEX idx_sales_product_id ON Sales (ProductID);
