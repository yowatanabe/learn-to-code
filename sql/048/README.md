# No.048

以下のようなテーブルがあります。

**Books テーブル:**

| BookID | Title                        | Author             |
|--------|------------------------------|--------------------|
| 1      | The Great Gatsby             | F. Scott Fitzgerald|
| 2      | To Kill a Mockingbird        | Harper Lee         |
| 3      | 1984                         | George Orwell      |
| 4      | Brave New World              | Aldous Huxley      |
| 5      | The Catcher in the Rye       | J.D. Salinger      |
| 6      | Great Expectations           | Charles Dickens    |
| 7      | The Grapes of Wrath          | John Steinbeck     |

次の条件を満たすSQLクエリを作成してください：

1. **LIKE** 演算子を使用して、タイトルに「Great」という単語を含む本のタイトルと著者を表示します。
2. **REGEXP** 演算子を使用して、著者の姓が「G」で始まる本のタイトルと著者を表示します。
