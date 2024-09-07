# No.043

あなたは、オンライン書店のデータベースを設計しています。顧客の注文履歴を管理し、特定のクエリを高速化するためにインデックスを活用する必要があります。

### テーブル設計

**Books テーブル:**

| BookID | Title               | Author        | Price  |
|--------|---------------------|---------------|--------|
| 1      | "Clean Code"         | Robert Martin | 50.00  |
| 2      | "The Pragmatic Programmer" | Andrew Hunt   | 40.00  |
| 3      | "Design Patterns"    | Erich Gamma   | 60.00  |
| 4      | "Refactoring"        | Martin Fowler | 45.00  |

**Orders テーブル:**

| OrderID | CustomerName | BookID | OrderDate  |
|---------|--------------|--------|------------|
| 101     | Alice        | 1      | 2024-09-08 |
| 102     | Bob          | 2      | 2024-09-09 |
| 103     | Charlie      | 3      | 2024-09-10 |
| 104     | Alice        | 4      | 2024-09-11 |
| 105     | Bob          | 1      | 2024-09-12 |
