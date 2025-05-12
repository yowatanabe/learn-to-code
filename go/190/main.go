package main

import (
	"fmt"
)

func isAnagram(s string, t string) bool {
    if len(s) != len(t) {
        return false
    }

    count := make(map[rune]int)

    for _, ch := range s {
        count[ch]++
    }

    for _, ch := range t {
        count[ch]--
        if count[ch] < 0 {
            return false
        }
    }

    return true
}

func main() {
    fmt.Println(isAnagram("listen", "silent"))   // true
    fmt.Println(isAnagram("hello", "world"))     // false
    fmt.Println(isAnagram("anagram", "nagaram")) // true
}
