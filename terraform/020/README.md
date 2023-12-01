# No.020

問題: AWS の CloudWatch Logs にロググループを作成し、そのロググループに対して期間ごとのエクスポートタスクを設定する Terraform コードを作成してください。以下の条件を満たすようにしてください。

1. ロググループの名前は "test-log-group" とします。
1. エクスポートタスクは、CloudWatch Logs から Kinesis Firehose を経由して Amazon S3 バケットにログデータをエクスポートするものとします。
1. ログデータのエクスポート先の S3 バケット名は "test-export-bucket"、プレフィックスは "logs/" とします。
