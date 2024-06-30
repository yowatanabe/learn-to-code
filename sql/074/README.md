# No.074

以下のようなテーブルがあります。

**Orders テーブル:**

| OrderID | CustomerID | OrderDate   | TotalAmount |
|---------|------------|-------------|-------------|
| 1       | 1          | 2024-01-01  | 150.00      |
| 2       | 2          | 2024-01-05  | 200.00      |
| 3       | 3          | 2024-02-01  | 300.00      |
| 4       | 1          | 2024-02-10  | 100.00      |
| 5       | 2          | 2024-03-01  | 250.00      |

**OrderItems テーブル:**

| OrderItemID | OrderID | ProductID | Quantity | UnitPrice |
|-------------|---------|-----------|----------|-----------|
| 1           | 1       | 101       | 1        | 100.00    |
| 2           | 1       | 102       | 2        | 25.00     |
| 3           | 2       | 101       | 2        | 100.00    |
| 4           | 3       | 103       | 3        | 50.00     |
| 5           | 4       | 101       | 1        | 100.00    |
| 6           | 5       | 104       | 1        | 250.00    |

**Products テーブル:**

| ProductID | ProductName |
|-----------|-------------|
| 101       | Laptop      |
| 102       | Mouse       |
| 103       | Keyboard    |
| 104       | Monitor     |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    p.ProductName,
    SUM(oi.Quantity) AS TotalQuantity,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM
    Orders o
JOIN
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN
    Products p ON oi.ProductID = p.ProductID
WHERE
    o.OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY
    p.ProductName
ORDER BY
    TotalRevenue DESC;
```
