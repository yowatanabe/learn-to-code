# No.116

Goの標準ライブラリ (`os`, `bufio`) を使ってファイルを読み取り、行数をカウントするプログラムを学ぶ。

### **1. `linecount.go` (ファイルの行数をカウントするプログラム)**

```go
package main

import (
    "bufio"
    "fmt"
    "os"
)

// CountLines は指定されたファイルの行数をカウントする
func CountLines(filename string) (int, error) {
    file, err := os.Open(filename)
    if err != nil {
        return 0, err
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    lineCount := 0
    for scanner.Scan() {
        lineCount++
    }

    if err := scanner.Err(); err != nil {
        return 0, err
    }
    return lineCount, nil
}

func main() {
    if len(os.Args) < 2 {
        fmt.Println("使用法: go run linecount.go <ファイル名>")
        os.Exit(1)
    }

    filename := os.Args[1]
    count, err := CountLines(filename)
    if err != nil {
        fmt.Printf("エラー: %v\n", err)
        os.Exit(1)
    }

    fmt.Printf("ファイル '%s' の行数: %d\n", filename, count)
}
```

### **2. 実行方法**

#### **(1) テスト用のファイルを作成**

まず、テスト用の `test.txt` を作成。

ファイルの中身：

```
Hello, World!
This is a test.
Go is awesome!
```

#### **(2) コードを実行**

```sh
go run linecount.go test.txt
```

**実行結果**

```
ファイル 'test.txt' の行数: 3
```

### **3. `linecount_test.go` (テストコード)**

`CountLines` 関数のテストを作成。

```go
package main

import (
    "io/ioutil"
    "os"
    "testing"
)

func TestCountLines(t *testing.T) {
    // 一時ファイルを作成
    tmpFile, err := ioutil.TempFile("", "testfile*.txt")
    if err != nil {
        t.Fatal(err)
    }
    defer os.Remove(tmpFile.Name()) // テスト後に削除

    content := "Line 1\nLine 2\nLine 3\n"
    if _, err := tmpFile.WriteString(content); err != nil {
        t.Fatal(err)
    }
    tmpFile.Close()

    // CountLines 関数をテスト
    got, err := CountLines(tmpFile.Name())
    if err != nil {
        t.Fatalf("CountLines() エラー: %v", err)
    }

    want := 3
    if got != want {
        t.Errorf("CountLines() = %d, want %d", got, want)
    }
}
```

#### **(4) テスト実行**

```sh
go test ./...
```

**テスト結果**

```
ok      myproject       0.002s
```
