# No.128

Go の `net/http` を使ってエラーハンドリングを行い、適切な HTTP ステータスコードを返すサンプルコード

## **1. `main.go`（エラーハンドリング付き HTTP サーバー）**

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
    "strconv"
)

// エラーレスポンス用の構造体
type ErrorResponse struct {
    Error   string `json:"error"`
    Message string `json:"message"`
}

// ユーザー情報の構造体
type User struct {
    ID   int    `json:"id"`
    Name string `json:"name"`
}

var users = map[int]User{
    1: {ID: 1, Name: "Alice"},
    2: {ID: 2, Name: "Bob"},
}

// 汎用エラーレスポンス関数
func errorResponse(w http.ResponseWriter, statusCode int, errMsg string) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(statusCode)
    json.NewEncoder(w).Encode(ErrorResponse{
        Error:   http.StatusText(statusCode),
        Message: errMsg,
    })
}

// `/users/{id}` ハンドラ (エラーハンドリング付き)
func userHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodGet {
        errorResponse(w, http.StatusMethodNotAllowed, "このエンドポイントは GET のみ対応しています")
        return
    }

    // ID取得
    idStr := r.URL.Path[len("/users/"):]
    id, err := strconv.Atoi(idStr)
    if err != nil {
        errorResponse(w, http.StatusBadRequest, "無効なユーザーID")
        return
    }

    // ユーザー検索
    user, exists := users[id]
    if !exists {
        errorResponse(w, http.StatusNotFound, "ユーザーが見つかりません")
        return
    }

    // 正常レスポンス
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(user)
}

// `/error500` ハンドラ (内部サーバーエラーのシミュレーション)
func internalErrorHandler(w http.ResponseWriter, r *http.Request) {
    errorResponse(w, http.StatusInternalServerError, "サーバー内部エラーが発生しました")
}

func main() {
    http.HandleFunc("/users/", userHandler)          // ユーザー取得 (ID付き)
    http.HandleFunc("/error500", internalErrorHandler) // 500エラーのシミュレーション

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

## **2. 実行方法**

```sh
go run main.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

## **3. 動作確認**

### **(1) 存在するユーザーの取得**

```sh
curl -X GET http://localhost:8080/users/1
```

**レスポンス (200 OK)**

```json
{"id":1,"name":"Alice"}
```

### **(2) 存在しないユーザーの取得**

```sh
curl -X GET http://localhost:8080/users/99
```

**レスポンス (404 Not Found)**

```json
{
  "error": "Not Found",
  "message": "ユーザーが見つかりません"
}
```

### **(3) 無効なIDの指定**

```sh
curl -X GET http://localhost:8080/users/abc
```

**レスポンス (400 Bad Request)**

```json
{
  "error": "Bad Request",
  "message": "無効なユーザーID"
}
```

### **(4) `POST` でリクエスト**

```sh
curl -X POST http://localhost:8080/users/1
```

**レスポンス (405 Method Not Allowed)**
```json
{
  "error": "Method Not Allowed",
  "message": "このエンドポイントは GET のみ対応しています"
}
```

### **(5) 内部サーバーエラーのシミュレーション**

```sh
curl -X GET http://localhost:8080/error500
```

**レスポンス (500 Internal Server Error)**

```json
{
  "error": "Internal Server Error",
  "message": "サーバー内部エラーが発生しました"
}
```

## **4. コードのポイント**

1. **`errorResponse()` を汎用エラーハンドラとして作成**
   - JSON 形式でエラーメッセージを返す
   - `w.WriteHeader(statusCode)` で **適切な HTTP ステータスコードを設定**
   - `json.NewEncoder(w).Encode(ErrorResponse{})` で JSON レスポンスを返す

2. **エラーハンドリングを強化**
   - **`400 Bad Request`** → IDが数値でない場合
   - **`404 Not Found`** → 指定した ID のユーザーが存在しない場合
   - **`405 Method Not Allowed`** → `GET` 以外のメソッドが使われた場合
   - **`500 Internal Server Error`** → サーバー側のエラーをシミュレート
