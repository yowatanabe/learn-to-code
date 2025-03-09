package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

// User モデル
type User struct {
    ID    uint   `json:"id" gorm:"primaryKey"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

var db *gorm.DB

func main() {
    var err error
    db, err = gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
    if err != nil {
        log.Fatal("DB接続エラー:", err)
    }

    // テーブル作成
    db.AutoMigrate(&User{})

    // ルーティング
    http.HandleFunc("/users", handleUsers)
    http.HandleFunc("/users/", handleUserByID)

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}

// `/users` の GET (全件取得) と POST (新規作成) を処理
func handleUsers(w http.ResponseWriter, r *http.Request) {
    switch r.Method {
    case "GET":
        var users []User
        db.Find(&users)
        jsonResponse(w, users, http.StatusOK)

    case "POST":
        var user User
        if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
            http.Error(w, "無効なJSON", http.StatusBadRequest)
            return
        }
        db.Create(&user)
        jsonResponse(w, user, http.StatusCreated)

    default:
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
    }
}

// `/users/{id}` の GET, PUT, DELETE を処理
func handleUserByID(w http.ResponseWriter, r *http.Request) {
    id := r.URL.Path[len("/users/"):]
    var user User

    switch r.Method {
    case "GET":
        if err := db.First(&user, id).Error; err != nil {
            http.Error(w, "ユーザーが見つかりません", http.StatusNotFound)
            return
        }
        jsonResponse(w, user, http.StatusOK)

    case "PUT":
        if err := db.First(&user, id).Error; err != nil {
            http.Error(w, "ユーザーが見つかりません", http.StatusNotFound)
            return
        }
        if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
            http.Error(w, "無効なJSON", http.StatusBadRequest)
            return
        }
        db.Save(&user)
        jsonResponse(w, user, http.StatusOK)

    case "DELETE":
        if err := db.Delete(&User{}, id).Error; err != nil {
            http.Error(w, "削除エラー", http.StatusInternalServerError)
            return
        }
        jsonResponse(w, map[string]string{"message": "削除成功"}, http.StatusOK)

    default:
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
    }
}

// JSONレスポンスのヘルパー関数
func jsonResponse(w http.ResponseWriter, data interface{}, status int) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(status)
    json.NewEncoder(w).Encode(data)
}
