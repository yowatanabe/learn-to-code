package main

import (
	"fmt"
)

func findMin(nums []int) int {
    minVal := nums[0]
    for _, num := range nums {
        if num < minVal {
            minVal = num
        }
    }
    return minVal
}

func main() {
    fmt.Println(findMin([]int{3, 1, 4, 1, 5, 9}))  // 1
    fmt.Println(findMin([]int{-7, -3, -10, -2}))   // -10
    fmt.Println(findMin([]int{42}))                // 42
}
