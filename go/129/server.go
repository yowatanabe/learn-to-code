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
