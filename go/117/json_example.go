package main

import (
	"encoding/json"
	"fmt"
	"log"
)

// User はJSONの変換対象となる構造体
type User struct {
    ID    int    `json:"id"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

func main() {
    // 1. 構造体をJSONにエンコード
    user := User{ID: 1, Name: "Alice", Email: "alice@example.com"}
    jsonData, err := json.Marshal(user) // JSONエンコード
    if err != nil {
        log.Fatalf("JSONエンコードエラー: %v", err)
    }
    fmt.Println("JSONエンコード:", string(jsonData))

    // 2. JSONを構造体にデコード
    jsonStr := `{"id":2,"name":"Bob","email":"bob@example.com"}`
    var decodedUser User
    err = json.Unmarshal([]byte(jsonStr), &decodedUser) // JSONデコード
    if err != nil {
        log.Fatalf("JSONデコードエラー: %v", err)
    }
    fmt.Printf("JSONデコード: %+v\n", decodedUser)
}
