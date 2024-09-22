# No.058

あなたは、オンラインショップの売上データベースを管理しています。各商品の売上を管理し、特定のクエリでサブクエリを使用して、特定の条件に合う商品を検索します。

### テーブル設計

**Products テーブル:**

| ProductID | ProductName | Category   | Price  |
|-----------|-------------|------------|--------|
| 1         | Laptop      | Electronics| 1000.00|
| 2         | Phone       | Electronics| 500.00 |
| 3         | Chair       | Furniture  | 150.00 |
| 4         | Desk        | Furniture  | 300.00 |
| 5         | Headphones  | Electronics| 100.00 |

**Sales テーブル:**

| SaleID | ProductID | Quantity | SaleDate   |
|--------|-----------|----------|------------|
| 1      | 1         | 5        | 2024-09-01 |
| 2      | 2         | 10       | 2024-09-02 |
| 3      | 3         | 15       | 2024-09-03 |
| 4      | 4         | 8        | 2024-09-04 |
| 5      | 5         | 20       | 2024-09-05 |
