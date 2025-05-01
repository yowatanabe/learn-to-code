package main

import (
	"fmt"
)

func sumOfDigits(n int) int {
    sum := 0
    for n > 0 {
        sum += n % 10
        n /= 10
    }
    return sum
}

func main() {
    fmt.Println(sumOfDigits(123)) // 6
    fmt.Println(sumOfDigits(409)) // 13
    fmt.Println(sumOfDigits(5))   // 5
}
