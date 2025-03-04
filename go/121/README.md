# No.121

`net/http` を使って簡単な **Hello World サーバー** を作成する。

### **1. `server.go`（HTTPサーバー）**

```go
package main

import (
    "fmt"
    "net/http"
)

// ハンドラ関数
func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, World!")
}

func main() {
    http.HandleFunc("/", helloHandler) // ルートパスにハンドラを登録
    fmt.Println("サーバーをポート8080で起動中...")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        fmt.Println("サーバーエラー:", err)
    }
}
```

### **2. 実行方法**

ターミナルで以下を実行：

```sh
go run server.go
```

**成功すると表示**

```
サーバーをポート8080で起動中...
```

### **3. 動作確認**

ブラウザまたは `curl` でアクセス：

```sh
curl http://localhost:8080
```

**出力**

```
Hello, World!
```
