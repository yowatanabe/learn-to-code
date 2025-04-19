package main

import (
	"fmt"
)

func hasTwoSum(nums []int, target int) bool {
    seen := make(map[int]bool)
    for _, num := range nums {
        if seen[target-num] {
            return true
        }
        seen[num] = true
    }
    return false
}

func main() {
    fmt.Println(hasTwoSum([]int{2, 7, 11, 15}, 9))  // true
    fmt.Println(hasTwoSum([]int{1, 2, 3, 4}, 8))    // false
    fmt.Println(hasTwoSum([]int{3, 3}, 6))          // true
}
