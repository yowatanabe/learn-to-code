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
