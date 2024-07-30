# No.004

新しいデータベースを作成し、その中に複数のテーブルを作成してください。また、これらのテーブルにデータを挿入してください。

以下の要件を満たすデータベースとテーブルを作成するSQL文を書いてください。

1. データベース名は `CompanyInventoryDB` とします。
2. テーブルは以下の3つを作成します：
    - **Suppliers** テーブル: サプライヤーの情報を管理します。
        - SupplierID (INT, PRIMARY KEY)
        - SupplierName (VARCHAR(100))
        - ContactEmail (VARCHAR(100))
    - **Products** テーブル: 製品の情報を管理します。
        - ProductID (INT, PRIMARY KEY)
        - ProductName (VARCHAR(100))
        - SupplierID (INT, FOREIGN KEY)
        - QuantityInStock (INT)
    - **Orders** テーブル: 注文の情報を管理します。
        - OrderID (INT, PRIMARY KEY)
        - ProductID (INT, FOREIGN KEY)
        - OrderDate (DATE)
        - QuantityOrdered (INT)
