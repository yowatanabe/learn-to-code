# No.066

以下のようなテーブルがあります。

**Books テーブル:**

| BookID | Title                     | Author           | Genre         | PublishDate | Price |
|--------|---------------------------|------------------|---------------|-------------|-------|
| 1      | To Kill a Mockingbird     | Harper Lee       | Fiction       | 1960-07-11  | 10.99 |
| 2      | 1984                      | George Orwell    | Dystopian     | 1949-06-08  | 8.99  |
| 3      | Moby Dick                 | Herman Melville  | Fiction       | 1851-10-18  | 12.99 |
| 4      | The Great Gatsby          | F. Scott Fitzgerald | Fiction       | 1925-04-10  | 10.99 |
| 5      | Brave New World           | Aldous Huxley    | Dystopian     | 1932-08-31  | 9.99  |

以下のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを実行してください。

```sql
SELECT
    Title,
    Author,
    Price
FROM
    Books
WHERE
    Genre = 'Fiction'
    AND PublishDate BETWEEN '1900-01-01' AND '2000-12-31'
ORDER BY
    Price DESC;
```
