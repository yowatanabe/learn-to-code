# No.129

会社の勤怠管理システムで、従業員が出勤した場合、その出勤情報を`Attendance`テーブルに記録します。同時に、その従業員の`Employees`テーブルに記録されている「出勤日数（DaysPresent）」を自動的に更新するトリガーを作成してください。

### テーブル設計

#### Employees テーブル

| EmployeeID | EmployeeName | DaysPresent |
|------------|--------------|-------------|
| 1          | Alice        | 0           |
| 2          | Bob          | 0           |
| 3          | Charlie      | 0           |

#### Attendance テーブル

| AttendanceID | EmployeeID | AttendanceDate    |
|--------------|------------|-------------------|
| 1            | 1          | 2024-12-03 08:00:00 |
