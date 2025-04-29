package main

import (
	"fmt"
)

func isMultipleOfTen(n int) bool {
    return n%10 == 0
}

func main() {
    fmt.Println(isMultipleOfTen(20)) // true
    fmt.Println(isMultipleOfTen(33)) // false
    fmt.Println(isMultipleOfTen(0))  // true
}
