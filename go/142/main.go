package main

import (
	"fmt"
)

func intersection(nums1 []int, nums2 []int) []int {
    set1 := make(map[int]bool)
    for _, n := range nums1 {
        set1[n] = true
    }

    resultSet := make(map[int]bool)
    for _, n := range nums2 {
        if set1[n] {
            resultSet[n] = true
        }
    }

    result := []int{}
    for n := range resultSet {
        result = append(result, n)
    }

    return result
}

func main() {
    fmt.Println(intersection([]int{1, 2, 2, 1}, []int{2, 2}))           // [2]
    fmt.Println(intersection([]int{4, 9, 5}, []int{9, 4, 9, 8, 4}))     // [4 9] または [9 4]
}
