# No.001

新しいデータベースを作成し、その中に複数のテーブルを作成してください。また、これらのテーブルにデータを挿入してください。

以下の要件を満たすデータベースとテーブルを作成するSQL文を書いてください。

1. データベース名は `LibraryDB` とします。
2. テーブルは以下の3つを作成します：
    - **Authors** テーブル: 著者の情報を管理します。
        - AuthorID (INT, PRIMARY KEY)
        - AuthorName (VARCHAR(100))
    - **Books** テーブル: 書籍の情報を管理します。
        - BookID (INT, PRIMARY KEY)
        - Title (VARCHAR(100))
        - AuthorID (INT, FOREIGN KEY)
        - PublishedDate (DATE)
    - **Borrowers** テーブル: 書籍を借りる人の情報を管理します。
        - BorrowerID (INT, PRIMARY KEY)
        - BorrowerName (VARCHAR(100))
        - BorrowedBookID (INT, FOREIGN KEY)
