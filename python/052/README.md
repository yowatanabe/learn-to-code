# No.052

問題: 特定のディレクトリ内にあるログファイルから、エラーメッセージの発生頻度を集計して、エラーレポートを生成する自動化スクリプトを作成してください。

要件:

1. ユーザーに対象のディレクトリパスを入力してもらいます。
1. 指定されたディレクトリ内のログファイルから、各エラーメッセージの発生回数を集計します。
1. エラーメッセージとその発生回数をエラーレポートに保存します。
1. エラーレポートはエラーメッセージの発生回数の降順で表示されるようにします。
1. プログラム実行時に、処理の成功か失敗かをログファイルに記録します。

特定のディレクトリ内のログファイルからエラーメッセージの発生頻度を集計してエラーレポートを生成するDevOps自動化タスクを作成しています。処理の結果と成功か失敗かが「error_report_log.txt」というログファイルに記録されます。