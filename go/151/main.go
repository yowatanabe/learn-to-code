package main

import (
	"fmt"
)

func isMonotonic(nums []int) bool {
    increasing := true
    decreasing := true

    for i := 0; i < len(nums)-1; i++ {
        if nums[i] < nums[i+1] {
            decreasing = false
        }
        if nums[i] > nums[i+1] {
            increasing = false
        }
    }

    return increasing || decreasing
}

func main() {
    fmt.Println(isMonotonic([]int{1, 2, 2, 3}))  // true
    fmt.Println(isMonotonic([]int{6, 5, 4, 4}))  // true
    fmt.Println(isMonotonic([]int{1, 3, 2}))     // false
    fmt.Println(isMonotonic([]int{1, 1, 1}))     // true
}
