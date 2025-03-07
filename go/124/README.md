# No.124

Go の `net/http` を使ってリクエストの前後でログを出力する

## **1. `server.go`（ミドルウェア付きのHTTPサーバー）**

```go
package main

import (
    "fmt"
    "log"
    "net/http"
    "time"
)

// ログ出力ミドルウェア
func loggingMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        start := time.Now()
        log.Printf("リクエスト開始: %s %s", r.Method, r.URL.Path)

        next.ServeHTTP(w, r) // 次のハンドラを実行

        duration := time.Since(start)
        log.Printf("リクエスト終了: %s %s, 処理時間: %v", r.Method, r.URL.Path, duration)
    })
}

// シンプルなハンドラ
func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, Middleware!")
}

func main() {
    mux := http.NewServeMux()
    mux.HandleFunc("/", helloHandler)

    // ミドルウェアを適用
    loggedMux := loggingMiddleware(mux)

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", loggedMux))
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

### **(1) ブラウザまたは `curl` でリクエスト**

```sh
curl http://localhost:8080/
```

**レスポンス**

```
Hello, Middleware!
```

**ログ出力**

```
2025/03/08 05:05:31 リクエスト開始: GET /
2025/03/08 05:05:31 リクエスト終了: GET /, 処理時間: 142.792µs
```

## **4. コードのポイント**

- `loggingMiddleware(next http.Handler)` で **リクエストの前後でログを出力**
- `next.ServeHTTP(w, r)` で **次のハンドラを実行**
- `time.Since(start)` で **処理時間を計測**
