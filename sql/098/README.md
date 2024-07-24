# No.098

以下のようなテーブルがあります。

**Authors テーブル:**

| AuthorID | AuthorName    |
|----------|---------------|
| 1        | J.K. Rowling  |
| 2        | George Orwell |
| 3        | Mark Twain    |

**Books テーブル:**

| BookID | Title                | AuthorID |
|--------|----------------------|----------|
| 1      | Harry Potter         | 1        |
| 2      | 1984                 | 2        |
| 3      | Animal Farm          | 2        |
| 4      | Adventures of Huckleberry Finn | 3 |
| 5      | The Adventures of Tom Sawyer    | 3 |

**Sales テーブル:**

| SaleID | BookID | Quantity | SaleDate   |
|--------|--------|----------|------------|
| 1      | 1      | 5        | 2024-01-10 |
| 2      | 2      | 3        | 2024-01-15 |
| 3      | 3      | 4        | 2024-01-20 |
| 4      | 4      | 2        | 2024-02-10 |
| 5      | 5      | 1        | 2024-02-15 |

複数のテーブルからデータを結合する方法を示してください。以下のクエリを実行するSQL文を書いてください：

1. 各販売の詳細を含むレポートを作成し、販売ID、タイトル、著者名、数量、および販売日を表示します。
2. 各著者ごとの総販売数量を表示します。
