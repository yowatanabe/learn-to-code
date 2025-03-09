# No.126

Go の `gorm` を使用した CRUD API の実装。
データベースは SQLite を使いますが、設定を変更すれば MySQL や PostgreSQL にも対応できる。

## **1. 事前準備**

### **(1) 必要なパッケージのインストール**

```sh
go get -u gorm.io/gorm gorm.io/driver/sqlite
```

MySQL を使う場合：

```sh
go get -u gorm.io/driver/mysql
```

PostgreSQL を使う場合：

```sh
go get -u gorm.io/driver/postgres
```

## **2. `main.go`（CRUD API の実装）**

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"

    "gorm.io/driver/sqlite"
    "gorm.io/gorm"
)

// User モデル
type User struct {
    ID    uint   `json:"id" gorm:"primaryKey"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

var db *gorm.DB

func main() {
    var err error
    db, err = gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
    if err != nil {
        log.Fatal("DB接続エラー:", err)
    }

    // テーブル作成
    db.AutoMigrate(&User{})

    // ルーティング
    http.HandleFunc("/users", handleUsers)
    http.HandleFunc("/users/", handleUserByID)

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}

// `/users` の GET (全件取得) と POST (新規作成) を処理
func handleUsers(w http.ResponseWriter, r *http.Request) {
    switch r.Method {
    case "GET":
        var users []User
        db.Find(&users)
        jsonResponse(w, users, http.StatusOK)

    case "POST":
        var user User
        if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
            http.Error(w, "無効なJSON", http.StatusBadRequest)
            return
        }
        db.Create(&user)
        jsonResponse(w, user, http.StatusCreated)

    default:
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
    }
}

// `/users/{id}` の GET, PUT, DELETE を処理
func handleUserByID(w http.ResponseWriter, r *http.Request) {
    id := r.URL.Path[len("/users/"):]
    var user User

    switch r.Method {
    case "GET":
        if err := db.First(&user, id).Error; err != nil {
            http.Error(w, "ユーザーが見つかりません", http.StatusNotFound)
            return
        }
        jsonResponse(w, user, http.StatusOK)

    case "PUT":
        if err := db.First(&user, id).Error; err != nil {
            http.Error(w, "ユーザーが見つかりません", http.StatusNotFound)
            return
        }
        if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
            http.Error(w, "無効なJSON", http.StatusBadRequest)
            return
        }
        db.Save(&user)
        jsonResponse(w, user, http.StatusOK)

    case "DELETE":
        if err := db.Delete(&User{}, id).Error; err != nil {
            http.Error(w, "削除エラー", http.StatusInternalServerError)
            return
        }
        jsonResponse(w, map[string]string{"message": "削除成功"}, http.StatusOK)

    default:
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
    }
}

// JSONレスポンスのヘルパー関数
func jsonResponse(w http.ResponseWriter, data interface{}, status int) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(status)
    json.NewEncoder(w).Encode(data)
}
```

## **3. 実行方法**

```sh
go run main.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

## **4. 動作確認**

### **(1) ユーザー作成**

```sh
curl -X POST http://localhost:8080/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice", "email": "alice@example.com"}'
```

**レスポンス**

```json
{"id":1,"name":"Alice","email":"alice@example.com"}
```

### **(2) ユーザー一覧取得**

```sh
curl -X GET http://localhost:8080/users
```

**レスポンス**

```json
[{"id":1,"name":"Alice","email":"alice@example.com"}]
```

### **(3) ユーザー情報更新**

```sh
curl -X PUT http://localhost:8080/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice Updated", "email": "alice.new@example.com"}'
```

**レスポンス**

```json
{"id":1,"name":"Alice Updated","email":"alice.new@example.com"}
```

### **(4) ユーザー削除**

```sh
curl -X DELETE http://localhost:8080/users/1
```

**レスポンス**

```json
{"message":"削除成功"}
```

## **5. コードのポイント**

- `gorm.Open(sqlite.Open("test.db"))` で **SQLite に接続**（MySQL/PostgreSQL も可）
- `db.AutoMigrate(&User{})` で **テーブル作成**
- `db.Create(&user)`, `db.Find(&users)`, `db.First(&user, id)`, `db.Save(&user)`, `db.Delete(&User{}, id)` で **CRUD 処理**
- `handleUsers()` で **全ユーザー取得（GET） & 新規作成（POST）**
- `handleUserByID()` で **特定ユーザー取得（GET）, 更新（PUT）, 削除（DELETE）**
- `jsonResponse()` で **JSON レスポンスを統一**
