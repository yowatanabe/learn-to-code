package main

import (
	"fmt"
	"unicode"
)

func sumOfDigits(s string) int {
    sum := 0
    for _, ch := range s {
        if unicode.IsDigit(ch) {
            sum += int(ch - '0')
        }
    }
    return sum
}

func main() {
    fmt.Println(sumOfDigits("a1b2c3")) // 6
    fmt.Println(sumOfDigits("abc"))    // 0
    fmt.Println(sumOfDigits("5a9b"))   // 14
}
