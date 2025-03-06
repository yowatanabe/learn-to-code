package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

// User 構造体 (JSONデータ用)
type User struct {
    ID    int    `json:"id"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

// ダミーデータ
var users = []User{
    {ID: 1, Name: "Alice", Email: "alice@example.com"},
    {ID: 2, Name: "Bob", Email: "bob@example.com"},
}

// GET: ユーザー一覧を取得
func getUsersHandler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(users)
}

// POST: ユーザーを追加
func createUserHandler(w http.ResponseWriter, r *http.Request) {
    var newUser User
    err := json.NewDecoder(r.Body).Decode(&newUser)
    if err != nil {
        http.Error(w, "無効なJSONデータ", http.StatusBadRequest)
        return
    }

    newUser.ID = len(users) + 1
    users = append(users, newUser)

    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusCreated)
    json.NewEncoder(w).Encode(newUser)
}

func main() {
    http.HandleFunc("/users", func(w http.ResponseWriter, r *http.Request) {
        switch r.Method {
        case "GET":
            getUsersHandler(w, r)
        case "POST":
            createUserHandler(w, r)
        default:
            http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
        }
    })

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
