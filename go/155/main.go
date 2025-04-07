package main

import (
	"fmt"
)

func maxValue(a, b int) int {
    if a > b {
        return a
    }
    return b
}

func main() {
    fmt.Println(maxValue(3, 5))    // 5
    fmt.Println(maxValue(10, 2))   // 10
    fmt.Println(maxValue(-1, -7))  // -1
}
