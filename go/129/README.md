# No.129

Go の `net/http/httptest` を使ったハンドラの単体テスト

## **1. `server.go`（テスト対象のハンドラを含むWebアプリ）**

```go
package main

import (
    "encoding/json"
    "fmt"
    "net/http"
    "strconv"
)

// ユーザーデータ
var users = map[int]string{
    1: "Alice",
    2: "Bob",
}

// ユーザーハンドラ
func userHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodGet {
        http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
        return
    }

    idStr := r.URL.Path[len("/users/"):]
    id, err := strconv.Atoi(idStr)
    if err != nil {
        http.Error(w, "Invalid User ID", http.StatusBadRequest)
        return
    }

    name, exists := users[id]
    if !exists {
        http.Error(w, "User Not Found", http.StatusNotFound)
        return
    }

    response := map[string]string{"id": idStr, "name": name}
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(response)
}

func main() {
    http.HandleFunc("/users/", userHandler)

    fmt.Println("サーバーをポート8080で起動中...")
    http.ListenAndServe(":8080", nil)
}
```

## **2. `server_test.go`（HTTPリクエストのモックを使ったテスト）**

```go
package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
)

// 200 OK (正常なID)
func TestUserHandler_Success(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/1", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusOK {
        t.Errorf("Expected status %d, got %d", http.StatusOK, res.StatusCode)
    }
}

// 404 Not Found (存在しないID)
func TestUserHandler_NotFound(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/99", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusNotFound {
        t.Errorf("Expected status %d, got %d", http.StatusNotFound, res.StatusCode)
    }
}

// 400 Bad Request (無効なID)
func TestUserHandler_BadRequest(t *testing.T) {
    req := httptest.NewRequest(http.MethodGet, "/users/abc", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusBadRequest {
        t.Errorf("Expected status %d, got %d", http.StatusBadRequest, res.StatusCode)
    }
}

// 405 Method Not Allowed (POST でリクエスト)
func TestUserHandler_MethodNotAllowed(t *testing.T) {
    req := httptest.NewRequest(http.MethodPost, "/users/1", nil)
    rec := httptest.NewRecorder()

    userHandler(rec, req)

    res := rec.Result()
    if res.StatusCode != http.StatusMethodNotAllowed {
        t.Errorf("Expected status %d, got %d", http.StatusMethodNotAllowed, res.StatusCode)
    }
}
```

## **3. テスト実行**

```sh
go test -v
```

**成功時の出力例**

```
=== RUN   TestUserHandler_Success
--- PASS: TestUserHandler_Success (0.00s)
=== RUN   TestUserHandler_NotFound
--- PASS: TestUserHandler_NotFound (0.00s)
=== RUN   TestUserHandler_BadRequest
--- PASS: TestUserHandler_BadRequest (0.00s)
=== RUN   TestUserHandler_MethodNotAllowed
--- PASS: TestUserHandler_MethodNotAllowed (0.00s)
PASS
ok  	myproject	0.189s
```

## **4. コードのポイント**

- **`httptest.NewRequest()`**
  - HTTPリクエストを**モック**してテストを実行
- **`httptest.NewRecorder()`**
  - `http.ResponseWriter` の代わりに、**レスポンスを記録**
- **`rec.Result().StatusCode`**
  - 返された **HTTPステータスコードをチェック**
- **異常系テストを網羅**
  - **200 OK** → 正常なユーザーID
  - **404 Not Found** → 存在しないユーザーID
  - **400 Bad Request** → 無効なID (`abc`)
  - **405 Method Not Allowed** → `POST` でリクエスト
