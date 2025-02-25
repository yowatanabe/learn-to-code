package mathutil

import "errors"

// Add は2つの数を足す
func Add(a, b int) int {
    return a + b
}

// Subtract は2つの数を引く
func Subtract(a, b int) int {
    return a - b
}

// Multiply は2つの数を掛ける
func Multiply(a, b int) int {
    return a * b
}

// Divide は2つの数を割る（ゼロ除算を考慮）
func Divide(a, b int) (int, error) {
    if b == 0 {
        return 0, errors.New("division by zero")
    }
    return a / b, nil
}
