# No.070

以下のようなテーブルがあります。

**Library テーブル:**

| BookID | Title                   | Author         | Genre          | PublishDate |
|--------|-------------------------|----------------|----------------|-------------|
| 1      | To Kill a Mockingbird   | Harper Lee     | Fiction        | 1960-07-11  |
| 2      | 1984                    | George Orwell  | Dystopian      | 1949-06-08  |
| 3      | Moby Dick               | Herman Melville| Fiction        | 1851-10-18  |
| 4      | The Great Gatsby        | F. Scott Fitzgerald | Fiction   | 1925-04-10  |
| 5      | Brave New World         | Aldous Huxley  | Dystopian      | 1932-08-31  |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを実行してください。

```sql
SELECT
    Title,
    Author,
    PublishDate
FROM
    Library
WHERE
    Genre = 'Fiction'
    AND PublishDate BETWEEN '1900-01-01' AND '2000-12-31'
ORDER BY
    PublishDate DESC;
```
