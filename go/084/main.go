package main

import (
	"fmt"
	"strings"
)

func removeDuplicate(input string) string {
	result := ""

	for _, char := range input {
		if !strings.ContainsRune(result, char) {
			result += string(char)
		}
	}
	return result
}

func main() {
	inputString := "hogehoge fugafuga"
	fmt.Println("入力された文字列:", inputString)

	resultString := removeDuplicate(inputString)
	fmt.Println("重複を取り除いた文字列:", resultString)
}
