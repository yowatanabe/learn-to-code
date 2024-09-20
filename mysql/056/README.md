# No.056

あなたはオンライン書店のMySQLデータベースを管理しています。書籍情報を保存するための`books`テーブルと、顧客の注文情報を保存するための`orders`テーブルがあります。

テーブルの構造は以下の通りです。

```sql
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
```

1. **サブクエリを使用して、合計で5回以上注文された書籍のタイトルと著者名を取得するSQL文を書いてください。**

2. **サブクエリを使用して、在庫がゼロの書籍を注文した顧客の名前を取得するSQL文を書いてください。**
