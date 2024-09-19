-- インデックス最適化の手順
-- `CustomerID` と `OrderDate` に基づくクエリが頻繁に実行されるため、それぞれの列にインデックスを設定。さらに、複合インデックスを作成することで、特定の顧客の特定の期間内の注文を効率的に検索します。
-- `CustomerID` 列と `OrderDate` 列にシングルインデックスを作成
CREATE INDEX idx_customer_id ON Orders (CustomerID);

CREATE INDEX idx_order_date ON Orders (OrderDate);

-- `CustomerID` と `OrderDate` の複合インデックスを作成。これら2つの条件を使った検索がより高速に行えます。
CREATE INDEX idx_customer_orderdate ON Orders (CustomerID, OrderDate);

-- インデックスを使用したクエリ
SELECT
  OrderID,
  TotalAmount,
  Status
FROM
  Orders
WHERE
  CustomerID = 101
  AND OrderDate BETWEEN '2024-09-01' AND '2024-09-04';

-- インデックスの確認
SHOW INDEX
FROM
  Orders;
