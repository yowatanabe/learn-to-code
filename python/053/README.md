# No.053

問題: 特定のディレクトリ内にあるログファイルから、特定のキーワードが含まれるエントリのみを抽出して、別のファイルに保存する自動化スクリプトを作成してください。また、抽出したエントリの数をカウントしてログに記録します。

要件:

1. ユーザーに対象のディレクトリパス、検索するキーワード、および出力ファイル名を入力してもらいます。
1. 指定されたディレクトリ内のログファイルから、指定されたキーワードが含まれるエントリを抽出します。
1. キーワードは大文字・小文字で区別しないこととします。
1. 抽出したエントリを指定した出力ファイルに保存します。
1. エントリの抽出と保存が完了した後、抽出したエントリの数をログに記録します。
1. プログラム実行時に、処理の成功か失敗かをログファイルに記録します。

特定のキーワードが含まれるエントリを抽出してファイルに保存するDevOps自動化タスクを作成しています。エントリの抽出数が「extract_entries_log.txt」というログファイルに記録されます。
