# No.060

あなたは、図書館のデータベースを管理しています。各書籍の貸出履歴を管理し、特定の条件に基づいて、サブクエリを使用して効率的にデータを抽出します。

### テーブル設計

**Books テーブル:**

| BookID | Title    | Author   | Price |
|--------|----------|----------|-------|
| 1      | "Book A" | Author A | 50.00 |
| 2      | "Book B" | Author B | 45.00 |
| 3      | "Book C" | Author C | 55.00 |
| 4      | "Book D" | Author D | 70.00 |
| 5      | "Book E" | Author E | 60.00 |

**BorrowedBooks テーブル:**

| BorrowID | BookID | BorrowerName | BorrowDate |
|----------|--------|--------------|------------|
| 1        | 1      | Borrower A   | 2024-09-01 |
| 2        | 3      | Borrower B   | 2024-09-02 |
| 3        | 2      | Borrower C   | 2024-09-03 |
| 4        | 5      | Borrower D   | 2024-09-04 |
| 5        | 4      | Borrower E   | 2024-09-05 |
