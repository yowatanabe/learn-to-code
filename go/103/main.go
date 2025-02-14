package main

import (
	"fmt"
)

func main() {
	// スライスの作成と操作
	fmt.Println("=== スライスの操作 ===")
	numbers := []int{1, 2, 3, 4} // 初期化
	fmt.Println("初期スライス:", numbers)

	// スライスに要素を追加
	numbers = append(numbers, 5, 6)
	fmt.Println("要素追加後:", numbers)

	// スライスから要素を削除（例: インデックス2の要素を削除）
	indexToRemove := 2
	numbers = append(numbers[:indexToRemove], numbers[indexToRemove+1:]...)
	fmt.Println("要素削除後:", numbers)

	// スライスを range で繰り返し処理
	fmt.Println("スライスの要素を繰り返し処理:")
	for i, num := range numbers {
		fmt.Printf("Index: %d, Value: %d\n", i, num)
	}

	// マップの作成と操作
	fmt.Println("\n=== マップの操作 ===")
	employeeSalaries := map[string]int{
		"Alice": 50000,
		"Bob":   60000,
		"Charlie": 70000,
	} // 初期化
	fmt.Println("初期マップ:", employeeSalaries)

	// マップに要素を追加または更新
	employeeSalaries["Diana"] = 80000 // 新しいキーを追加
	employeeSalaries["Alice"] = 55000 // 既存のキーを更新
	fmt.Println("要素追加・更新後:", employeeSalaries)

	// マップから要素を削除
	delete(employeeSalaries, "Bob")
	fmt.Println("要素削除後:", employeeSalaries)

	// マップを range で繰り返し処理
	fmt.Println("マップの要素を繰り返し処理:")
	for name, salary := range employeeSalaries {
		fmt.Printf("Name: %s, Salary: %d\n", name, salary)
	}
}
