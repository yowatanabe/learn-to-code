# No.021

`movie_sessions` テーブルには、映画ごとの上映セッションとそれによって得られた収益が記録されています。収益が$1000以上の映画のタイトルと、それらが上映された回数をリストするSQLクエリを作成してください。

#### `movie_sessions` テーブル:

- `session_id` (INT): 上映セッションID
- `movie_title` (VARCHAR): 映画のタイトル
- `revenue` (DECIMAL): そのセッションで得られた収益

#### 要件:

1. 各映画のタイトルごとに上映回数を集計します。
2. 収益が$1000以上の映画のみを抽出します。
3. 結果セットには映画のタイトルとその上映回数が含まれる必要があります。
