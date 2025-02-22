package main

import (
	"fmt"
	"sync"
	"time"
)

// 重い処理を模擬する関数
func task(name string, delay time.Duration, wg *sync.WaitGroup) {
	defer wg.Done() // 終了時にカウンターを減らす
	fmt.Printf("%s 開始\n", name)
	time.Sleep(delay) // 遅延（処理時間のシミュレーション）
	fmt.Printf("%s 終了\n", name)
}

func main() {
	var wg sync.WaitGroup

	fmt.Println("=== 並行処理開始 ===")

	// 3つのgoroutineを起動
	wg.Add(3) // 待機カウンターを3に設定
	go task("タスク1", 2*time.Second, &wg)
	go task("タスク2", 1*time.Second, &wg)
	go task("タスク3", 3*time.Second, &wg)

	wg.Wait() // 全てのgoroutineの終了を待つ
	fmt.Println("=== すべてのタスクが完了しました ===")
}
