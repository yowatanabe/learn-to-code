package main

import (
	"errors"
	"fmt"
	"io"
	"math/rand"
	"net/http"
	"time"

	"github.com/cenkalti/backoff/v4"
	"github.com/sony/gobreaker"
)

// サーキットブレーカーの設定
var cb *gobreaker.CircuitBreaker

func init() {
    cb = gobreaker.NewCircuitBreaker(gobreaker.Settings{
        Name:        "API Circuit Breaker",
        MaxRequests: 5,                  // 半開状態で許可するリクエスト数
        Interval:    10 * time.Second,    // 失敗カウントのリセット間隔
        Timeout:     5 * time.Second,     // ブレーカーが開くまでの時間
        ReadyToTrip: func(counts gobreaker.Counts) bool {
            return counts.ConsecutiveFailures > 3 // 3回連続で失敗したら開く
        },
    })
}

// 外部 API 呼び出し（リトライ & サーキットブレーカー適用）
func callAPI(url string) (string, error) {
    operation := func() error {
        result, err := cb.Execute(func() (interface{}, error) {
            // ここで外部 API を呼び出す
            resp, err := http.Get(url)
            if err != nil {
                return nil, err
            }
            defer resp.Body.Close()

            if resp.StatusCode >= 500 {
                return nil, errors.New("server error")
            }

            body, err := io.ReadAll(resp.Body)
            if err != nil {
                return nil, err
            }
            return string(body), nil
        })

        if err != nil {
            return err
        }

        fmt.Println("API Response:", result.(string))
        return nil
    }

    // エクスポネンシャルバックオフの設定
    expBackoff := backoff.NewExponentialBackOff()
    expBackoff.InitialInterval = 1 * time.Second
    expBackoff.MaxElapsedTime = 15 * time.Second // 15秒間リトライする

    err := backoff.Retry(operation, expBackoff)
    if err != nil {
        return "", err
    }

    return "API 呼び出し成功", nil
}

func main() {
    rand.Seed(time.Now().UnixNano())

    url := "https://httpbin.org/status/500" // 失敗しやすいエンドポイントを使用

    fmt.Println("API 呼び出し開始...")
    result, err := callAPI(url)
    if err != nil {
        fmt.Println("API 失敗:", err)
    } else {
        fmt.Println(result)
    }
}
