# No.049

問題: AWS Transfer Familyを使用してSFTPサーバーを作成する設定を記述してください。IAMユーザーを作成しSFTPログインを許可するようにしてください。


メモ: 接続に使用するSSH公開鍵を`aws_transfer_ssh_key`の`body`に指定する。以下のコマンドでキーペアファイルを利用することもできる。

```bash
ssh-keygen -y -f <キーペアファイル>
ssh-rsa XXXXXXXXXXXXXXX
```
