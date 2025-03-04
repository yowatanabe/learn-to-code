package main

import (
	"fmt"
	"net/http"
)

// ハンドラ関数
func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, World!")
}

func main() {
    http.HandleFunc("/", helloHandler) // ルートパスにハンドラを登録
    fmt.Println("サーバーをポート8080で起動中...")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        fmt.Println("サーバーエラー:", err)
    }
}
