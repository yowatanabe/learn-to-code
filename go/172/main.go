package main

import (
	"fmt"
)

func countEvenOdd(nums []int) (int, int) {
    even, odd := 0, 0
    for _, num := range nums {
        if num%2 == 0 {
            even++
        } else {
            odd++
        }
    }
    return even, odd
}

func main() {
    e, o := countEvenOdd([]int{1, 2, 3, 4, 5})
    fmt.Printf("偶数: %d, 奇数: %d\n", e, o) // 偶数: 2, 奇数: 3

    e, o = countEvenOdd([]int{0, 2, 4, 6})
    fmt.Printf("偶数: %d, 奇数: %d\n", e, o) // 偶数: 4, 奇数: 0

    e, o = countEvenOdd([]int{1, 3, 5, 7})
    fmt.Printf("偶数: %d, 奇数: %d\n", e, o) // 偶数: 0, 奇数: 4
}
