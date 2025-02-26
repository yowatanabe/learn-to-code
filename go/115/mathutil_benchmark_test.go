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
