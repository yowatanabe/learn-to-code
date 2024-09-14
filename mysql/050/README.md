# No.050

あなたはMySQLデータベースを使用して、製品情報を管理するテーブル`products`を作成しました。テーブルの構造は以下の通りです。

```sql
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);
```

1. `category`カラムに対してHashインデックスを作成するSQL文を書いてください。ただし、適切なストレージエンジンを使用してください。
2. `price`カラムに対してB-Treeインデックスを作成するSQL文を書いてください。
3. HashインデックスとB-Treeインデックスの特性を考慮して、それぞれが効果的に機能するクエリの例を示してください。

また、この問題を解くために必要なデータをテーブルに挿入してください。
