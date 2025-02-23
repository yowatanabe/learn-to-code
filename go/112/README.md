# No.112

Goの`channel`を使った並行処理を学ぶ

## **1. `channel` の基本**

`channel` には **バッファなし（同期）** と **バッファあり（非同期）** の2種類があります。

```go
ch := make(chan int)      // バッファなし（同期チャネル）
ch := make(chan int, 5)   // バッファあり（非同期チャネル）
```

- **バッファなし**（`make(chan int)`）は **送信側が受信されるまでブロック** する。
- **バッファあり**（`make(chan int, 5)`）は **指定したバッファ分だけ送信側がブロックされない**。

## **2. 複数の `goroutine` からメッセージを受け取るサンプル**

### **概要**

- 3つの `worker` `goroutine` を並行実行し、`channel` を使って結果を受け取る。
- `select` を使い、どの `worker` からのメッセージも受け取れるようにする。

## **3. コードの説明**

### **`worker` 関数**

```go
func worker(id int, ch chan string) {
	delay := time.Duration(rand.Intn(3000)) * time.Millisecond
	time.Sleep(delay)
	ch <- fmt.Sprintf("ワーカー %d: 完了 (遅延 %v)", id, delay)
}
```

- **ランダムな遅延 (`0〜3秒`) を発生**
- **完了メッセージを `channel` に送信**

### **`main()` の並行処理**

```go
ch := make(chan string)
```

- **バッファなしの `channel` を作成**（ブロックされる）

```go
for i := 1; i <= 3; i++ {
	go worker(i, ch)
}
```

- **3つの `worker` を `goroutine` として並行実行**

### **`select` を使ったチャネル待ち合わせ**

```go
for i := 0; i < 3; i++ {
	select {
	case msg := <-ch:
		fmt.Println(msg)
	}
}
```

- `select` を使うことで **どの `goroutine` の結果でも即座に受信** できる。

## **4. 実行結果**

```plaintext
ワーカー 2: 完了 (遅延 1.2s)
ワーカー 3: 完了 (遅延 2.8s)
ワーカー 1: 完了 (遅延 2.9s)
=== すべてのワーカーが完了しました ===
```

- 各 `worker` の完了時間はランダム。
- **完了した `goroutine` から順に結果を取得** できる。

## **5. `select` の活用例**

### **タイムアウトを設定**

`select` を使うと、タイムアウト処理を実装できる。

```go
select {
case msg := <-ch:
	fmt.Println(msg)
case <-time.After(2 * time.Second):
	fmt.Println("タイムアウト: 2秒以内にレスポンスなし")
}
```

- **2秒以内に `channel` からメッセージが来なければタイムアウト。**
