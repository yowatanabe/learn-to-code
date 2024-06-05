# No.049

以下のようなテーブルがあります。

**Employees テーブル:**

| EmployeeID | EmployeeName     | Email                 |
|------------|------------------|-----------------------|
| 1          | Alice Johnson    | alice.johnson@company.com |
| 2          | Bob Smith        | bob.smith@company.com   |
| 3          | Charlie Brown    | charlie.brown@company.com |
| 4          | David Wilson     | david.wilson@company.com  |
| 5          | Eve Davis        | eve.davis@company.org   |

次の条件を満たすSQLクエリを作成してください：

1. **LIKE** 演算子を使用して、メールアドレスが「@company.com」で終わる従業員の名前とメールアドレスを表示します。
2. **REGEXP** 演算子を使用して、従業員の名前が「A」で始まる従業員の名前とメールアドレスを表示します。
