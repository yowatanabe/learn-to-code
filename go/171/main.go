package main

import (
	"fmt"
)

func countPositiveNumbers(nums []int) int {
    count := 0
    for _, num := range nums {
        if num > 0 {
            count++
        }
    }
    return count
}

func main() {
    fmt.Println(countPositiveNumbers([]int{1, -2, 3, 0, -5, 6})) // 3
    fmt.Println(countPositiveNumbers([]int{-1, -2, -3}))         // 0
    fmt.Println(countPositiveNumbers([]int{0, 1, 2}))            // 2
}
