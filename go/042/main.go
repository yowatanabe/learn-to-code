package main

import (
	"fmt"
	"sort"
)

func sortString(str string) string {
	letters := []rune(str)

	sort.Slice(letters, func(i, j int) bool {
		return letters[i] < letters[j]
	})

	newStr := string(letters)

	return newStr
}

func main() {
	targetStr := "sample word"

	newStr := sortString(targetStr)

	fmt.Println(newStr)
}
