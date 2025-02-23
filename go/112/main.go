package main

import (
	"fmt"
	"math/rand"
	"time"
)

func worker(id int, ch chan string) {
	// ランダムな時間スリープ（0〜3秒）
	delay := time.Duration(rand.Intn(3000)) * time.Millisecond
	time.Sleep(delay)
	ch <- fmt.Sprintf("ワーカー %d: 完了 (遅延 %v)", id, delay)
}

func main() {
	rand.Seed(time.Now().UnixNano()) // 乱数のシードを設定

	// メッセージを受け取るチャネル（バッファなし）
	ch := make(chan string)

	// 3つのgoroutineを起動
	for i := 1; i <= 3; i++ {
		go worker(i, ch)
	}

	// 複数のチャネルの受信を `select` で待つ
	for i := 0; i < 3; i++ {
		select {
		case msg := <-ch:
			fmt.Println(msg)
		}
	}

	fmt.Println("=== すべてのワーカーが完了しました ===")
}
