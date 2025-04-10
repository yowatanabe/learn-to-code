package main

import (
	"fmt"
)

func containsTarget(nums []int, target int) bool {
    for _, num := range nums {
        if num == target {
            return true
        }
    }
    return false
}

func main() {
    fmt.Println(containsTarget([]int{1, 2, 3, 4, 5}, 3))  // true
    fmt.Println(containsTarget([]int{10, 20, 30}, 25))    // false
    fmt.Println(containsTarget([]int{}, 1))               // false
}
