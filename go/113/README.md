# No.113

`context` パッケージを使用して、タイムアウト制御やキャンセル処理の実装を学ぶ。

## **1. `context` を使ったキャンセル処理**

`context.WithCancel()` を使用して、特定の条件で `goroutine` をキャンセルする例を紹介します。

### **サンプルコード**

```go
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
```

## **2. コードの説明**

### **`context.WithCancel()` を使用**

```go
ctx, cancel := context.WithCancel(context.Background())
```

- `context.Background()` を基にキャンセル可能な `context` を作成。
- `cancel()` を呼び出すと、関連するすべての `goroutine` にキャンセルシグナルが送信される。

### **`worker()` の動作**

```go
for {
	select {
	case <-ctx.Done(): // キャンセル通知を受信
		fmt.Printf("ワーカー %d: キャンセルされました\n", id)
		return
	default:
		// ランダムな処理時間をシミュレーション
		workTime := time.Duration(rand.Intn(500)+500) * time.Millisecond
		time.Sleep(workTime)
		fmt.Printf("ワーカー %d: 処理完了 (%v)\n", id, workTime)
	}
}
```

- `ctx.Done()` が閉じられると、ワーカーは即座に終了する。
- `default:` で通常の処理を実行。

### **`main()` の動作**

```go
time.Sleep(3 * time.Second)
fmt.Println("メイン処理: キャンセルを実行します")
cancel()
```

- **3秒後に `cancel()` を呼び出し、すべての `worker` を停止**。
- `goroutine` は `ctx.Done()` を検知し、クリーンアップして終了。

## **3. 実行結果**

```plaintext
ワーカー 1: 処理完了 (600ms)
ワーカー 3: 処理完了 (750ms)
ワーカー 2: 処理完了 (850ms)
ワーカー 1: 処理完了 (500ms)
ワーカー 3: 処理完了 (950ms)
ワーカー 2: 処理完了 (700ms)
メイン処理: キャンセルを実行します
ワーカー 1: キャンセルされました
ワーカー 2: キャンセルされました
ワーカー 3: キャンセルされました
メイン処理: すべてのワーカーが停止しました
```

- 3秒間ワーカーが動作し、その後キャンセルされる。

## **4. `context.WithTimeout()` を使ったタイムアウト処理**

次に、**一定時間経過後に自動的にキャンセルされる** `context.WithTimeout()` を使った例を示します。

### **サンプルコード**

```go
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
```

## **5. `WithTimeout()` の動作**

```go
ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
```

- **5秒後に `context` が自動キャンセルされる**。

```go
<-ctx.Done()
fmt.Println("メイン処理: タイムアウトしました")
```

- **`ctx.Done()` が閉じられるとメイン処理が終了**。

## **6. 実行結果**

```plaintext
ワーカー 1: 処理完了 (700ms)
ワーカー 2: 処理完了 (800ms)
ワーカー 3: 処理完了 (500ms)
ワーカー 1: 処理完了 (900ms)
ワーカー 2: 処理完了 (600ms)
ワーカー 3: 処理完了 (750ms)
ワーカー 1: タイムアウトしました
ワーカー 2: タイムアウトしました
ワーカー 3: タイムアウトしました
メイン処理: タイムアウトしました
```

- **5秒後にすべてのワーカーが強制停止**。

## **7. まとめ**

| **ポイント** | **解説** |
|-------------|---------|
| `context.WithCancel()` | `cancel()` を呼ぶとすべての `goroutine` がキャンセルされる。 |
| `context.WithTimeout()` | 一定時間後に自動キャンセルされる。 |
| `ctx.Done()` | `context` がキャンセルされたときに通知を受け取る。 |
| `defer cancel()` | `main()` 終了時に確実に `context` をクリーンアップする。 |
