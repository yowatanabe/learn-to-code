package main

import (
	"context"
	"fmt"
	"math/rand"
	"time"
)

func worker(ctx context.Context, id int) {
	for {
		select {
		case <-ctx.Done():
			fmt.Printf("ワーカー %d: タイムアウトしました\n", id)
			return
		default:
			workTime := time.Duration(rand.Intn(500)+500) * time.Millisecond
			time.Sleep(workTime)
			fmt.Printf("ワーカー %d: 処理完了 (%v)\n", id, workTime)
		}
	}
}

func main() {
	rand.Seed(time.Now().UnixNano())

	// 5秒で自動的にタイムアウトする Context を作成
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel() // `main()` 終了時にキャンセル

	// 3つのワーカーを起動
	for i := 1; i <= 3; i++ {
		go worker(ctx, i)
	}

	// ワーカーが終了するのを待つ
	<-ctx.Done()
	fmt.Println("メイン処理: タイムアウトしました")
}
