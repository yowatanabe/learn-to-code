package main

import (
	"fmt"
)

func containsDuplicate(nums []int) bool {
    seen := make(map[int]bool)
    for _, num := range nums {
        if seen[num] {
            return true
        }
        seen[num] = true
    }
    return false
}

func main() {
    fmt.Println(containsDuplicate([]int{1, 2, 3, 4})) // false
    fmt.Println(containsDuplicate([]int{1, 2, 3, 1})) // true
    fmt.Println(containsDuplicate([]int{}))           // false
}
