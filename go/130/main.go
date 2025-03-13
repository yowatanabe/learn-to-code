package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"sync"
	"time"
)

// User ログイン用のユーザ情報
type User struct {
    Username string `json:"username"`
    Password string `json:"password"`
}

// 簡易的な「データストア」
var (
    // tasks: タスクを (ID -> タスク名) で保持
    tasks   = make(map[int]string)
    tasksMu sync.Mutex // マルチスレッド対応のため排他制御
    taskID  = 1

    // シングルユーザ認証用 (admin / password)
    user = User{Username: "admin", Password: "password"}
)

// authMiddleware は Cookie を確認し、未ログインなら 401 を返す
func authMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        cookie, err := r.Cookie("session_id")
        if err != nil || cookie.Value != "logged_in" {
            http.Error(w, "Unauthorized", http.StatusUnauthorized)
            return
        }
        // ログイン済みなら次のハンドラへ
        next.ServeHTTP(w, r)
    })
}

// loginHandler はログイン処理を行う (POST /login)
func loginHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    var input User
    if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
        http.Error(w, "Bad request", http.StatusBadRequest)
        return
    }

    // ユーザ名 & パスワードチェック
    if input.Username == user.Username && input.Password == user.Password {
        // Cookie 発行 (1時間で有効期限切れ)
        http.SetCookie(w, &http.Cookie{
            Name:    "session_id",
            Value:   "logged_in",
            Expires: time.Now().Add(1 * time.Hour),
        })
        w.WriteHeader(http.StatusOK)
        w.Write([]byte("Login successful"))
    } else {
        http.Error(w, "Invalid credentials", http.StatusUnauthorized)
    }
}

// logoutHandler はログアウト処理を行う (POST /logout)
func logoutHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }
    // Cookie を無効化 (有効期限を過去にする)
    http.SetCookie(w, &http.Cookie{
        Name:    "session_id",
        Value:   "",
        Expires: time.Unix(0, 0),
    })
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Logged out"))
}

// createTaskHandler はタスク作成 (POST /tasks/create)
func createTaskHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    var input struct {
        Name string `json:"name"`
    }
    if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
        http.Error(w, "Bad request", http.StatusBadRequest)
        return
    }

    tasksMu.Lock()
    id := taskID
    tasks[id] = input.Name
    taskID++
    tasksMu.Unlock()

    w.WriteHeader(http.StatusCreated)
    fmt.Fprintf(w, `{"id":%d,"name":"%s"}`, id, input.Name)
}

// getTasksHandler はタスク一覧取得 (GET /tasks)
func getTasksHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodGet {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    tasksMu.Lock()
    defer tasksMu.Unlock()

    type Task struct {
        ID   int    `json:"id"`
        Name string `json:"name"`
    }
    var taskList []Task
    for k, v := range tasks {
        taskList = append(taskList, Task{ID: k, Name: v})
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(taskList)
}

// getTaskHandler は指定 ID のタスク取得 (GET /tasks/get?id=xxx)
func getTaskHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodGet {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    idStr := r.URL.Query().Get("id")
    if idStr == "" {
        http.Error(w, "Missing id query parameter", http.StatusBadRequest)
        return
    }
    id, err := strconv.Atoi(idStr)
    if err != nil {
        http.Error(w, "Invalid id", http.StatusBadRequest)
        return
    }

    tasksMu.Lock()
    defer tasksMu.Unlock()

    name, ok := tasks[id]
    if !ok {
        http.Error(w, "Task not found", http.StatusNotFound)
        return
    }

    fmt.Fprintf(w, `{"id":%d,"name":"%s"}`, id, name)
}

// updateTaskHandler は指定 ID のタスクを更新 (PUT /tasks/update?id=xxx)
func updateTaskHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPut {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    idStr := r.URL.Query().Get("id")
    if idStr == "" {
        http.Error(w, "Missing id query parameter", http.StatusBadRequest)
        return
    }
    id, err := strconv.Atoi(idStr)
    if err != nil {
        http.Error(w, "Invalid id", http.StatusBadRequest)
        return
    }

    var input struct {
        Name string `json:"name"`
    }
    if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
        http.Error(w, "Bad request", http.StatusBadRequest)
        return
    }

    tasksMu.Lock()
    defer tasksMu.Unlock()

    if _, ok := tasks[id]; !ok {
        http.Error(w, "Task not found", http.StatusNotFound)
        return
    }
    tasks[id] = input.Name

    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, `{"id":%d,"name":"%s"}`, id, input.Name)
}

// deleteTaskHandler は指定 ID のタスクを削除 (DELETE /tasks/delete?id=xxx)
func deleteTaskHandler(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodDelete {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    idStr := r.URL.Query().Get("id")
    if idStr == "" {
        http.Error(w, "Missing id query parameter", http.StatusBadRequest)
        return
    }
    id, err := strconv.Atoi(idStr)
    if err != nil {
        http.Error(w, "Invalid id", http.StatusBadRequest)
        return
    }

    tasksMu.Lock()
    defer tasksMu.Unlock()

    if _, ok := tasks[id]; !ok {
        http.Error(w, "Task not found", http.StatusNotFound)
        return
    }
    delete(tasks, id)

    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Task deleted"))
}

func main() {
    mux := http.NewServeMux()

    // --- ログイン/ログアウト (認証不要) ---
    mux.HandleFunc("/login", loginHandler)
    mux.HandleFunc("/logout", logoutHandler)

    // --- タスク管理 (認証必須) ---
    mux.Handle("/tasks", authMiddleware(http.HandlerFunc(getTasksHandler)))
    mux.Handle("/tasks/create", authMiddleware(http.HandlerFunc(createTaskHandler)))
    mux.Handle("/tasks/get", authMiddleware(http.HandlerFunc(getTaskHandler)))
    mux.Handle("/tasks/update", authMiddleware(http.HandlerFunc(updateTaskHandler)))
    mux.Handle("/tasks/delete", authMiddleware(http.HandlerFunc(deleteTaskHandler)))

    log.Println("Starting server on :8080")
    if err := http.ListenAndServe(":8080", mux); err != nil {
        log.Fatal(err)
    }
}
