package main

import "fmt"

func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n-1)
}

func main() {
	var num int

	fmt.Print("任意の数字を指定してください: ")
	_, err := fmt.Scanln(&num)

	if err != nil {
		fmt.Println("任意の数字が入力されませんでした。")
	} else {
		fmt.Printf("%dの階乗は%dです\n", num, factorial(num))
	}
}
