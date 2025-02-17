package main

import (
	"fmt"
)

// 配列の要素を書き換える関数 (ポインタを使用)
func updateArray(arr *[]int, index int, newValue int) {
	if index < 0 || index >= len(*arr) {
		fmt.Println("エラー: 指定されたインデックスが範囲外です")
		return
	}
	(*arr)[index] = newValue // ポインタを介して値を変更
}

// 整数をポインタで更新する関数
func updateValue(num *int) {
	*num = *num * 2 // 値を2倍にする
}

// ポインタを使ったスワップ関数
func swap(a *int, b *int) {
	*a, *b = *b, *a
}

func main() {
	// スライス（配列）の要素を変更
	numbers := []int{10, 20, 30, 40, 50}
	fmt.Println("変更前の配列:", numbers)

	updateArray(&numbers, 2, 99) // インデックス2の値を99に変更
	fmt.Println("変更後の配列:", numbers)

	// 整数の値をポインタで変更
	num := 10
	fmt.Println("\n変更前の値:", num)

	updateValue(&num) // 値を2倍にする
	fmt.Println("変更後の値:", num)

	// ポインタを使ったスワップ処理
	a, b := 5, 10
	fmt.Printf("\nスワップ前: a = %d, b = %d\n", a, b)

	swap(&a, &b)
	fmt.Printf("スワップ後: a = %d, b = %d\n", a, b)
}
