# No.137

Go アプリ + Redis を Docker Compose で起動し、Go アプリから Redis に接続してデータを保存・取得するサンプルコード

## **1. `docker-compose.yml`（Go アプリ + Redis）**

```yaml
services:
  go-app:
    build: .
    ports:
      - "8080:8080"
    environment:
      - REDIS_HOST=redis
      - REDIS_PORT=6379
    depends_on:
      - redis

  redis:
    image: redis:latest
    ports:
      - "6379:6379"
    restart: always
```

**この設定のポイント**

- `go-app` は **`redis` の起動を待つ (`depends_on`)**
- 環境変数 (`REDIS_HOST`, `REDIS_PORT`) で **Redis のホストを `redis` に指定**
- `redis` コンテナが **ポート `6379` で起動**

## **2. `main.go`（Go アプリから Redis に接続）**

```go
package main

import (
    "context"
    "fmt"
    "log"
    "net/http"
    "os"
    "time"

    "github.com/redis/go-redis/v9"
)

var redisClient *redis.Client
var ctx = context.Background()

func initRedis() {
    redisHost := os.Getenv("REDIS_HOST")
    redisPort := os.Getenv("REDIS_PORT")
    redisAddr := fmt.Sprintf("%s:%s", redisHost, redisPort)

    redisClient = redis.NewClient(&redis.Options{
        Addr:     redisAddr,
        Password: "", // Redis にパスワードが必要ならここに設定
        DB:       0,  // デフォルト DB を使用
    })

    _, err := redisClient.Ping(ctx).Result()
    if err != nil {
        log.Fatalf("Redis 接続エラー: %v", err)
    }
    log.Println("✅ Redis に接続しました")
}

func setHandler(w http.ResponseWriter, r *http.Request) {
    err := redisClient.Set(ctx, "message", "Hello, Redis!", 10*time.Minute).Err()
    if err != nil {
        http.Error(w, "データ保存エラー", http.StatusInternalServerError)
        return
    }
    fmt.Fprintln(w, "✅ Redis にデータを保存しました")
}

func getHandler(w http.ResponseWriter, r *http.Request) {
    value, err := redisClient.Get(ctx, "message").Result()
    if err == redis.Nil {
        http.Error(w, "データなし", http.StatusNotFound)
        return
    } else if err != nil {
        http.Error(w, "データ取得エラー", http.StatusInternalServerError)
        return
    }
    fmt.Fprintf(w, "✅ Redis から取得: %s\n", value)
}

func main() {
    initRedis()

    http.HandleFunc("/set", setHandler)
    http.HandleFunc("/get", getHandler)

    log.Println("🌍 サーバーをポート 8080 で起動中...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

**このコードのポイント**

- **Redis に接続 (`redis.NewClient`)**
- `/set` エンドポイントで `"message"` というキーを **Redis に保存**
- `/get` エンドポイントで **Redis から `"message"` を取得**

## **3. `Dockerfile`（Go アプリをコンテナ化）**

```dockerfile
# 1. ビルド用の Go イメージ
FROM golang:1.21 AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod tidy
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o app

# 2. 実行用の軽量イメージ (Alpine)
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
```

**Go アプリを `Alpine` で軽量化し、`Redis` との通信を確保**

## **4. `docker-compose` で起動**

```sh
docker-compose up --build
```

**成功すると**

```
go-app-1  | 2025/03/20 20:30:15 ✅ Redis に接続しました
go-app-1  | 2025/03/20 20:30:15 🌍 サーバーをポート 8080 で起動中...
```

## **5. 動作確認 (`curl` でテスト)**

1. **Redis にデータを保存**

```sh
curl http://localhost:8080/set
```

**レスポンス**

```
✅ Redis にデータを保存しました
```

2. **Redis からデータを取得**

```sh
curl http://localhost:8080/get
```


**レスポンス**

```
✅ Redis から取得: Hello, Redis!
```
