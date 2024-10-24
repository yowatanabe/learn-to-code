# No.090

あなたは、オンライン図書館のデータベース管理者です。膨大な量の図書情報と貸出履歴を保持しており、クエリの応答速度を改善する必要があります。特に、人気のある本を素早く特定するためのクエリを最適化します。

### テーブル設計

**Books テーブル:**

| BookID | Title              | Author          | Category     |
|--------|--------------------|-----------------|--------------|
| 1      | SQL Fundamentals   | John Smith      | Technology   |
| 2      | Learning Python    | Mark Johnson    | Technology   |
| 3      | Mystery of the Mind| Anna Brown      | Fiction      |
| 4      | Cooking 101        | Emma Davis      | Cooking      |

**Loans テーブル:**

| LoanID | BookID | LoanDate   | ReturnDate | MemberID |
|--------|--------|------------|------------|----------|
| 101    | 1      | 2024-10-01 | 2024-10-10 | 1        |
| 102    | 2      | 2024-10-03 | 2024-10-12 | 2        |
| 103    | 3      | 2024-10-05 | 2024-10-15 | 3        |
| 104    | 1      | 2024-10-07 | 2024-10-17 | 4        |
| 105    | 4      | 2024-10-09 | NULL       | 1        |

**Members テーブル:**

| MemberID | MemberName    |
|----------|---------------|
| 1        | Alice White   |
| 2        | Bob Green     |
| 3        | Charlie Black |
| 4        | Diana Yellow  |
