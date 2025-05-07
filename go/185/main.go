package main

import (
	"fmt"
)

func countOccurrences(nums []int, target int) int {
    count := 0
    for _, num := range nums {
        if num == target {
            count++
        }
    }
    return count
}

func main() {
    fmt.Println(countOccurrences([]int{1, 2, 3, 2, 4, 2}, 2)) // 3
    fmt.Println(countOccurrences([]int{5, 5, 5, 5, 5}, 5))    // 5
    fmt.Println(countOccurrences([]int{1, 3, 5}, 2))          // 0
}
