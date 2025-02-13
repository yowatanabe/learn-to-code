package main

import (
	"fmt"
)

func main() {
	// 定数宣言
	const greeting string = "Hello"
	const pi float64 = 3.14159

	// 変数宣言
	var name string = "Alice"
	var age int = 25
	var height float64 = 5.5
	var isStudent bool = true

	// 短縮変数宣言（関数内でのみ使用可能）
	country := "Japan"
	weight := 55.4

	// 演算
	totalHeight := height + 0.5 // 浮動小数点の加算
	nextAge := age + 1         // 整数の加算
	isAdult := age >= 18       // 論理演算

	// 文字列連結
	fullGreeting := greeting + ", " + name + "!"

	// 出力
	fmt.Println(fullGreeting)
	fmt.Printf("Age: %d, Next Year Age: %d\n", age, nextAge)
	fmt.Printf("Height: %.1f, Total Height: %.1f\n", height, totalHeight)
	fmt.Printf("Country: %s, Weight: %.1f kg\n", country, weight)
	fmt.Printf("Is Student: %t, Is Adult: %t\n", isStudent, isAdult)
	fmt.Printf("Value of Pi: %.5f\n", pi)

	// スコープの確認
	if isAdult {
		status := "Adult" // 短縮変数宣言、ifブロック内スコープ
		fmt.Println("Status:", status)
	}
	// fmt.Println(status) // コンパイルエラー: スコープ外
}
