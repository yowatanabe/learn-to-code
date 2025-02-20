# No.109

Go Modules (`go.mod`) と外部パッケージの管理を学ぶ

## **1. プロジェクトのセットアップ**

```sh
go mod init example.com/go-modules-example
```

- `go mod init <module_name>` を実行すると、`go.mod` ファイルが作成される。

**生成される `go.mod`**

```go
module example.com/go-modules-example

go 1.24.0
```

## **2. 外部パッケージ (`cobra`) のインストール**

```sh
go get github.com/spf13/cobra@latest
```

- `go get` を使って `cobra` をプロジェクトに追加する。

**`go.mod` に `require` が追加される**

```go
require github.com/spf13/cobra v1.9.1
```

**`go.sum` にパッケージのハッシュ情報が追加される**


## **3. `cobra` を使った簡単な CLI ツール**

プロジェクト構成：

```
.
├── cmd
│   ├── hello.go
│   └── root.go
├── go.mod
├── go.sum
└── main.go
```

### **4. `cmd/root.go` の作成**

```go
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// ルートコマンドの作成
var rootCmd = &cobra.Command{
	Use:   "app",
	Short: "サンプルCLIアプリ",
	Long:  "これはGo Modulesを学習するためのCLIツールです。",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("CLIアプリを実行しました！")
	},
}

// コマンドのエントリポイント
func Execute() {
	cobra.CheckErr(rootCmd.Execute())
}
```

### **5. `cmd/hello.go` の作成**

```go
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// "hello" コマンドの作成
var helloCmd = &cobra.Command{
	Use:   "hello",
	Short: "挨拶を表示する",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("こんにちは！Go Modules の学習中です。")
	},
}

func init() {
	rootCmd.AddCommand(helloCmd)
}
```

### **6. `main.go` の作成**

```go
package main

import "example.com/go-modules-example/cmd"

func main() {
	cmd.Execute()
}
```

## **7. 実行**

### **(1) `go run main.go`**

```sh
go run main.go
```

**出力**

```plaintext
CLIアプリを実行しました！
```

### **(2) `hello` コマンドを実行**

```sh
go run main.go hello
```

**出力**

```plaintext
こんにちは！Go Modules の学習中です。
```

## **8. `go install` でバイナリを作成**

```sh
go build -o app
```

**実行**

```sh
./app hello
```

**出力**

```plaintext
こんにちは！Go Modules の学習中です。
```
