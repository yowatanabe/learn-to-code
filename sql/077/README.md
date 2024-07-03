# No.077

以下のようなテーブルがあります。

**Employees テーブル:**

| EmployeeID | EmployeeName | DepartmentID | HireDate   | Salary |
|------------|--------------|--------------|------------|--------|
| 1          | Alice        | 10           | 2020-01-15 | 60000  |
| 2          | Bob          | 20           | 2019-02-20 | 70000  |
| 3          | Charlie      | 10           | 2021-03-10 | 55000  |
| 4          | David        | 30           | 2018-04-25 | 80000  |
| 5          | Eve          | 20           | 2020-05-30 | 75000  |

**Departments テーブル:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 10           | HR             |
| 20           | IT             |
| 30           | Finance        |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    d.DepartmentName,
    e.EmployeeName,
    e.HireDate,
    e.Salary
FROM
    Employees e
JOIN
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE
    e.HireDate BETWEEN '2019-01-01' AND '2021-12-31'
ORDER BY
    e.Salary DESC;
```
