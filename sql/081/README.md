# No.081

トランザクションとは何か、またそのACID特性について説明し、SQLでのトランザクションの使用方法を示してください。

以下のようなテーブルがあります。

**Accounts テーブル:**

| AccountID | AccountName | Balance |
|-----------|-------------|---------|
| 1         | Alice       | 1000    |
| 2         | Bob         | 500     |

トランザクションを使用して、AliceからBobへの200の送金を実行するSQL文を書いてください。