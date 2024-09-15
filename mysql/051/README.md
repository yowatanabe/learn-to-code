# No.051

あなたはMySQLデータベースを使用して、ユーザーのログイン履歴を管理するためのテーブル`login_history`を作成しました。テーブルの構造は以下の通りです。

```sql
CREATE TABLE login_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time DATETIME NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    device VARCHAR(255)
);
```

最近、以下のクエリの実行速度が遅いことが問題になっています。

```sql
SELECT * FROM login_history
WHERE user_id = 1001
AND login_time BETWEEN '2023-01-01 00:00:00' AND '2023-12-31 23:59:59';
```

1. **このクエリのパフォーマンスを最適化するために、どのようなインデックスを作成すればよいでしょうか？最適なインデックスを作成するSQL文を書いてください。**

2. **作成したインデックスが、このクエリの性能を向上させる理由を説明してください。**

3. **インデックスの最適化において、`login_time`カラムを単独でインデックス化することと、複合インデックスを使用することの違いを説明してください。**
