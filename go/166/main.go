package main

import (
	"fmt"
)

func findMax(nums []int) int {
    maxVal := nums[0]
    for _, num := range nums {
        if num > maxVal {
            maxVal = num
        }
    }
    return maxVal
}

func main() {
    fmt.Println(findMax([]int{3, 1, 4, 1, 5, 9, 2}))   // 9
    fmt.Println(findMax([]int{-7, -3, -10, -2}))       // -2
    fmt.Println(findMax([]int{42}))                    // 42
}
