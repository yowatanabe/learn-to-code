package main

import (
	"fmt"
)

func hasPairWithSum(nums []int, target int) bool {
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
    fmt.Println(hasPairWithSum([]int{2, 7, 11, 15}, 9))    // true
    fmt.Println(hasPairWithSum([]int{1, 2, 3, 4}, 8))       // false
    fmt.Println(hasPairWithSum([]int{0, -1, 2, -3, 1}, -2)) // true
}
