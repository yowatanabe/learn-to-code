# No.030

以下のような2つのテーブルがあります。

**Authors テーブル:**

| AuthorID | AuthorName  |
|----------|-------------|
| 1        | J.K. Rowling|
| 2        | George Orwell|
| 3        | J.R.R. Tolkien|
| 4        | Mark Twain  |

**Books テーブル:**

| BookID | BookTitle                | AuthorID |
|--------|--------------------------|----------|
| 1      | Harry Potter             | 1        |
| 2      | 1984                     | 2        |
| 3      | The Hobbit               | 3        |
| 4      | The Adventures of Tom Sawyer| 4        |
| 5      | Animal Farm              | 2        |

次のSQL文を実行した結果をそれぞれ記述してください。

1. INNER JOIN を使用して、AuthorsテーブルとBooksテーブルを結合した結果。
2. LEFT JOIN を使用して、AuthorsテーブルとBooksテーブルを結合した結果。
3. RIGHT JOIN を使用して、AuthorsテーブルとBooksテーブルを結合した結果。
4. FULL JOIN を使用して、AuthorsテーブルとBooksテーブルを結合した結果。
