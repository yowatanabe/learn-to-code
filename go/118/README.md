# No.118

Goの `time.Ticker` を使って定期的にログを出力する。

### **1. `ticker_logger.go` (Ticker を使った定期実行)**

```go
package main

import (
    "fmt"
    "log"
    "sync"
    "time"
)

// logJob は定期的に実行するジョブ（ログを出力）
func logJob() {
    log.Println("定期ログ: ジョブを実行しました")
}

func main() {
    ticker := time.NewTicker(5 * time.Second) // 5秒ごとに実行
    defer ticker.Stop()

    quit := make(chan struct{}) // プログラムを終了させるためのチャネル
    var wg sync.WaitGroup
    wg.Add(1) // ゴルーチンの終了を待つ

    go func() {
        defer wg.Done() // ゴルーチン終了時にWaitGroupを減算
        for {
            select {
            case <-ticker.C:
                logJob()
            case <-quit:
                fmt.Println("Tickerを停止しました")
                return
            }
        }
    }()

    // 30秒後にTickerを停止
    time.Sleep(30 * time.Second)
    close(quit) // ゴルーチンに終了を通知
    wg.Wait()   // ゴルーチンの終了を待つ
}
```

### **2. 実行**

```sh
go run ticker_logger.go
```

**出力結果（5秒ごとにログが出力）**

```
2025/03/02 04:43:19 定期ログ: ジョブを実行しました
2025/03/02 04:43:24 定期ログ: ジョブを実行しました
2025/03/02 04:43:29 定期ログ: ジョブを実行しました
2025/03/02 04:43:34 定期ログ: ジョブを実行しました
2025/03/02 04:43:39 定期ログ: ジョブを実行しました
2025/03/02 04:43:44 定期ログ: ジョブを実行しました
Tickerを停止しました
```

### **3. `ticker_logger_test.go` (Ticker の動作テスト)**

以下のテストを作成し、Tickerの挙動を確認します。

```go
package main

import (
    "testing"
    "time"
)

// TestTicker 短時間のTicker動作を確認
func TestTicker(t *testing.T) {
    ticker := time.NewTicker(100 * time.Millisecond)
    defer ticker.Stop()

    timeout := time.After(500 * time.Millisecond) // 500msでタイムアウト
    count := 0

    for {
        select {
        case <-ticker.C:
            count++
        case <-timeout:
            if count < 3 {
                t.Errorf("Expected at least 3 ticks, but got %d", count)
            }
            return
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
ok  	myproject	0.731s
```
