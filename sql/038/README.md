# No.038

以下の2つのテーブルがあります。

**Books テーブル:**

| BookID | Title            | AuthorID | Price |
|--------|------------------|----------|-------|
| 1      | The Hobbit       | 1        | 15    |
| 2      | 1984             | 2        | 20    |
| 3      | The Catcher in the Rye | 3    | 10    |
| 4      | To Kill a Mockingbird | 4   | 25    |
| 5      | Brave New World  | 2        | 18    |

**Authors テーブル:**

| AuthorID | AuthorName     |
|----------|----------------|
| 1        | J.R.R. Tolkien |
| 2        | George Orwell  |
| 3        | J.D. Salinger  |
| 4        | Harper Lee     |

次の条件を満たすSQLクエリを作成してください：

1. **EXISTS** 演算子を使用して、20ドル以上の本を執筆した著者の名前を表示します。
2. **IN** 演算子を使用して、特定の著者（例：George Orwell, Harper Lee）の本のタイトルを表示します。
3. **ANY** 演算子を使用して、任意のGeorge Orwellの本の価格よりも高い価格の本のタイトルを表示します。
4. **ALL** 演算子を使用して、すべてのGeorge Orwellの本の価格よりも高い価格の本のタイトルを表示します。
