package main

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

// TestLogin はログインをテストします。
func TestLogin(t *testing.T) {
    // ハンドラだけをテスト用にサーバとして立ち上げる
    mux := http.NewServeMux()
    mux.HandleFunc("/login", loginHandler)
    srv := httptest.NewServer(mux)
    defer srv.Close()

    // 正しいログイン情報
    creds := User{Username: "admin", Password: "password"}
    body, _ := json.Marshal(creds)
    resp, err := http.Post(srv.URL+"/login", "application/json", bytes.NewBuffer(body))
    if err != nil {
        t.Fatalf("failed to send request: %v", err)
    }
    if resp.StatusCode != http.StatusOK {
        t.Errorf("expected 200, got %d", resp.StatusCode)
    }

    // 誤ったログイン情報
    creds = User{Username: "admin", Password: "wrong"}
    body, _ = json.Marshal(creds)
    resp, err = http.Post(srv.URL+"/login", "application/json", bytes.NewBuffer(body))
    if err != nil {
        t.Fatalf("failed to send request: %v", err)
    }
    if resp.StatusCode != http.StatusUnauthorized {
        t.Errorf("expected 401, got %d", resp.StatusCode)
    }
}

// TestGetTasksNoAuth は認証なしでタスク一覧を取得しようとして 401 になることをテスト
func TestGetTasksNoAuth(t *testing.T) {
    mux := http.NewServeMux()
    mux.Handle("/tasks", authMiddleware(http.HandlerFunc(getTasksHandler)))
    srv := httptest.NewServer(mux)
    defer srv.Close()

    // 認証 Cookie を付与しない
    resp, err := http.Get(srv.URL + "/tasks")
    if err != nil {
        t.Fatalf("failed to send request: %v", err)
    }
    if resp.StatusCode != http.StatusUnauthorized {
        t.Errorf("expected 401, got %d", resp.StatusCode)
    }
}

// TestGetTasksWithAuth は認証済みでタスク一覧取得すると 200 が返ることをテスト
func TestGetTasksWithAuth(t *testing.T) {
    mux := http.NewServeMux()
    mux.Handle("/tasks", authMiddleware(http.HandlerFunc(getTasksHandler)))
    srv := httptest.NewServer(mux)
    defer srv.Close()

    // session_id="logged_in" を付与 (簡易的)
    client := &http.Client{}
    req, _ := http.NewRequest("GET", srv.URL+"/tasks", nil)
    req.AddCookie(&http.Cookie{
        Name:  "session_id",
        Value: "logged_in",
    })
    resp, err := client.Do(req)
    if err != nil {
        t.Fatalf("failed to send request: %v", err)
    }
    if resp.StatusCode != http.StatusOK {
        t.Errorf("expected 200, got %d", resp.StatusCode)
    }
}
