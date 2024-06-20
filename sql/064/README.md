# No.064

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

次のクエリのパフォーマンスを分析し、最適化してください。

```sql
SELECT
    Departments.DepartmentName,
    Employees.EmployeeName,
    Employees.HireDate,
    Employees.Salary
FROM
    Employees
JOIN
    Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE
    Employees.HireDate BETWEEN '2019-01-01' AND '2021-12-31'
ORDER BY
    Employees.Salary DESC;
```
