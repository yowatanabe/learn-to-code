package main

import (
	"fmt"
)

func maxMinDifference(nums []int) int {
    maxVal := nums[0]
    minVal := nums[0]

    for _, num := range nums {
        if num > maxVal {
            maxVal = num
        }
        if num < minVal {
            minVal = num
        }
    }

    return maxVal - minVal
}

func main() {
    fmt.Println(maxMinDifference([]int{1, 2, 3, 4, 5}))    // 4
    fmt.Println(maxMinDifference([]int{10, 10, 10}))       // 0
    fmt.Println(maxMinDifference([]int{-3, 0, 7, -1}))     // 10
}
