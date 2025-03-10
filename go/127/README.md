# No.127

Go の `net/http` を使用してセッション管理を行い、ログイン後に Cookie をセットする簡単な Web アプリのサンプルコード。

## **1. `main.go`（ログイン時に Cookie をセットする Web アプリ）**

```go
package main

import (
    "fmt"
    "net/http"
    "time"
)

// ダミーユーザー情報
var users = map[string]string{
    "admin": "password123",
}

// ログインハンドラ（ユーザー認証 & Cookie 設定）
func loginHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
        return
    }

    username := r.FormValue("username")
    password := r.FormValue("password")

    // 認証チェック
    if users[username] != password {
        http.Error(w, "認証失敗", http.StatusUnauthorized)
        return
    }

    // Cookie をセット
    expiration := time.Now().Add(1 * time.Hour)
    cookie := http.Cookie{
        Name:    "session_token",
        Value:   "random-session-id", // 本番環境ではランダムなトークンを生成
        Expires: expiration,
        Path:    "/",
    }
    http.SetCookie(w, &cookie)

    fmt.Fprintf(w, "ログイン成功: %s", username)
}

// ログアウトハンドラ（Cookie の削除）
func logoutHandler(w http.ResponseWriter, r *http.Request) {
    cookie := http.Cookie{
        Name:    "session_token",
        Value:   "",
        Expires: time.Now().Add(-1 * time.Hour),
        Path:    "/",
    }
    http.SetCookie(w, &cookie)
    fmt.Fprintln(w, "ログアウトしました")
}

// 認証チェックミドルウェア
func authMiddleware(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        cookie, err := r.Cookie("session_token")
        if err != nil || cookie.Value == "" {
            http.Error(w, "認証が必要です", http.StatusUnauthorized)
            return
        }
        next(w, r)
    }
}

// プロフィールページ（認証が必要）
func profileHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "ようこそ！認証済みのユーザーです。")
}

func main() {
    http.HandleFunc("/login", loginHandler)
    http.HandleFunc("/logout", logoutHandler)
    http.HandleFunc("/profile", authMiddleware(profileHandler))

    fmt.Println("サーバーをポート8080で起動中...")
    http.ListenAndServe(":8080", nil)
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

### **(1) ログイン**

```sh
curl -X POST http://localhost:8080/login -d "username=admin&password=password123" -c cookies.txt
```

**レスポンス**

```
ログイン成功: admin
```

**Cookie (`cookies.txt`) に `session_token` が保存される**

### **(2) Cookie を送信して認証ページにアクセス**

```sh
curl -X GET http://localhost:8080/profile -b cookies.txt
```

**レスポンス**

```
ようこそ！認証済みのユーザーです。
```

### **(3) ログアウト**

```sh
curl -X GET http://localhost:8080/logout -b cookies.txt -c cookies.txt
```

**レスポンス**

```
ログアウトしました
```

### **(4) 再度 `/profile` にアクセス（認証エラーになる）**

```sh
curl -X GET http://localhost:8080/profile -b cookies.txt
```

**レスポンス**

```
認証が必要です
```

## **4. コードのポイント**

- `loginHandler()`
  - **ユーザー認証後、Cookie をセット** (`session_token`)
  - **1時間後に期限切れ** (`Expires: time.Now().Add(1 * time.Hour)`)

- `logoutHandler()`
  - **Cookie を削除してログアウト**

- `authMiddleware()`
  - **Cookie をチェックし、認証が必要なページを保護**

- `profileHandler()`
  - **認証後のみアクセス可能なページ**
