package main

import (
	"context"
	"fmt"
	"math/rand"
	"time"
)

// ワーカー関数
func worker(ctx context.Context, id int) {
	for {
		select {
		case <-ctx.Done(): // キャンセルシグナルを受け取ったら終了
			fmt.Printf("ワーカー %d: キャンセルされました\n", id)
			return
		default:
			// ランダムな処理時間をシミュレーション
			workTime := time.Duration(rand.Intn(500)+500) * time.Millisecond
			time.Sleep(workTime)
			fmt.Printf("ワーカー %d: 処理完了 (%v)\n", id, workTime)
		}
	}
}

func main() {
	rand.Seed(time.Now().UnixNano())

	// Context の作成（キャンセル可能）
	ctx, cancel := context.WithCancel(context.Background())

	// 3つのワーカーを起動
	for i := 1; i <= 3; i++ {
		go worker(ctx, i)
	}

	// 3秒後にキャンセルを実行
	time.Sleep(3 * time.Second)
	fmt.Println("メイン処理: キャンセルを実行します")
	cancel()

	// ワーカーが終了するのを待つ
	time.Sleep(1 * time.Second)
	fmt.Println("メイン処理: すべてのワーカーが停止しました")
}
