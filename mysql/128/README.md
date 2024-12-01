# No.128

注文管理システムでは、`Orders`テーブルに新しい注文が追加されるたびに、関連する`Customers`テーブルの「合計購入額（TotalSpent）」を自動的に更新する必要があります。この機能を実現するトリガーを作成してください。

### テーブル設計

#### Customers テーブル

| CustomerID | CustomerName | TotalSpent |
|------------|--------------|------------|
| 1          | Alice        | 0.00       |
| 2          | Bob          | 0.00       |
| 3          | Charlie      | 0.00       |

#### Orders テーブル

| OrderID | CustomerID | OrderAmount | OrderDate          |
|---------|------------|-------------|--------------------|
| 1       | 1          | 100.00      | 2024-12-02 10:00:00 |
