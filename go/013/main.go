package main

import (
	"fmt"
	"math"
)

func isPrime(num int) bool {
	if num <= 1 {
		return false
	}
	if num == 2 {
		return true
	}
	if num%2 == 0 {
		return false
	}
	maxDivisor := int(math.Sqrt(float64(num)))
	for i := 3; i <= maxDivisor; i += 2 {
		if num%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	fmt.Println("整数を入力してください (0を入力すると終了します):")
	for {
		var num int
		fmt.Scanln(&num)

		if num == 0 {
			fmt.Println("プログラムを終了します。")
			break
		}

		if isPrime(num) {
			fmt.Printf("%d は素数です。\n", num)
		} else {
			fmt.Printf("%d は素数ではありません。\n", num)
		}
	}
}
