# No.079

以下のようなテーブルがあります。

**Orders テーブル:**

| OrderID | CustomerID | OrderDate   | TotalAmount |
|---------|------------|-------------|-------------|
| 1       | 1          | 2024-01-01  | 150.00      |
| 2       | 2          | 2024-01-05  | 200.00      |
| 3       | 3          | 2024-02-01  | 300.00      |
| 4       | 1          | 2024-02-10  | 100.00      |
| 5       | 2          | 2024-03-01  | 250.00      |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    o.OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY
    c.CustomerName
ORDER BY
    TotalSpent DESC;
```
