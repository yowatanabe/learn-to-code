# No.070

あなたは、ある出版社の書籍と著者のデータを管理しています。書籍ごとに著者が割り当てられているかどうか、あるいは著者が書籍に割り当てられていない場合も含めて、様々な結合方法を確認します。

### テーブル設計

**Books テーブル:**

| BookID | BookTitle         |
|--------|-------------------|
| 1      | SQL Basics        |
| 2      | Advanced MySQL    |
| 3      | Database Design   |
| 4      | Cloud Computing   |

**Authors テーブル:**

| AuthorID | AuthorName     | BookID |
|----------|----------------|--------|
| 1        | Alice Johnson  | 1      |
| 2        | Bob Smith      | 3      |
| 3        | Charlie Davis  | NULL   |
