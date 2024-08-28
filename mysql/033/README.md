# No.033

データベースの正規化について学ぶために、以下のシナリオに基づいてテーブルを設計し、データを正規化してください。特に、第1正規形（1NF）、第2正規形（2NF）、第3正規形（3NF）への変換を行います。

**シナリオ:**

あなたは書店の在庫管理システムを設計しています。最初に1つのテーブルを作成しましたが、データが冗長で非効率的なことに気づきました。これを正規化する手順を示してください。

**元のテーブル:**

**Books テーブル:**

| BookID | Title                | Author          | Publisher       | Genre           | ISBN           | StoreName | StoreAddress         |
|--------|----------------------|-----------------|-----------------|-----------------|----------------|-----------|----------------------|
| 1      | "Clean Code"         | Robert Martin   | Prentice Hall   | Programming     | 978-0132350884 | Central   | 123 Main St          |
| 2      | "The Pragmatic Programmer" | Andrew Hunt   | Addison-Wesley | Programming     | 978-0201616224 | Central   | 123 Main St          |
| 3      | "Introduction to Algorithms" | Thomas H. Cormen | MIT Press       | Computer Science | 978-0262033848 | North     | 456 Oak St           |
| 4      | "Design Patterns"    | Erich Gamma     | Addison-Wesley | Programming     | 978-0201633610 | Central   | 123 Main St          |
| 5      | "The Art of Computer Programming" | Donald Knuth | Addison-Wesley | Computer Science | 978-0201896831 | North     | 456 Oak St           |

