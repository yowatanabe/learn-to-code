package main

import (
	"fmt"
)

func findMin(nums []int) int {
    if len(nums) == 0 {
        panic("配列が空です")
    }
    minVal := nums[0]
    for _, num := range nums {
        if num < minVal {
            minVal = num
        }
    }
    return minVal
}

func main() {
    fmt.Println(findMin([]int{3, 1, 4, 1, 5, 9})) // 1
    fmt.Println(findMin([]int{-10, 0, 10, 20}))   // -10
    fmt.Println(findMin([]int{100}))              // 100
}
