# No.135

Go の `github.com/sony/gobreaker` を使用して、外部 API 呼び出しに対するリトライ & サーキットブレーカーを実装するサンプルコード

## **1. 依存パッケージのインストール**

```sh
go get -u github.com/sony/gobreaker
go get -u github.com/cenkalti/backoff/v4
```

- `gobreaker`: サーキットブレーカーの実装
- `backoff`: リトライ処理を簡単に実装するライブラリ

## **2. `main.go`（外部 API 呼び出しにリトライ & サーキットブレーカーを適用）**

```go
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
```

## **3. コードのポイント**

1. **サーキットブレーカー (`gobreaker`)**
   - **連続 3 回の失敗** でサーキットブレーカーを開く
   - **10 秒間** 失敗がなければリセット
   - **半開状態で 5 回のリクエストを許可**

2. **リトライ (`backoff`)**
   - **指数バックオフ (Exponential Backoff)**
   - **最大 15 秒間リトライ**

3. **エラーハンドリング**
   - **`500` 系エラーが返ってきたらリトライ**
   - **サーキットブレーカーが開いた場合は即座にエラー**

## **4. 実行方法**

```sh
go run main.go
```

**成功例**

```
API 呼び出し開始...
API Response: OK
API 呼び出し成功
```

**エラー例（サーキットブレーカー発動）**

```
API 呼び出し開始...
API 失敗: circuit breaker is open
```
