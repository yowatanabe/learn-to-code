# No.086

あなたは、あるEコマースのデータベース管理者です。商品と注文情報を保存しているテーブルがあり、大量のデータが蓄積されています。システムのレスポンスが遅くなってきたため、クエリの最適化を行います。

### テーブル設計

**Products テーブル:**

| ProductID | ProductName   | Category   | Price  |
|-----------|---------------|------------|--------|
| 1         | Laptop        | Electronics| 1000   |
| 2         | Smartphone    | Electronics| 800    |
| 3         | Desk Chair    | Furniture  | 150    |
| 4         | Table         | Furniture  | 300    |

**Orders テーブル:**

| OrderID | ProductID | OrderDate   | Quantity |
|---------|-----------|-------------|----------|
| 101     | 1         | 2024-10-01  | 2        |
| 102     | 2         | 2024-10-02  | 1        |
| 103     | 3         | 2024-10-03  | 4        |
| 104     | 1         | 2024-10-03  | 1        |
