package main

import "fmt"

func printWordLengths(words []string) {
	for _, word := range words {
		fmt.Printf("単語: %s, 文字数: %d\n", word, len(word))
	}
}

func main() {
	wordList := []string{"hogehoge", "Hello World!"}
	printWordLengths(wordList)
}
