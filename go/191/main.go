package main

import (
	"fmt"
)

func isUnique(s string) bool {
    seen := make(map[rune]bool)
    for _, ch := range s {
        if seen[ch] {
            return false
        }
        seen[ch] = true
    }
    return true
}

func main() {
    fmt.Println(isUnique("abcdef")) // true
    fmt.Println(isUnique("hello"))  // false
    fmt.Println(isUnique("world"))  // true
}
