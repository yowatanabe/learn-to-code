# No.084

あなたは、あるEコマース企業の注文管理システムを担当しています。顧客が注文した商品数、各カテゴリーごとの売上、そして特定の日付ごとの総売上を計算する必要があります。

### テーブル設計

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

**Products テーブル:**

| ProductID | ProductName   | Category   | Price  |
|-----------|---------------|------------|--------|
| 101       | Laptop        | Electronics| 1200   |
| 102       | Phone         | Electronics| 800    |
| 103       | Desk Chair    | Furniture  | 150    |
| 104       | Table         | Furniture  | 300    |

**Orders テーブル:**

| OrderID | CustomerID | OrderDate   |
|---------|------------|-------------|
| 1       | 1          | 2024-10-19  |
| 2       | 2          | 2024-10-20  |
| 3       | 3          | 2024-10-21  |

**OrderItems テーブル:**

| OrderItemID | OrderID | ProductID | Quantity |
|-------------|---------|-----------|----------|
| 1           | 1       | 101       | 2        |
| 2           | 1       | 103       | 4        |
| 3           | 2       | 102       | 1        |
| 4           | 3       | 104       | 2        |
| 5           | 3       | 103       | 1        |
