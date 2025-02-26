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
