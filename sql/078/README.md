# No.078

以下のようなテーブルがあります。

**Products テーブル:**

| ProductID | ProductName | CategoryID | Price |
|-----------|-------------|------------|-------|
| 1         | Laptop      | 1          | 1000  |
| 2         | Mouse       | 2          | 20    |
| 3         | Keyboard    | 2          | 50    |
| 4         | Monitor     | 1          | 300   |
| 5         | Desk        | 3          | 150   |

**Categories テーブル:**

| CategoryID | CategoryName |
|------------|--------------|
| 1          | Electronics  |
| 2          | Accessories  |
| 3          | Furniture    |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    c.CategoryName,
    p.ProductName,
    p.Price
FROM
    Products p
JOIN
    Categories c ON p.CategoryID = c.CategoryID
WHERE
    p.Price > 50
ORDER BY
    p.Price DESC;
```
