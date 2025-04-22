package main

import (
	"fmt"
	"unicode"
)

func isAllLowercase(s string) bool {
    for _, r := range s {
        if !unicode.IsLower(r) {
            return false
        }
    }
    return true
}

func main() {
    fmt.Println(isAllLowercase("leetcode"))   // true
    fmt.Println(isAllLowercase("LeetCode"))    // false
    fmt.Println(isAllLowercase("hello123"))    // false
    fmt.Println(isAllLowercase("abcxyz"))      // true
}
