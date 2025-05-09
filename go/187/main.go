package main

import (
	"fmt"
)

func firstDuplicate(nums []int) int {
    seen := make(map[int]bool)
    for _, num := range nums {
        if seen[num] {
            return num
        }
        seen[num] = true
    }
    return -1
}

func main() {
    fmt.Println(firstDuplicate([]int{1, 2, 3, 2, 4})) // 2
    fmt.Println(firstDuplicate([]int{5, 1, 5, 2, 3})) // 5
    fmt.Println(firstDuplicate([]int{1, 2, 3}))       // -1
}
