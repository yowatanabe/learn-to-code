package main

import (
	"encoding/json"
	"testing"
)

func TestJSONEncoding(t *testing.T) {
    user := User{ID: 1, Name: "Alice", Email: "alice@example.com"}
    jsonData, err := json.Marshal(user)
    if err != nil {
        t.Fatalf("JSONエンコードエラー: %v", err)
    }

    expected := `{"id":1,"name":"Alice","email":"alice@example.com"}`
    if string(jsonData) != expected {
        t.Errorf("エンコード結果が違う: got %s, want %s", jsonData, expected)
    }
}

func TestJSONDecoding(t *testing.T) {
    jsonStr := `{"id":2,"name":"Bob","email":"bob@example.com"}`
    var user User
    err := json.Unmarshal([]byte(jsonStr), &user)
    if err != nil {
        t.Fatalf("JSONデコードエラー: %v", err)
    }

    expected := User{ID: 2, Name: "Bob", Email: "bob@example.com"}
    if user != expected {
        t.Errorf("デコード結果が違う: got %+v, want %+v", user, expected)
    }
}
