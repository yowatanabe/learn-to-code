# No.136

Go アプリを Docker コンテナ化** するための `Dockerfile` と `docker-compose.yml` のサンプル

## **1. `main.go`（Go アプリ）**

シンプルな **HTTP サーバー** を用意します。

```go
package main

import (
    "fmt"
    "log"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, Dockerized Go App!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("サーバーをポート 8080 で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

## **2. `Dockerfile`（Go アプリをコンテナ化）**

```dockerfile
# 1. ビルド用のステージ
FROM golang:1.24.1 AS builder
WORKDIR /app

# 必要なファイルをコピー
COPY go.mod ./
RUN go mod tidy

# ソースコードをコピー
COPY . .

# 静的リンクでビルド
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

# 2. 実行用の軽量イメージ（Alpine ベース）
FROM alpine:latest
WORKDIR /app

# ビルド済みのバイナリをコピー
COPY --from=builder /app/app .

# ポート 8080 を開放
EXPOSE 8080

# アプリを実行
CMD ["./app"]
```

## **3. `docker-compose.yml`（複数コンテナの管理）**

```yaml
version: "3.8"

services:
  go-app:
    build: .
    ports:
      - "8080:8080"
    environment:
      - PORT=8080
    restart: always
```

## **4. Docker コンテナのビルド & 実行**

### **(1) `Dockerfile` を使ってビルド & 実行**

```sh
docker build -t go-app .
docker run -p 8080:8080 go-app
```

### **(2) `docker-compose` で実行**

```sh
docker-compose up --build
```

---

## **5. テスト（`curl` で確認）**
Go アプリがコンテナで動作しているか **ローカルでテスト** します。

```sh
curl http://localhost:8080/
```

✅ **レスポンス**
```
Hello, Dockerized Go App!
```

---

## **🎯 まとめ**
✅ **`Dockerfile` で Go アプリをコンテナ化**
✅ **`docker-compose.yml` で簡単に管理**
✅ **`curl` でローカルテスト**

🚀 **この構成で Go アプリを Docker コンテナで動作させ、開発環境を構築できます！**
試してみて、質問があれば教えてください！
