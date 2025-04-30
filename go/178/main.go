package main

import (
	"fmt"
)

func containsZero(nums []int) bool {
    for _, num := range nums {
        if num == 0 {
            return true
        }
    }
    return false
}

func main() {
    fmt.Println(containsZero([]int{1, 2, 3, 0, 4})) // true
    fmt.Println(containsZero([]int{5, 6, 7}))       // false
    fmt.Println(containsZero([]int{0, 0, 0}))       // true
}
