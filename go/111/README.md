# No.111

Goの`goroutine`を使った並行処理を学ぶ

## **1. コードの説明**

1. **`go task()` で並行処理を実行**
   - `task` 関数が `goroutine` として実行される。
   - `time.Sleep()` を使って処理時間のシミュレーション。

2. **`sync.WaitGroup` を使用**
   - `wg.Add(n)` で待機する `goroutine` の数を設定。
   - `wg.Done()` で `goroutine` 終了時にカウンターを減らす。
   - `wg.Wait()` で全 `goroutine` の終了を待機。

## **2. 実行結果**

```plaintext
=== 並行処理開始 ===
タスク1 開始
タスク2 開始
タスク3 開始
タスク2 終了
タスク1 終了
タスク3 終了
=== すべてのタスクが完了しました ===
```

- `タスク2` は `1秒` で完了し、`タスク1` (`2秒`)、`タスク3` (`3秒`) の順に終了。

## **3. `goroutine` の利点と注意点**

### **✅ 利点**

1. **簡単に並行処理を実装可能**
   - `go func()` を使うだけで `goroutine` を開始できる。
2. **シンプルで軽量**
   - Go の `goroutine` はスレッドより軽量（数百万の `goroutine` も実行可能）。
3. **I/O や待機時間を有効活用**
   - `time.Sleep()` などの待機時間を並行処理で最適化。

### **⚠️ 注意点**

1. **`goroutine` の終了を待たないとプログラムが終了する**
   - `sync.WaitGroup` を使わないと、`main()` が終了して `goroutine` も終了してしまう。

2. **競合状態（Race Condition）**
   - `goroutine` で同じ変数を同時に変更すると予期しない動作が発生。
   - `sync.Mutex` や `sync/atomic` を使って同期する。

3. **ゴルーチンリーク**
   - `goroutine` を適切に終了しないと、不要な `goroutine` が残り続ける。

## **4. 応用：チャネルを使った`goroutine`の通信**

`goroutine` 同士でデータをやり取りするには **チャネル (`channel`)** を使用。

```go
package main

import (
	"fmt"
	"time"
)

func worker(id int, ch chan string) {
	time.Sleep(time.Duration(id) * time.Second)
	ch <- fmt.Sprintf("ワーカー %d 完了", id)
}

func main() {
	ch := make(chan string, 3) // バッファ付きチャネル

	fmt.Println("=== ワーカー開始 ===")
	go worker(1, ch)
	go worker(2, ch)
	go worker(3, ch)

	// 3つのgoroutineの結果を受け取る
	for i := 0; i < 3; i++ {
		fmt.Println(<-ch)
	}
	fmt.Println("=== すべてのワーカーが完了しました ===")
}
```

**✅ `chan` を使って `goroutine` の完了を待つ**

- `ch <- "完了メッセージ"` で `goroutine` からメッセージ送信。
- `<-ch` で `main()` がメッセージを受信。

## **5. まとめ**

- **`goroutine` で並行処理を簡単に実装**
- **`sync.WaitGroup` で終了を待つ**
- **競合状態に注意し、適切に同期する**
- **チャネル (`chan`) を使うと `goroutine` 間で通信可能**
