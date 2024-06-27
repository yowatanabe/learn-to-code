# No.071

以下のようなテーブルがあります。

**Users テーブル:**

| UserID | UserName    | Age | JoinDate   |
|--------|-------------|-----|------------|
| 1      | Alice       | 30  | 2021-05-01 |
| 2      | Bob         | 25  | 2021-06-15 |
| 3      | Charlie     | 35  | 2021-07-20 |
| 4      | David       | 40  | 2021-08-25 |
| 5      | Eve         | 28  | 2021-09-30 |

**Posts テーブル:**

| PostID | UserID | PostDate   | Content            |
|--------|--------|------------|--------------------|
| 1      | 1      | 2022-01-01 | Alice's first post |
| 2      | 2      | 2022-01-15 | Bob's first post   |
| 3      | 3      | 2022-02-01 | Charlie's first post|
| 4      | 1      | 2022-02-15 | Alice's second post|
| 5      | 2      | 2022-03-01 | Bob's second post  |

次のクエリのパフォーマンスを向上させるために、適切なインデックスを作成し、クエリを変更してください。

```sql
SELECT
    u.UserName,
    COUNT(p.PostID) AS PostCount
FROM
    Users u
JOIN
    Posts p ON u.UserID = p.UserID
WHERE
    p.PostDate BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY
    u.UserName
ORDER BY
    PostCount DESC;
```
