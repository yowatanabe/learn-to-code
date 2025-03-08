package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

// User 構造体
type User struct {
    ID    int
    Name  string
    Email string
}

func main() {
    // MySQL 接続情報
    dsn := "root:password@tcp(127.0.0.1:3306)/go_test?parseTime=true"
    db, err := sql.Open("mysql", dsn)
    if err != nil {
        log.Fatal("DB接続エラー:", err)
    }
    defer db.Close()

    // データを挿入
    insertUser(db, "Alice", "alice@example.com")
    insertUser(db, "Bob", "bob@example.com")

    // データを取得
    users, err := getUsers(db)
    if err != nil {
        log.Fatal("データ取得エラー:", err)
    }

    fmt.Println("取得したユーザー一覧:")
    for _, user := range users {
        fmt.Printf("ID: %d, Name: %s, Email: %s\n", user.ID, user.Name, user.Email)
    }
}

// ユーザーを追加
func insertUser(db *sql.DB, name, email string) {
    query := "INSERT INTO users (name, email) VALUES (?, ?)"
    _, err := db.Exec(query, name, email)
    if err != nil {
        log.Fatal("INSERTエラー:", err)
    }
    fmt.Println("ユーザー追加:", name)
}

// ユーザー一覧を取得
func getUsers(db *sql.DB) ([]User, error) {
    query := "SELECT id, name, email FROM users"
    rows, err := db.Query(query)
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    var users []User
    for rows.Next() {
        var user User
        if err := rows.Scan(&user.ID, &user.Name, &user.Email); err != nil {
            return nil, err
        }
        users = append(users, user)
    }
    return users, nil
}
