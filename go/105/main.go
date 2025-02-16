package main

import (
	"errors"
	"fmt"
)

func add(a int, b int) int {
	return a + b
}

func divide(a int, b int) (int, int, error) {
	if b == 0 {
		return 0, 0, errors.New("割り算の分母が0です")
	}
	quotient := a / b
	remainder := a % b
	return quotient, remainder, nil
}

func sumAll(numbers ...int) int {
	total := 0
	for _, num := range numbers {
		total += num
	}
	return total
}

func deferExample() {
	defer fmt.Println("1. defer: これは最後に実行されます")
	fmt.Println("2. 通常の処理: これは最初に実行されます")
	defer fmt.Println("3. defer: これは最後から2番目に実行されます")
	fmt.Println("4. 通常の処理: これも通常通り実行されます")
}

func main() {
	// 通常の引数と戻り値
	fmt.Println("=== 合計を返す関数 ===")
	sum := add(10, 20)
	fmt.Printf("10 + 20 = %d\n", sum)

	// 複数戻り値
	fmt.Println("\n=== 複数戻り値の関数 ===")
	quotient, remainder, err := divide(20, 3)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Printf("20 ÷ 3 = %d (余り: %d)\n", quotient, remainder)
	}

	// 可変長引数
	fmt.Println("\n=== 可変長引数の関数 ===")
	total := sumAll(1, 2, 3, 4, 5)
	fmt.Printf("1 + 2 + 3 + 4 + 5 = %d\n", total)

	// defer の使用
	fmt.Println("\n=== defer の例 ===")
	deferExample()
}
