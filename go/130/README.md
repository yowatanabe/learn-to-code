# No.130

Go 標準ライブラリのみで実装したシンプルな Web アプリケーションを作成する

- **機能概要**
  - ログイン機能（Cookie を使ったセッション管理）
  - 簡易的なタスク管理の CRUD
  - 単体テスト例

---

## `main.go`

```go
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
```

## `main_test.go`

```go
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
```

## 実行方法

1. **依存関係の初期化・整理**

   ```bash
   go mod init myapp
   go mod tidy
   ```

2. **ビルド & 実行**

   ```bash
   go build -o app
   ./app
   ```

   もしくは

   ```bash
   go run .
   ```

   で起動し、`http://localhost:8080` で待ち受けます。

3. **テスト実行**

   ```bash
   go test -v
   ```

## 動作確認例

1. **ログイン**

   ```bash
   curl -X POST -H "Content-Type: application/json" \
     -d '{"username":"admin","password":"password"}' \
     -c cookies.txt \
     http://localhost:8080/login
   ```

   - 成功すると `cookies.txt` にセッション Cookie が保存される。

2. **タスク作成** (認証必須)

   ```bash
   curl -X POST -H "Content-Type: application/json" \
     -d '{"name":"Buy milk"}' \
     -b cookies.txt \
     http://localhost:8080/tasks/create
   ```

   - `cookies.txt` を利用して、ログイン済みの Cookie を送信している。

3. **タスク一覧取得**

   ```bash
   curl -X GET -b cookies.txt http://localhost:8080/tasks
   ```

   - タスク一覧が JSON で返却される。

4. **タスク更新** (PUT)

   ```bash
   curl -X PUT -H "Content-Type: application/json" \
     -d '{"name":"Buy coffee"}' \
     -b cookies.txt \
     "http://localhost:8080/tasks/update?id=1"
   ```

5. **タスク削除** (DELETE)

   ```bash
   curl -X DELETE -b cookies.txt \
     "http://localhost:8080/tasks/delete?id=1"
   ```

6. **ログアウト**

   ```bash
   curl -X POST -b cookies.txt http://localhost:8080/logout
   ```

### ポイントまとめ

- **`net/http` の標準機能を使い、シンプルに実装**
- **Cookie によるログイン管理**
- **タスク管理の CRUD** では `GET/POST/PUT/DELETE` + Query パラメータを使って最小限の実装
- **`httptest.NewServer`** を使った単体テスト例
