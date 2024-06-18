# No.062

以下のようなテーブルがあります。

**Orders テーブル:**

| OrderID | CustomerID | OrderDate   | TotalAmount |
|---------|------------|-------------|-------------|
| 1       | 1          | 2024-01-01  | 150         |
| 2       | 2          | 2024-01-05  | 200         |
| 3       | 3          | 2024-02-01  | 300         |
| 4       | 1          | 2024-02-10  | 100         |
| 5       | 2          | 2024-03-01  | 250         |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

次のクエリのパフォーマンスを分析し、最適化してください。

```sql
SELECT
    Customers.CustomerName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Orders.OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY
    Orders.OrderDate DESC;
```
