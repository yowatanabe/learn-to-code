# No.056

以下のようなテーブルがあります。

**Orders テーブル:**

| OrderID | CustomerID | ProductID | Quantity | OrderDate  |
|---------|------------|-----------|----------|------------|
| 1       | 101        | 1001      | 2        | 2024-05-01 |
| 2       | 102        | 1002      | 1        | 2024-05-02 |
| 3       | 101        | 1003      | 1        | 2024-05-03 |
| 4       | 103        | 1001      | 4        | 2024-05-04 |
| 5       | 104        | 1002      | 3        | 2024-05-05 |

**Customers テーブル:**

| CustomerID | CustomerName | ContactEmail         |
|------------|--------------|----------------------|
| 101        | Alice        | alice@example.com    |
| 102        | Bob          | bob@example.com      |
| 103        | Charlie      | charlie@example.com  |
| 104        | David        | david@example.com    |

**Products テーブル:**

| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 1001      | Laptop      | 1200  |
| 1002      | Mouse       | 25    |
| 1003      | Keyboard    | 75    |

次の条件を満たすSQLクエリを作成してください：

1. 主キーを設定する。
2. 外部キーを設定する。
3. `OrderDate`列にインデックスを作成する。
