# No.016

問題: 以下の動作を実現するTerraformコードを作成してください。

1. S3 バケット内に新しいオブジェクトが作成されると、Lambda関数 A を実行します。
1. Lambda関数 A は、オブジェクトの内容を読み取り、特定の条件に基づいて別の Lambda 関数 B または C を呼び出します。


S3バケットには以下のようなjsonファイルをアップロードすることを想定します。

```json
{
  "condition": "A",
  "content": "This is content for condition A."
}
```
