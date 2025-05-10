package main

import (
	"fmt"
	"strings"
)

func countWords(s string) int {
    words := strings.Fields(s)
    return len(words)
}

func main() {
    fmt.Println(countWords("Go is fun"))         // 3
    fmt.Println(countWords("   Hello   world  ")) // 2
    fmt.Println(countWords(""))                   // 0
}
