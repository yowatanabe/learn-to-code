# No.033

以下の2つのテーブルがあります。

**Products テーブル:**

| ProductID | ProductName | CategoryID | Price |
|-----------|-------------|------------|-------|
| 1         | Laptop      | 1          | 1000  |
| 2         | Mouse       | 2          | 50    |
| 3         | Keyboard    | 2          | 80    |
| 4         | Monitor     | 3          | 300   |
| 5         | Desk        | 3          | 150   |

**Categories テーブル:**

| CategoryID | CategoryName |
|------------|--------------|
| 1          | Electronics  |
| 2          | Accessories  |
| 3          | Furniture    |

次の条件を満たすサブクエリを使用したSQLクエリを作成してください：

1. 各カテゴリーの平均価格より高い価格の製品の名前と価格を表示します。
2. 上記の結果にカテゴリー名も追加します。
