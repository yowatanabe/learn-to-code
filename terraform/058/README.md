# No.058

問題: Amazon DynamoDB テーブルを作成し、そのテーブルにデータを挿入する Terraform コードを示してください。以下の条件を満たすように設定してください。

1. DynamoDB テーブルの名前は "ExampleTable" とする。
1. テーブルは "UserId" を主キーとして持ち、"Username" と "Email" の2つの属性を含む。
1. テーブルに初期データとして以下の2つのアイテムを挿入する。
   - アイテム1: UserId=1, Username="User1", Email="user1@example.com"
   - アイテム2: UserId=2, Username="User2", Email="user2@example.com"
