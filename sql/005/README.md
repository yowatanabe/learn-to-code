# No.005

会社のデータベースから各月の総売上を計算し、それを年間で比較するための報告を作成する必要があります。`orders` テーブルには `order_id`, `order_date`, `amount` (売上額) のカラムがあります。このテーブルから、各月の総売上を計算し、その結果を表示してください。

要件:

1. `order_date` から月情報を抽出します。
2. 抽出した月ごとに `amount` を合計します。
3. 結果は月と総売上額で表示します。