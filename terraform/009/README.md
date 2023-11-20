# No.009

問題: AWSのLambda関数をTerraformで構築するコードを書いてください。Lambda関数の実行ロールには `arn:aws:iam::aws:policy/AWSLambda_FullAccess` ポリシーをアタッチし、ランタイムは Python 3.11 を使用します。また、関数のコードはローカルのディレクトリにある `lambda_function.zip` ファイルから取得します。関数名は "MyLambdaFunction"、ハンドラは "lambda_function.handler" としてください。
