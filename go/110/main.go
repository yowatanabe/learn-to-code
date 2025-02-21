package main

import (
	"fmt"
	"log"
	"net/http"
)

// ハンドラー関数 (ルートパス "/")
func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World! This is a Go HTTP server.")
}

// ハンドラー関数 (カスタムパス "/status")
func statusHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `{"status": "OK"}`)
}

func main() {
	// ルーティングの設定
	http.HandleFunc("/", helloHandler)
	http.HandleFunc("/status", statusHandler)

	// サーバーの起動
	port := 8080
	fmt.Printf("Starting server at http://localhost:%d/\n", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}
