# No.045

問題: 特定のフォルダ内にある複数のJSONファイルから特定の情報を抽出して、CSVファイルに変換する自動化スクリプトを作成してください。

要件:

1. ユーザーに対象のフォルダパスを入力してもらいます。
1. 指定されたフォルダ内のすべてのJSONファイルから、特定の情報（例: "name"と"age"）を抽出します。
1. 抽出した情報をCSVファイルに変換して、指定されたフォルダ内に「output.csv」という名前で保存します。
1. プログラム実行時に、処理の成功か失敗かをログファイルに記録します。

注意:

- JSONファイルは、以下のような形式で保存されているものとします。

  ```json
  {
    "name": "Test User 1",
    "age": 18,
    "email": "test.user.1@example.com"
  }
  ```

- CSVファイルには、以下のような形式で情報が保存されるものとします（ヘッダー行を含む）。

  ```csv
  name,age
  Test User 1,18
  Test User 2,25
  ```

補足:

- 意図的にエラーを起こすために`data3.json`はわざとJSONの書き方を間違えている。

指定したフォルダ内のJSONファイルから特定の情報を抽出してCSVファイルに変換するDevOps自動化タスクを作成します。抽出した情報は「output.csv」というファイルに保存され、変換の成功や失敗が「conversion_log.txt」というログファイルに記録されます。