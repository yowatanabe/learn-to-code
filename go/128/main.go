package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
)

// エラーレスポンス用の構造体
type ErrorResponse struct {
    Error   string `json:"error"`
    Message string `json:"message"`
}

// ユーザー情報の構造体
type User struct {
    ID   int    `json:"id"`
    Name string `json:"name"`
}

var users = map[int]User{
    1: {ID: 1, Name: "Alice"},
    2: {ID: 2, Name: "Bob"},
}

// 汎用エラーレスポンス関数
func errorResponse(w http.ResponseWriter, statusCode int, errMsg string) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(statusCode)
    json.NewEncoder(w).Encode(ErrorResponse{
        Error:   http.StatusText(statusCode),
        Message: errMsg,
    })
}

// `/users/{id}` ハンドラ (エラーハンドリング付き)
func userHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodGet {
        errorResponse(w, http.StatusMethodNotAllowed, "このエンドポイントは GET のみ対応しています")
        return
    }

    // ID取得
    idStr := r.URL.Path[len("/users/"):]
    id, err := strconv.Atoi(idStr)
    if err != nil {
        errorResponse(w, http.StatusBadRequest, "無効なユーザーID")
        return
    }

    // ユーザー検索
    user, exists := users[id]
    if !exists {
        errorResponse(w, http.StatusNotFound, "ユーザーが見つかりません")
        return
    }

    // 正常レスポンス
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(user)
}

// `/error500` ハンドラ (内部サーバーエラーのシミュレーション)
func internalErrorHandler(w http.ResponseWriter, r *http.Request) {
    errorResponse(w, http.StatusInternalServerError, "サーバー内部エラーが発生しました")
}

func main() {
    http.HandleFunc("/users/", userHandler)          // ユーザー取得 (ID付き)
    http.HandleFunc("/error500", internalErrorHandler) // 500エラーのシミュレーション

    fmt.Println("サーバーをポート8080で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
