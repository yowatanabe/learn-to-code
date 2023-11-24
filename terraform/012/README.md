# No.012

問題: AWS上でサーバーレスなアーキテクチャを構築しています。このアーキテクチャには、以下のAWSサービスが含まれます: Lambda、API Gateway、DynamoDB。

1. **Lambda:**

   Lambda関数 `ProcessDataFunction` を作成してください。

   - Lambda関数名: `ProcessDataFunction`
   - ランタイム: Python 3.11
   - 環境変数: `DYNAMO_TABLE_NAME` に DynamoDB テーブル名を指定
   - IAMロール: Lambda 関数が DynamoDB テーブルにアクセスするための適切な権限を持つ IAM ロールを作成して使用してください。

1. **DynamoDB:**

   DynamoDB テーブル `MyDataTable` を作成してください。

   - テーブル名: `MyDataTable`
   - プライマリキー: `DataID` (文字列)
   - プロビジョニングスループット: 5 Read Capacity Units, 5 Write Capacity Units
