# No.101

## **1. Goのインストールと環境セットアップ**

1. **公式サイトからインストール**
   - Go公式サイト ([https://go.dev/dl/](https://go.dev/dl/)) からOSに対応したインストーラーをダウンロードしてインストールします。

2. **環境変数を確認**
   - インストール後、`go version`を実行してバージョンを確認します。

     ```bash
     go version
     ```

   - `go env`を使ってGoの設定が正しく反映されているか確認します。

     ```bash
     go env
     ```

3. **エディタのセットアップ**
   - Visual Studio Code (VS Code)をインストールして、[Goプラグイン](https://marketplace.visualstudio.com/items?itemName=golang.Go)を有効化します。
   - プラグインが自動的に必要なGoツールをインストールします。

## **2. Goプロジェクトの初期化**

1. **プロジェクトディレクトリの作成**
   - ターミナルで作業ディレクトリを作成します。

     ```bash
     mkdir hello-go
     cd hello-go
     ```

2. **`go mod init`の実行**
   - Go Modulesを初期化します（プロジェクト名を`hello-go`と設定）。

     ```bash
     go mod init hello-go
     ```

   - これにより、`go.mod`というファイルが作成されます。これがプロジェクトの依存関係を管理します。

### **3. プログラムを作成**

1. **`main.go`ファイルを作成**
   - プロジェクトフォルダ内に`main.go`という名前のファイルを作成し、以下のコードを書きます。

     ```go
     package main

     import "fmt"

     func main() {
         fmt.Println("Hello, Go!")
     }
     ```

2. **コードの実行**
   - 以下のコマンドでプログラムを実行します。

     ```bash
     go run main.go
     ```

   - 実行結果:

     ```bash
     Hello, Go!
     ```

### **4. プログラムをビルドしてバイナリを生成**

1. **ビルドコマンドの実行**
   - コードをビルドして実行可能なバイナリを作成します。

     ```bash
     go build -o hello-go
     ```

   - これにより、現在のディレクトリに`hello-go`という実行可能ファイルが生成されます。

2. **バイナリの実行**
   - ビルドされたバイナリを直接実行します。

     ```bash
     ./hello-go
     ```

   - 実行結果:

     ```bash
     Hello, Go!
     ```
