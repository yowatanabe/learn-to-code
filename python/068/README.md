# No.068

問題: ウェブサイトの可用性を監視するためのPythonスクリプトを作成してください。スクリプトは、指定したウェブサイトに定期的にアクセスし、ウェブサイトが正常に応答するかどうかを確認します。もしウェブサイトが利用できない場合、アラートを生成して通知します。

要件:

1. ユーザーに監視したいウェブサイトのURL、監視の頻度（例: 1分ごと、5分ごと）、Slackの通知先を入力してもらいます。
1. 指定されたウェブサイトにHTTPリクエストを送信して、ウェブサイトの可用性を確認します。
1. ウェブサイトが正常に応答した場合、通常のログメッセージを生成し、指定された頻度でウェブサイトの可用性を監視し続けます。
1. ウェブサイトが応答しない場合、アラートメッセージを生成し、Slackに通知します。
1. プログラム実行時に、処理の失敗をログファイルに記録します。

指定したウェブサイトの可用性を監視し、ウェブサイトが応答しない場合にアラートを生成します。アラートはコンソールに表示され、またログファイルにも記録されます。監視の頻度は指定した秒数ごとに設定されていますが、必要に応じて変更できます。