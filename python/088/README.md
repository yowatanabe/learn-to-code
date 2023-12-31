# No.088

問題:あなたは、サーバーのログファイルを自動的に監視し、特定のエラーメッセージが現れた場合に通知を行うスクリプトを作成する必要があります。以下の要件に従ってPythonスクリプトを作成してください。

1. スクリプトは、特定のログファイルを監視対象とします。監視対象のログファイルのパスは設定ファイルで指定できるようにしてください。
1. ログファイルはリアルタイムで監視され、新しいエントリがログファイルに追加されるたびにチェックされます。
1. ログファイル内で特定のエラーメッセージ（例: "ERROR"）が現れた場合、通知をトリガーします。通知は、コンソールへの出力またはメール通知など、選択した方法で行ってください。
1. 監視と通知のロジックを関数またはクラスとして整理し、再利用可能なコードにしてください。

指定したログファイルを監視し、"ERROR"というエラーメッセージがログファイルに現れた場合にコンソールに通知を出力します。必要に応じて通知方法や監視対象のログファイルを変更できます。
