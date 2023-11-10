package main

import (
	"fmt"
	"math/big"
	"os"
	"strconv"
)

func factorial(n int64) *big.Int {
	result := big.NewInt(1)
	for i := int64(2); i <= n; i++ {
		result.Mul(result, big.NewInt(i))
	}
	return result
}

func getInput() (int64, error) {
	var inputStr string
	fmt.Scanln(&inputStr)

	input, err := strconv.ParseInt(inputStr, 10, 64)
	if err != nil {
		return 0, fmt.Errorf("数値を入力してください")
	}

	if input < 0 {
		return 0, fmt.Errorf("負の数は入力できません")
	}

	return input, nil
}

func main() {
	fmt.Print("数値を入力してください: ")
	input, err := getInput()
	if err != nil {
		fmt.Println("エラー:", err)
		os.Exit(1)
	}

	result := factorial(input)
	fmt.Printf("%dの階乗は%sです\n", input, result.String())
}
