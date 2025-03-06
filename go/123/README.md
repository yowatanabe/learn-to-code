# No.123

Go の `net/http` を使って JSON API を実装する

## **1. `server.go`（JSON APIの実装）**

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
)

// User 構造体 (JSONデータ用)
type User struct {
    ID    int    `json:"id"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

// ダミーデータ
var users = []User{
    {ID: 1, Name: "Alice", Email: "alice@example.com"},
    {ID: 2, Name: "Bob", Email: "bob@example.com"},
}

// GET: ユーザー一覧を取得
func getUsersHandler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(users)
}

// POST: ユーザーを追加
func createUserHandler(w http.ResponseWriter, r *http.Request) {
    var newUser User
    err := json.NewDecoder(r.Body).Decode(&newUser)
    if err != nil {
        http.Error(w, "無効なJSONデータ", http.StatusBadRequest)
        return
    }

    newUser.ID = len(users) + 1
    users = append(users, newUser)

    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusCreated)
    json.NewEncoder(w).Encode(newUser)
}

func main() {
    http.HandleFunc("/users", func(w http.ResponseWriter, r *http.Request) {
        switch r.Method {
        case "GET":
            getUsersHandler(w, r)
        case "POST":
            createUserHandler(w, r)
        default:
            http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
        }
    })

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

## **2. 実行方法**

```sh
go run server.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

## **3. 動作確認**

### **(1) GET: ユーザー一覧を取得**

```sh
curl -X GET http://localhost:8080/users
```

**レスポンス**

```json
[
  {"id":1,"name":"Alice","email":"alice@example.com"},
  {"id":2,"name":"Bob","email":"bob@example.com"}
]
```

### **(2) POST: ユーザーを追加**

```sh
curl -X POST http://localhost:8080/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Charlie", "email": "charlie@example.com"}'
```

**レスポンス**

```json
{"id":3,"name":"Charlie","email":"charlie@example.com"}
```

### **(3) 再度 GET で確認**

```sh
curl -X GET http://localhost:8080/users
```

**レスポンス**

```json
[
  {"id":1,"name":"Alice","email":"alice@example.com"},
  {"id":2,"name":"Bob","email":"bob@example.com"},
  {"id":3,"name":"Charlie","email":"charlie@example.com"}
]
```

## **4. コードのポイント**

- `GET /users` → **ユーザー一覧を JSON で返す**
- `POST /users` → **JSON を受け取って新規ユーザーを登録**
- `json.NewEncoder(w).Encode(data)` で **レスポンスを JSON 形式で返す**
- `json.NewDecoder(r.Body).Decode(&data)` で **JSON リクエストをデコード**
