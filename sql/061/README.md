# No.061

以下のようなテーブルがあります。

**Sales テーブル:**

| SaleID | ProductID | CustomerID | SaleDate   | Quantity | Price |
|--------|-----------|------------|------------|----------|-------|
| 1      | 101       | 1          | 2024-01-01 | 2        | 100   |
| 2      | 102       | 2          | 2024-01-05 | 1        | 200   |
| 3      | 101       | 3          | 2024-02-01 | 1        | 100   |
| 4      | 103       | 1          | 2024-02-10 | 3        | 150   |
| 5      | 102       | 4          | 2024-03-01 | 2        | 200   |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |
| 4          | David        |

**Products テーブル:**

| ProductID | ProductName   |
|-----------|---------------|
| 101       | Laptop        |
| 102       | Smartphone    |
| 103       | Tablet        |

次のクエリのパフォーマンスを分析し、最適化してください。

```sql
SELECT
    Sales.SaleID,
    Customers.CustomerName,
    Products.ProductName,
    Sales.SaleDate,
    Sales.Quantity,
    Sales.Price
FROM
    Sales
JOIN
    Customers ON Sales.CustomerID = Customers.CustomerID
JOIN
    Products ON Sales.ProductID = Products.ProductID
WHERE
    Sales.SaleDate BETWEEN '2024-01-01' AND '2024-03-31';
```
