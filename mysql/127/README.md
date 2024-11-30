# No.127

給与管理システムでは、従業員の昇給データを記録する必要があります。`Salaries`テーブルで給与が更新されるたびに、変更前後のデータを`SalaryChanges`テーブルに記録するトリガーを作成してください。

### テーブル設計

#### Employees テーブル

| EmployeeID | EmployeeName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

#### Salaries テーブル

| EmployeeID | CurrentSalary |
|------------|---------------|
| 1          | 5000          |
| 2          | 4500          |
| 3          | 4000          |

#### SalaryChanges テーブル

| ChangeID | EmployeeID | OldSalary | NewSalary | ChangeDate          |
|----------|------------|-----------|-----------|---------------------|
| 1        | 1          | 5000      | 5500      | 2024-11-01 10:00:00 |
