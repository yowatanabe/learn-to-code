package main

import (
	"fmt"
)

func firstUniqueChar(s string) string {
    count := make(map[rune]int)
    for _, ch := range s {
        count[ch]++
    }

    for _, ch := range s {
        if count[ch] == 1 {
            return string(ch)
        }
    }

    return "_"
}

func main() {
    fmt.Println(firstUniqueChar("leetcode"))     // "l"
    fmt.Println(firstUniqueChar("loveleetcode")) // "v"
    fmt.Println(firstUniqueChar("aabb"))         // "_"
}
