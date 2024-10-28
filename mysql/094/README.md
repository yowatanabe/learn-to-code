# No.094

あなたは、オンラインショッピングサイトのデータベースを管理しています。データベースには、製品情報、顧客情報、購入履歴が保存されています。特に顧客が頻繁に購入する製品を素早く特定できるクエリのパフォーマンスを向上させる必要があります。

### テーブル設計

**Products テーブル:**

| ProductID | ProductName     | Price |
|-----------|-----------------|-------|
| 1         | Smartphone      | 699   |
| 2         | Laptop          | 1200  |
| 3         | Headphones      | 199   |
| 4         | Camera          | 549   |

**Customers テーブル:**

| CustomerID | CustomerName    | Email                |
|------------|-----------------|----------------------|
| 1          | John Doe        | john@example.com     |
| 2          | Jane Smith      | jane@example.com     |
| 3          | Charlie Brown   | charlie@example.com  |
| 4          | Alice Johnson   | alice@example.com    |

**Purchases テーブル:**

| PurchaseID | ProductID | CustomerID | PurchaseDate | Quantity |
|------------|-----------|------------|--------------|----------|
| 101        | 1         | 1          | 2024-10-29   | 1        |
| 102        | 2         | 2          | 2024-10-30   | 2        |
| 103        | 1         | 3          | 2024-10-31   | 1        |
| 104        | 3         | 1          | 2024-11-01   | 1        |
| 105        | 4         | 4          | 2024-11-02   | 1        |
