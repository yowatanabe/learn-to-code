# No.090

問題: 単純なREST APIを作成してください。メモの作成、取得、削除を行うRESTエンドポイントを提供します。

```bash
# GET
curl localhost:8080/memo/1
# POST
curl -X POST -H "Content-Type: application/json" -d '{"content":"test"}' localhost:8080/memo/3
# DELETE
curl -X DELETE -H "Content-Type: application/json" localhost:8080/memo/3
```
