# No.036

あなたは、図書館のシステムを設計しています。本と借り手のデータを管理する必要があります。各本には一意の識別子があり、各借り手も一意のIDを持っています。本が借りられたとき、その情報を記録するために主キーと外部キーの概念を使用します。

### テーブル設計

**Books テーブル:**

| BookID | Title                | Author         |
|--------|----------------------|----------------|
| 1      | "The Catcher in the Rye" | J.D. Salinger |
| 2      | "To Kill a Mockingbird"  | Harper Lee    |
| 3      | "1984"                   | George Orwell |

**Borrowers テーブル:**

| BorrowerID | BorrowerName    |
|------------|-----------------|
| 1          | Alice Johnson   |
| 2          | Bob Smith       |
| 3          | Charlie Brown   |

**BorrowingRecords テーブル:**

| RecordID | BookID | BorrowerID | BorrowDate  |
|----------|--------|------------|-------------|
| 1        | 1      | 1          | 2024-09-01  |
| 2        | 2      | 2          | 2024-09-03  |
| 3        | 3      | 3          | 2024-09-05  |
