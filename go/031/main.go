package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func countCharacters(str string) map[rune]int {
	countMap := make(map[rune]int)

	for _, char := range str {
		countMap[char]++
	}

	return countMap
}

func main() {
	fmt.Print("Input character string: ")
	inputString := bufio.NewReader(os.Stdin)
	input, _ := inputString.ReadString('\n')
	input = strings.TrimSuffix(input, "\n")

	characterCount := countCharacters(input)

	fmt.Println("Character count:")
	for char, count := range characterCount {
		fmt.Printf("%q: %d\n", char, count)
	}
}
