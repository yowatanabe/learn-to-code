package main

import (
	"fmt"
	"unicode"
)

func countLowercase(s string) int {
    count := 0
    for _, r := range s {
        if unicode.IsLower(r) {
            count++
        }
    }
    return count
}

func main() {
    fmt.Println(countLowercase("HelloWorld"))  // 8
    fmt.Println(countLowercase("ABCdefGHI"))   // 3
    fmt.Println(countLowercase("GO"))          // 0
}
