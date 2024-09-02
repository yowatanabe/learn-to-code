# No.038

主キーと外部キーの概念を理解するために、以下のシナリオを使ってテーブルを作成し、データの操作を行います。

**シナリオ:**

あなたは、IT会社のプロジェクト管理システムを設計しています。プロジェクトとそれに割り当てられた社員のデータを管理する必要があります。各プロジェクトと社員は一意のIDを持ち、それらの関係を記録するために主キーと外部キーの概念を使用します。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName | Department   |
|------------|--------------|--------------|
| 1          | Alice        | Development  |
| 2          | Bob          | IT Support   |
| 3          | Charlie      | Quality Assurance |

**Projects テーブル:**

| ProjectID | ProjectName           | StartDate  |
|-----------|-----------------------|------------|
| 101       | Website Redesign       | 2024-09-01 |
| 102       | Mobile App Development | 2024-09-10 |
| 103       | Network Upgrade        | 2024-09-15 |

**Assignments テーブル:**

| AssignmentID | EmployeeID | ProjectID | Role              |
|--------------|------------|-----------|-------------------|
| 1            | 1          | 101       | Frontend Developer|
| 2            | 2          | 103       | Network Engineer  |
| 3            | 3          | 102       | QA Specialist     |
| 4            | 1          | 102       | Backend Developer |
