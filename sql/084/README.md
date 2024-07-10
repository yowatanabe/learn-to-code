# No.084

以下のようなテーブルがあります。

**Books テーブル:**

| BookID | Title                 | Author             | Quantity |
|--------|-----------------------|--------------------|----------|
| 1      | 1984                  | George Orwell      | 10       |
| 2      | To Kill a Mockingbird | Harper Lee         | 5        |
| 3      | The Great Gatsby      | F. Scott Fitzgerald| 7        |

**Borrowers テーブル:**

| BorrowerID | BorrowerName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

**BorrowedBooks テーブル:**

| BorrowID | BookID | BorrowerID | BorrowDate |
|----------|--------|------------|------------|
| 1        | 1      | 1          | 2024-07-01 |
| 2        | 2      | 2          | 2024-07-05 |

新しい借用を追加し、在庫を減らすトランザクションを実行するSQL文を書いてください。
