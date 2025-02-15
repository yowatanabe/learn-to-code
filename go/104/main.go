package main

import (
	"fmt"
)

func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		a, b = b, a+b
	}
	fmt.Println()
}

func timesTable() {
	for i := 1; i <= 9; i++ {
		for j := 1; j <= 9; j++ {
			fmt.Printf("%d x %d = %2d\t", i, j, i*j)
		}
		fmt.Println()
	}
}

func checkNumber(num int) {
	switch {
	case num%3 == 0 && num%5 == 0:
		fmt.Printf("%dは3と5の両方で割り切れる (FizzBuzz)\n", num)
	case num%3 == 0:
		fmt.Printf("%dは3で割り切れる (Fizz)\n", num)
	case num%5 == 0:
		fmt.Printf("%dは5で割り切れる (Buzz)\n", num)
	default:
		fmt.Printf("%dは3でも5でも割り切れない\n", num)
	}

	// fallthrough の例 (条件を無視して次のケースに進む)
	switch num {
	case 10:
		fmt.Println("数値は10です")
		fallthrough
	case 20:
		fmt.Println("数値は20か10です (fallthrough)")
	default:
		fmt.Println("fallthroughがここに来ました")
	}
}

func main() {
	// フィボナッチ数列
	fmt.Println("=== フィボナッチ数列 ===")
	fibonacci(10) // 最初の10個のフィボナッチ数列を出力

	// 九九の表
	fmt.Println("\n=== 九九の表 ===")
	timesTable()

	// switchの複数条件とfallthrough
	fmt.Println("\n=== 条件分岐とswitchの例 ===")
	checkNumber(10)
	checkNumber(25)
	checkNumber(30)
}
