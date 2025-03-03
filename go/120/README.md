# No.120

Goのプロジェクト構成とパッケージ分割のベストプラクティスを学ぶ。

## **1. プロジェクト構成**

Goの一般的なプロジェクト構成に従い、以下のようにディレクトリを整理します。

```
.
├── cmd/
│   ├── greet/
│   │   ├── main.go
├── pkg/
│   ├── greet/
│   │   ├── greet.go
│   │   ├── greet_test.go
├── go.mod
├── README.md
```

- `cmd/` … メインのエントリポイント（CLIツールの起点）
- `pkg/` … 再利用可能なロジック（`greet` パッケージ）
- `go.mod` … Goモジュール管理ファイル

## **2. `pkg/greet/greet.go`（機能を持つパッケージ）**

```go
package greet

import "fmt"

// Greet は指定した名前と言語で挨拶を生成する
func Greet(name, lang string) string {
    switch lang {
    case "ja":
        return fmt.Sprintf("こんにちは、%sさん！", name)
    case "es":
        return fmt.Sprintf("¡Hola, %s!", name)
    default:
        return fmt.Sprintf("Hello, %s!", name)
    }
}
```

## **3. `pkg/greet/greet_test.go`（テストコード）**

```go
package greet

import "testing"

func TestGreet(t *testing.T) {
    tests := []struct {
        name, lang, want string
    }{
        {"Alice", "en", "Hello, Alice!"},
        {"Taro", "ja", "こんにちは、Taroさん！"},
        {"Pedro", "es", "¡Hola, Pedro!"},
    }

    for _, tt := range tests {
        got := Greet(tt.name, tt.lang)
        if got != tt.want {
            t.Errorf("Greet(%q, %q) = %q; want %q", tt.name, tt.lang, got, tt.want)
        }
    }
}
```

## **4. `cmd/greet/main.go`（CLIのエントリポイント）**

```go
package main

import (
    "flag"
    "fmt"
    "myproject/pkg/greet"
)

func main() {
    name := flag.String("name", "World", "挨拶する名前を指定")
    lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
    flag.Parse()

    fmt.Println(greet.Greet(*name, *lang))
}
```

## **5. 実行方法**

### **① モジュールの初期化**

```sh
go mod init myproject
go mod tidy
```

### **② CLIツールの実行**

```sh
go run cmd/greet/main.go -name=Taro -lang=ja
```

**出力**

```
こんにちは、Taroさん！
```

### **③ テストの実行**

```sh
go test ./...
```

**成功例**

```
ok  	myproject/pkg/greet	0.182s
```
