package main

import "fmt"

func countLetters(str string) map[rune]int {
	countMap := make(map[rune]int)

	for _, char := range str {
		countMap[char]++
	}
	return countMap
}

func main() {
	inputString := "Hello, World!"

	result := countLetters(inputString)
	fmt.Println("文字列の中に含まれる各文字の出現回数:")
	for char, count := range result {
		fmt.Printf("%c: %d\n", char, count)
	}
}
