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
