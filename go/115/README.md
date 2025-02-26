# No.115

**ベンチマークテスト (`Benchmark` 関数)** と **プロファイリング (`pprof`)** を学ぶ。<br>
単純な計算関数をベンチマークし、`go test -bench` でパフォーマンスを測定する。

### **1. `mathutil.go` (ベンチマーク対象のコード)**

```go
package mathutil

// Add は2つの整数を加算する
func Add(a, b int) int {
    return a + b
}

// Multiply は2つの整数を乗算する
func Multiply(a, b int) int {
    return a * b
}

// Fibonacci はn番目のフィボナッチ数を計算する
func Fibonacci(n int) int {
    if n <= 1 {
        return n
    }
    return Fibonacci(n-1) + Fibonacci(n-2)
}
```

### **2. `mathutil_benchmark_test.go` (ベンチマークテスト)**

```go
package mathutil

import "testing"

// ベンチマーク関数の命名規則: BenchmarkXxx(b *testing.B)

func BenchmarkAdd(b *testing.B) {
    for i := 0; i < b.N; i++ {
        Add(10, 20)
    }
}

func BenchmarkMultiply(b *testing.B) {
    for i := 0; i < b.N; i++ {
        Multiply(10, 20)
    }
}

func BenchmarkFibonacci(b *testing.B) {
    for i := 0; i < b.N; i++ {
        Fibonacci(10) // 10番目のフィボナッチ数を求める
    }
}
```

### **3. ベンチマークの実行**

以下のコマンドを実行して、ベンチマークを測定します。

```sh
go test -bench .
```

実行結果 (例)：

```
goos: darwin
goarch: arm64
pkg: myproject
cpu: Apple M1
BenchmarkAdd-8         	1000000000	         0.3144 ns/op
BenchmarkMultiply-8    	1000000000	         0.3158 ns/op
BenchmarkFibonacci-8   	 6566450	       182.3 ns/op
PASS
ok  	myproject	2.296s
```

- `BenchmarkAdd-8` の `1000000000` は 10億回の実行
- `0.3144 ns/op` は 1回の処理時間

### **4. プロファイリング (`pprof`)**

プロファイリングデータを取得するには、以下のコマンドを実行します。

```sh
go test -bench . -cpuprofile cpu.out
```

プロファイルを可視化するには以下のコマンドを実行。

```sh
go tool pprof cpu.out
```

`pprof` の対話モードで以下を試せます：

```sh
top 10  # 最も負荷の高い関数を表示
web     # グラフをブラウザで開く（Graphvizが必要）
```

実行結果 (例)：

```
File: myproject.test
Type: cpu
Time: 2025-02-27 06:20:39 JST
Duration: 2.22s, Total samples = 1.80s (81.08%)
Entering interactive mode (type "help" for commands, "o" for options)
(pprof) top 10
Showing nodes accounting for 1.80s, 100% of 1.80s total
Showing top 10 nodes out of 30
      flat  flat%   sum%        cum   cum%
     1.10s 61.11% 61.11%      1.10s 61.11%  myproject.Fibonacci
     0.31s 17.22% 78.33%      0.33s 18.33%  myproject.BenchmarkAdd
     0.29s 16.11% 94.44%      0.30s 16.67%  myproject.BenchmarkMultiply
     0.05s  2.78% 97.22%      0.05s  2.78%  runtime.pthread_cond_signal
     0.03s  1.67% 98.89%      0.03s  1.67%  runtime.asyncPreempt
     0.01s  0.56% 99.44%      0.01s  0.56%  runtime.kevent
     0.01s  0.56%   100%      0.01s  0.56%  runtime.usleep
         0     0%   100%      1.10s 61.11%  myproject.BenchmarkFibonacci
         0     0%   100%      0.01s  0.56%  runtime.gcMarkTermination.func3
         0     0%   100%      0.05s  2.78%  runtime.gopreempt_m
```

### **まとめ**

- `Benchmark` を使って関数のパフォーマンス測定
- `go test -bench .` でベンチマーク実行
- `go test -bench . -cpuprofile cpu.out` でプロファイリング
- `go tool pprof cpu.out` で詳細分析
