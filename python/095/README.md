# No.095

問題:ウェブサイトの可用性を監視し、ウェブサイトがオフラインになった場合に通知するPythonスクリプトを作成してください。スクリプトは指定したウェブサイトに定期的にリクエストを送信し、特定のHTTPステータスコード（例: 200 OK）が返されない場合にアラートを出力します。また、ウェブサイトが復旧した場合にもアラートを出力します。

**ヒント:**

- `requests`モジュールを使用してウェブサイトにHTTPリクエストを送信します。
- タイマーを使用して定期的にリクエストを送信し、ウェブサイトの状態を監視します。
- 特定のHTTPステータスコードが返されない場合、アラートを出力します。
- ウェブサイトが復旧したことを検出するために、前回の状態と現在の状態を追跡します。

指定したウェブサイトの可用性を監視し、ウェブサイトがオフラインになった場合にアラートを出力します。ウェブサイトが復旧した場合にも通知します。

注意: 実際の運用では、より高度な監視ツールやサービスを使用することが一般的です。