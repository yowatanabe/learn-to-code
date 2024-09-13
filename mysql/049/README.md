# No.049

あなたはMySQLデータベースにおいて、ユーザー情報を管理するためのテーブル`users`を作成しました。テーブル構造は以下の通りです。

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    age INT
);
```

1. `username`カラムに対してB-Treeインデックスを作成するSQL文を書いてください。
2. `email`カラムに対してHashインデックスを作成するSQL文を書いてください。
3. B-TreeインデックスとHashインデックスの違いを説明し、それぞれが最適な場面を具体的に述べてください。

また、この問題を解くために必要なデータをテーブルに挿入してください。
