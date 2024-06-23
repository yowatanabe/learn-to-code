# No.067

以下のようなテーブルがあります。

**Sales テーブル:**

| SaleID | CustomerID | ProductID | SaleDate   | Quantity | TotalAmount |
|--------|------------|-----------|------------|----------|-------------|
| 1      | 1          | 101       | 2024-01-01 | 2        | 200.00      |
| 2      | 2          | 102       | 2024-01-05 | 1        | 300.00      |
| 3      | 1          | 103       | 2024-02-01 | 1        | 150.00      |
| 4      | 3          | 101       | 2024-02-10 | 3        | 300.00      |
| 5      | 2          | 103       | 2024-03-01 | 2        | 300.00      |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

**Products テーブル:**

| ProductID | ProductName |
|-----------|-------------|
| 101       | Laptop      |
| 102       | Smartphone  |
| 103       | Tablet      |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを実行してください。

```sql
SELECT
    Customers.CustomerName,
    Products.ProductName,
    Sales.SaleDate,
    Sales.Quantity,
    Sales.TotalAmount
FROM
    Sales
JOIN
    Customers ON Sales.CustomerID = Customers.CustomerID
JOIN
    Products ON Sales.ProductID = Products.ProductID
WHERE
    Sales.SaleDate BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY
    Sales.SaleDate DESC;
```
