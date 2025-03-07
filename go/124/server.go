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
