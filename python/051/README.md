# No.051

問題: 特定のディレクトリ内にあるログファイルから、指定された期間内のエラーメッセージを検索し、エラーレポートを生成する自動化スクリプトを作成してください。

要件:

1. ユーザーに対象のディレクトリパス、検索開始日、検索終了日、およびエラーレポートの出力ファイル名を入力してもらいます。
1. 指定されたディレクトリ内のログファイルから、指定された期間内のエラーメッセージを検索します。
1. 検索結果を指定したエラーレポートファイルに保存します。エラーレポートにはエラーメッセージ、発生した日時、およびファイル名が含まれること。
1. プログラム実行時に、処理の成功か失敗かをログファイルに記録します。

指定された期間内のエラーメッセージを検索してエラーレポートを生成するDevOps自動化タスクを作成しています。処理の結果と成功か失敗かが「result_log.txt」というログファイルに記録されます。
