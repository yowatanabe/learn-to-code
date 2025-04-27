package main

import (
	"fmt"
)

func isPalindrome(s string) bool {
    left, right := 0, len(s)-1
    for left < right {
        if s[left] != s[right] {
            return false
        }
        left++
        right--
    }
    return true
}

func main() {
    fmt.Println(isPalindrome("racecar")) // true
    fmt.Println(isPalindrome("level"))   // true
    fmt.Println(isPalindrome("hello"))   // false
}
