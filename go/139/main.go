package main

import (
	"fmt"
)

// 偶数の個数をカウントする関数
func countEvens(nums []int) int {
    count := 0
    for _, num := range nums {
        if num%2 == 0 {
            count++
        }
    }
    return count
}

func main() {
    fmt.Println(countEvens([]int{1, 2, 3, 4, 5, 6}))
    fmt.Println(countEvens([]int{7, 11, 13}))
    fmt.Println(countEvens([]int{-2, 0, 3, 5, 8}))
}
