package main

import (
	"fmt"
)

func maxMinDifference(nums []int) int {
    if len(nums) == 0 {
        panic("配列が空です")
    }

    maxVal, minVal := nums[0], nums[0]
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
    fmt.Println(maxMinDifference([]int{3, 1, 4, 1, 5, 9})) // 8
    fmt.Println(maxMinDifference([]int{10, 10, 10}))      // 0
    fmt.Println(maxMinDifference([]int{-5, 0, 5, 10}))    // 15
}
