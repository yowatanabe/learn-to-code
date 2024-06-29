# No.073

以下のようなテーブルがあります。

**Sales テーブル:**

| SaleID | ProductID | CustomerID | SaleDate   | Quantity | TotalAmount |
|--------|-----------|------------|------------|----------|-------------|
| 1      | 101       | 1          | 2024-01-01 | 2        | 200.00      |
| 2      | 102       | 2          | 2024-01-05 | 1        | 300.00      |
| 3      | 103       | 1          | 2024-02-01 | 1        | 150.00      |
| 4      | 101       | 3          | 2024-02-15 | 3        | 600.00      |
| 5      | 102       | 2          | 2024-03-01 | 2        | 600.00      |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

**Products テーブル:**

| ProductID | ProductName   | Price |
|-----------|---------------|-------|
| 101       | Laptop        | 1000  |
| 102       | Smartphone    | 300   |
| 103       | Tablet        | 150   |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    c.CustomerName,
    p.ProductName,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.TotalAmount) AS TotalSpent
FROM
    Sales s
JOIN
    Customers c ON s.CustomerID = c.CustomerID
JOIN
    Products p ON s.ProductID = p.ProductID
WHERE
    s.SaleDate BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY
    c.CustomerName,
    p.ProductName
ORDER BY
    TotalSpent DESC;
```
