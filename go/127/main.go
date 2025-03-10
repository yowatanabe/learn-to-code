package main

import (
	"fmt"
	"net/http"
	"time"
)

// ダミーユーザー情報
var users = map[string]string{
    "admin": "password123",
}

// ログインハンドラ（ユーザー認証 & Cookie 設定）
func loginHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "無効なメソッド", http.StatusMethodNotAllowed)
        return
    }

    username := r.FormValue("username")
    password := r.FormValue("password")

    // 認証チェック
    if users[username] != password {
        http.Error(w, "認証失敗", http.StatusUnauthorized)
        return
    }

    // Cookie をセット
    expiration := time.Now().Add(1 * time.Hour)
    cookie := http.Cookie{
        Name:    "session_token",
        Value:   "random-session-id", // 本番環境ではランダムなトークンを生成
        Expires: expiration,
        Path:    "/",
    }
    http.SetCookie(w, &cookie)

    fmt.Fprintf(w, "ログイン成功: %s", username)
}

// ログアウトハンドラ（Cookie の削除）
func logoutHandler(w http.ResponseWriter, r *http.Request) {
    cookie := http.Cookie{
        Name:    "session_token",
        Value:   "",
        Expires: time.Now().Add(-1 * time.Hour),
        Path:    "/",
    }
    http.SetCookie(w, &cookie)
    fmt.Fprintln(w, "ログアウトしました")
}

// 認証チェックミドルウェア
func authMiddleware(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        cookie, err := r.Cookie("session_token")
        if err != nil || cookie.Value == "" {
            http.Error(w, "認証が必要です", http.StatusUnauthorized)
            return
        }
        next(w, r)
    }
}

// プロフィールページ（認証が必要）
func profileHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "ようこそ！認証済みのユーザーです。")
}

func main() {
    http.HandleFunc("/login", loginHandler)
    http.HandleFunc("/logout", logoutHandler)
    http.HandleFunc("/profile", authMiddleware(profileHandler))

    fmt.Println("サーバーをポート8080で起動中...")
    http.ListenAndServe(":8080", nil)
}
