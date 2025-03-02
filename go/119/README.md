# No.119

Goの `flag` パッケージを使った簡単なCLIツールを作成する。

### **1. `greet.go` (CLIツールのコード)**

```go
package main

import (
    "flag"
    "fmt"
)

func main() {
    // コマンドライン引数の定義
    name := flag.String("name", "World", "挨拶する名前を指定")
    lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
    flag.Parse()

    // 挨拶文の設定
    var greeting string
    switch *lang {
    case "ja":
        greeting = fmt.Sprintf("こんにちは、%sさん！", *name)
    case "es":
        greeting = fmt.Sprintf("¡Hola, %s!", *name)
    default:
        greeting = fmt.Sprintf("Hello, %s!", *name)
    }

    fmt.Println(greeting)
}
```

### **2. 実行方法**

ターミナルで以下のように実行できます。

#### **デフォルト（引数なし）**

```sh
go run greet.go
```

**出力**

```
Hello, World!
```

#### **`-name` を指定**

```sh
go run greet.go -name=Alice
```

**出力**

```
Hello, Alice!
```

#### **`-name` と `-lang` を指定**

```sh
go run greet.go -name=Taro -lang=ja
```

**出力**

```
こんにちは、Taroさん！
```

```sh
go run greet.go -name=Pedro -lang=es
```

**出力**

```
¡Hola, Pedro!
```

### **3. `greet_test.go` (テストコード)**

`flag` パッケージを使ったCLIツールのテストでは、 `flag.CommandLine` をリセットしてからテストを実行します。

```go
package main

import (
    "flag"
    "fmt"
    "os"
    "testing"
)

func TestGreet(t *testing.T) {
    tests := []struct {
        args     []string
        expected string
    }{
        {[]string{"-name=Alice", "-lang=en"}, "Hello, Alice!"},
        {[]string{"-name=Taro", "-lang=ja"}, "こんにちは、Taroさん！"},
        {[]string{"-name=Pedro", "-lang=es"}, "¡Hola, Pedro!"},
    }

    for _, tt := range tests {
        flag.CommandLine = flag.NewFlagSet(os.Args[0], flag.ExitOnError)
        name := flag.String("name", "World", "挨拶する名前を指定")
        lang := flag.String("lang", "en", "使用する言語 (en, ja, es)")
        flag.CommandLine.Parse(tt.args)

        var greeting string
        switch *lang {
        case "ja":
            greeting = fmt.Sprintf("こんにちは、%sさん！", *name)
        case "es":
            greeting = fmt.Sprintf("¡Hola, %s!", *name)
        default:
            greeting = fmt.Sprintf("Hello, %s!", *name)
        }

        if greeting != tt.expected {
            t.Errorf("got %q, want %q", greeting, tt.expected)
        }
    }
}
```

### **4. テスト実行**

```sh
go test ./...
```

**成功例**

```
ok  	myproject	0.226s
```
