# No.005

新しいデータベースを作成し、その中に複数のテーブルを作成してください。また、これらのテーブルにデータを挿入してください。

以下の要件を満たすデータベースとテーブルを作成するSQL文を書いてください。

1. データベース名は `ProjectManagementDB` とします。
2. テーブルは以下の3つを作成します：
    - **Projects** テーブル: プロジェクトの情報を管理します。
        - ProjectID (INT, PRIMARY KEY)
        - ProjectName (VARCHAR(100))
        - StartDate (DATE)
        - EndDate (DATE)
    - **Employees** テーブル: 従業員の情報を管理します。
        - EmployeeID (INT, PRIMARY KEY)
        - EmployeeName (VARCHAR(100))
        - Department (VARCHAR(100))
    - **Assignments** テーブル: プロジェクトに割り当てられた従業員の情報を管理します。
        - AssignmentID (INT, PRIMARY KEY)
        - ProjectID (INT, FOREIGN KEY)
        - EmployeeID (INT, FOREIGN KEY)
        - Role (VARCHAR(100))
