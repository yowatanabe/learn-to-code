package main

import (
	"fmt"
)

func firstUniqChar(s string) int {
    freq := make(map[rune]int)
    for _, ch := range s {
        freq[ch]++
    }

    for i, ch := range s {
        if freq[ch] == 1 {
            return i
        }
    }
    return -1
}

func main() {
    fmt.Println(firstUniqChar("leetcode"))      // 0
    fmt.Println(firstUniqChar("loveleetcode"))  // 2
    fmt.Println(firstUniqChar("aabb"))          // -1
}
