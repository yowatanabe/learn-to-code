package main

import (
	"fmt"
)

func findMax(nums []int) int {
    max := nums[0]
    for _, num := range nums {
        if num > max {
            max = num
        }
    }
    return max
}

func main() {
    fmt.Println(findMax([]int{1, 3, 2, 5, 4}))    // 5
    fmt.Println(findMax([]int{-10, -20, -5}))     // -5
    fmt.Println(findMax([]int{7}))                // 7
}
