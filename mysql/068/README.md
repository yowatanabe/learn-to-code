# No.068

あなたは、映画のデータベースを管理しています。映画とその監督の情報を管理し、それぞれの結合を使用してどの映画に監督が割り当てられているか、または割り当てられていないかを確認します。

### テーブル設計

**Movies テーブル:**

| MovieID | MovieTitle         |
|---------|--------------------|
| 1       | Inception          |
| 2       | Interstellar       |
| 3       | Dunkirk            |
| 4       | Tenet              |

**Directors テーブル:**

| DirectorID | DirectorName  | MovieID |
|------------|---------------|---------|
| 1          | Christopher Nolan | 1     |
| 2          | Steven Spielberg  | NULL  |
| 3          | Christopher Nolan | 3     |
