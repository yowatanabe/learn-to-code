# No.117

Goで構造体をJSONにエンコード・デコードする

### **1. `json_example.go` (構造体のJSONエンコード・デコード)**

```go
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
```

### **2. 実行**

```sh
go run json_example.go
```

**出力結果**

```
JSONエンコード: {"id":1,"name":"Alice","email":"alice@example.com"}
JSONデコード: {ID:2 Name:Bob Email:bob@example.com}
```

### **3. `json_example_test.go` (テストコード)**

テストファイルを作成して `json.Marshal` と `json.Unmarshal` の動作を確認。

```go
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
```

### **4. テスト実行**

```sh
go test ./...
```

*成功例**

```
ok  	myproject	0.243s
```
