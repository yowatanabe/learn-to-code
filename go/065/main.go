package main

import "fmt"

func isPalindrome(s string) bool {
	for i := 0; i < len(s)/2; i++ {
		if s[i] != s[len(s)-i-1] {
			return false
		}
	}
	return true
}

func main() {
	var str string

	fmt.Print("回文の判定をしたい文字列を入力してください: ")
	fmt.Scan(&str)

	if isPalindrome(str) {
		fmt.Printf("%sは回文です\n", str)
	} else {
		fmt.Printf("%sは回文ではありません\n", str)
	}
}
