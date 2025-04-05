package main

import (
	"fmt"
)

func countOnes(n int) int {
    count := 0
    for n > 0 {
        if n%2 == 1 {
            count++
        }
        n = n / 2
    }
    return count
}

func main() {
    fmt.Println(countOnes(5))   // 2
    fmt.Println(countOnes(0))   // 0
    fmt.Println(countOnes(15))  // 4
}
