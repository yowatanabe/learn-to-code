# No.073

あなたは、あるIT企業での従業員、プロジェクト、タスクの管理システムを担当しています。従業員がどのプロジェクトに参加しており、その中でどのタスクがどのステータスにあるかを確認するために、複雑なクエリを作成します。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName  |
|------------|---------------|
| 1          | Alice         |
| 2          | Bob           |
| 3          | Charlie       |
| 4          | David         |

**Projects テーブル:**

| ProjectID | ProjectName      |
|-----------|------------------|
| 101       | Cloud Migration  |
| 102       | Web Redesign     |
| 103       | AI Development   |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName          | AssignedTo |
|--------|-----------|-------------------|------------|
| 1001   | 101       | VM Setup          | 1          |
| 1002   | 101       | Data Transfer     | 2          |
| 1003   | 102       | Frontend Design   | 1          |
| 1004   | 103       | Model Training    | 3          |
| 1005   | 102       | Backend Integration | 4         |

**TaskStatus テーブル:**

| TaskID | Status        | LastUpdated     |
|--------|---------------|-----------------|
| 1001   | In Progress   | 2024-10-01      |
| 1002   | Completed     | 2024-09-28      |
| 1003   | In Progress   | 2024-10-02      |
| 1004   | Completed     | 2024-09-30      |
| 1005   | Not Started   | NULL            |
