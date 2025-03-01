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
