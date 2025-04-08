package main

import (
	"fmt"
	"unicode"
)

func isPalindrome(s string) bool {
    var filtered []rune
    for _, r := range s {
        if unicode.IsLetter(r) || unicode.IsDigit(r) {
            filtered = append(filtered, unicode.ToLower(r))
        }
    }

    left, right := 0, len(filtered)-1
    for left < right {
        if filtered[left] != filtered[right] {
            return false
        }
        left++
        right--
    }
    return true
}

func main() {
    fmt.Println(isPalindrome("A man, a plan, a canal: Panama")) // true
    fmt.Println(isPalindrome("race a car"))                     // false
    fmt.Println(isPalindrome(" "))                              // true
}
