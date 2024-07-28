# No.002

新しいデータベースを作成し、その中に複数のテーブルを作成してください。また、これらのテーブルにデータを挿入してください。

以下の要件を満たすデータベースとテーブルを作成するSQL文を書いてください。

1. データベース名は `CompanyDB` とします。
2. テーブルは以下の3つを作成します：
    - **Departments** テーブル: 部門の情報を管理します。
        - DepartmentID (INT, PRIMARY KEY)
        - DepartmentName (VARCHAR(100))
    - **Employees** テーブル: 従業員の情報を管理します。
        - EmployeeID (INT, PRIMARY KEY)
        - EmployeeName (VARCHAR(100))
        - DepartmentID (INT, FOREIGN KEY)
        - HireDate (DATE)
    - **Salaries** テーブル: 従業員の給与情報を管理します。
        - SalaryID (INT, PRIMARY KEY)
        - EmployeeID (INT, FOREIGN KEY)
        - SalaryAmount (DECIMAL(10, 2))
        - SalaryDate (DATE)
