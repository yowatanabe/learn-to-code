# No.069

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

**Products テーブル:**

| ProductID | ProductName   | Price |
|-----------|---------------|-------|
| 101       | Laptop        | 1200  |
| 102       | Mouse         | 25    |
| 103       | Keyboard      | 75    |

**OrderDetails テーブル:**

| OrderDetailID | OrderID | ProductID | Quantity |
|---------------|---------|-----------|----------|
| 1             | 1       | 101       | 1        |
| 2             | 1       | 102       | 2        |
| 3             | 2       | 103       | 1        |
| 4             | 3       | 101       | 2        |
| 5             | 4       | 102       | 1        |
| 6             | 5       | 103       | 3        |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを実行してください。

```sql
SELECT
    c.CustomerName,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity,
    SUM(od.Quantity * p.Price) AS TotalSpent
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
JOIN
    Products p ON od.ProductID = p.ProductID
WHERE
    o.OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY
    c.CustomerName,
    p.ProductName
ORDER BY
    TotalSpent DESC;
```
