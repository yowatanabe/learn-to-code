# No.095

以下のようなテーブルがあります。

**Books テーブル:**

| BookID | Title                | Author           | Stock |
|--------|----------------------|------------------|-------|
| 1      | To Kill a Mockingbird| Harper Lee       | 10    |
| 2      | 1984                 | George Orwell    | 8     |
| 3      | The Great Gatsby     | F. Scott Fitzgerald | 5    |

**Sales テーブル:**

| SaleID | BookID | Quantity | SaleDate   |
|--------|--------|----------|------------|
| 1      | 1      | 2        | 2024-07-01 |
| 2      | 2      | 1        | 2024-07-05 |

ストアドプロシージャを作成し、新しい販売を追加するプロシージャを示してください。また、トリガーを作成し、販売が追加されたときに本の在庫を更新するトリガーを示してください。
