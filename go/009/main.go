package main

import "fmt"

func main() {
    words := []string{"apple", "banana", "cherry", "date", "fig"}

    targetWord := "cherry"
    if containsWord(words, targetWord) {
        fmt.Printf("'%s' はスライス内に存在します。\n", targetWord)
    } else {
        fmt.Printf("'%s' はスライス内に存在しません。\n", targetWord)
    }
}

func containsWord(words []string, word string) bool {
    for _, w := range words {
        if w == word {
            return true
        }
    }
    return false
}
