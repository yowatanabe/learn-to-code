# No.121

Goの `net/http` と `gorilla/mux` を使用したルーティング付きWebサーバーを作成する。

### **1. `server.go`（ルーティング付きWebサーバー）**

```go
package main

import (
    "fmt"
    "net/http"

    "github.com/gorilla/mux"
)

// ルートハンドラ
func homeHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Welcome to the Home Page!")
}

// ユーザーハンドラ
func userHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r) // URLパラメータ取得
    userID := vars["id"]
    fmt.Fprintf(w, "User ID: %s\n", userID)
}

// ヘルスチェック用ハンドラ
func healthHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "OK")
}

func main() {
    r := mux.NewRouter()
    r.HandleFunc("/", homeHandler).Methods("GET")        // ホームページ
    r.HandleFunc("/user/{id}", userHandler).Methods("GET") // ユーザー詳細
    r.HandleFunc("/health", healthHandler).Methods("GET")  // ヘルスチェック

    fmt.Println("サーバーをポート8080で起動中...")
    if err := http.ListenAndServe(":8080", r); err != nil {
        fmt.Println("サーバーエラー:", err)
    }
}
```

### **2. インストール & 実行**

#### **(1) `gorilla/mux` をインストール**

`gorilla/mux` は、Goの人気ルーティングライブラリです。

```sh
go get -u github.com/gorilla/mux
```

#### **(2) サーバーを実行**

```sh
go run server.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

### **3. 動作確認**

#### **(1) ホームページ**

```sh
curl http://localhost:8080/
```

**出力**

```
Welcome to the Home Page!
```

#### **(2) ユーザーページ**

```sh
curl http://localhost:8080/user/123
```

**出力**

```
User ID: 123
```

#### **(3) ヘルスチェック**

```sh
curl http://localhost:8080/health
```

**出力**

```
OK
```
