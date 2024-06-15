# No.059

以下のようなテーブルがあります。

**Orders テーブル:**

| OrderID | CustomerID | ProductID | OrderDate  | Quantity |
|---------|------------|-----------|------------|----------|
| 1       | 1          | 100       | 2024-05-01 | 2        |
| 2       | 2          | 101       | 2024-05-05 | 1        |
| 3       | 1          | 102       | 2024-05-10 | 5        |
| 4       | 3          | 100       | 2024-05-12 | 1        |
| 5       | 2          | 103       | 2024-05-15 | 3        |

**Customers テーブル:**

| CustomerID | CustomerName | ContactEmail         |
|------------|--------------|----------------------|
| 1          | Alice        | alice@example.com    |
| 2          | Bob          | bob@example.com      |
| 3          | Charlie      | charlie@example.com  |

**Products テーブル:**

| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 100       | Laptop      | 1200  |
| 101       | Mouse       | 25    |
| 102       | Keyboard    | 75    |
| 103       | Monitor     | 300   |

このテーブル構造において、主キー、外部キーの重要性を説明し、インデックスを作成するクエリを示してください。
