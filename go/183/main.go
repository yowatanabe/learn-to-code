package main

import (
	"fmt"
)

func hasCommonElement(nums1 []int, nums2 []int) bool {
    set := make(map[int]bool)
    for _, num := range nums1 {
        set[num] = true
    }
    for _, num := range nums2 {
        if set[num] {
            return true
        }
    }
    return false
}

func main() {
    fmt.Println(hasCommonElement([]int{7, 8}, []int{9, 10}))     // false
    fmt.Println(hasCommonElement([]int{1, 2, 3}, []int{4, 5, 3})) // true
    fmt.Println(hasCommonElement([]int{}, []int{1, 2, 3}))       // false
}
